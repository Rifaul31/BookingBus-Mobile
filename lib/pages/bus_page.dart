import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:boobus/models/bus_model.dart';
import 'package:boobus/pages/bus_list_page.dart';

class BusPage extends StatefulWidget {
  @override
  _BusPageState createState() => _BusPageState();
}

class _BusPageState extends State<BusPage> {
  List<String> locations = ['Bandung', 'Jakarta', 'Jogjakarta', 'Bogor'];
  final initialDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  late DateTime _selectedDate;
  TextEditingController _textEditingController = TextEditingController();
  String _departure = '';
  String _destination = '';
  int _seats = 0;

  
  setLocation (loc, place){
    loc = place;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              SizedBox(height: 60),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(width: 25),
                Container(
                  width: 400,
                  child: DropdownSearch<String>(
                    showSelectedItem: true,
                    items: locations,
                    hint: 'City, area, or boarding point',
                    selectedItem: 'City, area, or boarding point',
                    onChanged: (String data){
                      _departure = data;
                      // print(_departure);
                    },
                    dropdownSearchDecoration: InputDecoration(
                      labelText: 'From',
                    ),
                    validator: (String? item) {
                      if (item == null || item == 'City, area, or boarding point'){
                        return 'Required field';
                      } 
                      else return null;
                    },
                  )
                ),
                ]
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(width: 25),
                Container(
                  width: 400,
                  child: DropdownSearch<String>(
                    showSelectedItem: true,
                    items: locations,
                    hint: 'City, area, or boarding point',
                    selectedItem: 'City, area, or boarding point',
                    onChanged: (String data){
                      _destination = data;
                      // print(_departure);
                    },
                    dropdownSearchDecoration: InputDecoration(
                      labelText: 'To',
                    ),
                    validator: (String? item) {
                      if (item == null || item == 'City, area, or boarding point'){
                        return 'Required field';
                      } 
                      else return null;
                    },
                  )
                ),
                ]
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(width: 25),
                Container(
                  width: 400,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: DateFormat.yMMMd().format(initialDate),
                      hintStyle: TextStyle(color: Colors.black),
                      labelText: 'Departure Date',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: EdgeInsets.symmetric(vertical:15),
                    ),
                    controller: _textEditingController,
                    onTap: () {
                      _selectDate(context);
                    },
                  )
                ),
                ]
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(width: 25),
                Container(
                  width: 400,
                  child: DropdownSearch<String>(
                    showSelectedItem: true,
                    items: ['1 Seats', '2 Seats', '3 Seats'],
                    selectedItem: '1 Seats',
                    onChanged: (String data){
                      int sts = int.parse(data[0]);
                      _seats = sts;
                      //print(sts);
                    },
                    dropdownSearchDecoration: InputDecoration(
                      labelText: 'Seats',
                    ),
                  )
                ),
                ]
              ),
              SizedBox(height: 25,),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    buses = [];
                    setVariables(_selectedDate, _departure, _destination, _seats);
                    getBus();
                    if (buses == []) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('No Bus Schedule Found'))
                      );
                    } else {
                      Navigator.push(
                        context, MaterialPageRoute(builder: ((context) => BusListPage()))
                      );
                    }
                  }
                },
                child: const Text("Search")
              )
            ],
          ),
        )
      )
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5)
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _textEditingController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}