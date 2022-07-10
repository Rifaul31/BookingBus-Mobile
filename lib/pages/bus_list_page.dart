import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:boobus/models/bus_model.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class BusListPage extends StatefulWidget{
  const BusListPage({Key? key}) : super(key: key);

  @override
  _BusListPageState createState() => _BusListPageState();
}

Future<List<Bus>> downloadJSON() async{
  final jsonEndPoint = Uri.parse('http://10.0.2.2/boobus/index.php');

  final response = await http.get(jsonEndPoint);

  if (response.statusCode == 200) {
    List buses = json.decode(response.body);
    return buses.map((bus) => Bus.fromJson(bus)).toList();
  } else {
    throw Exception("Unable to download successfully from JSON data");
  }
}

class CustomListView extends StatelessWidget {
  final List<Bus> buses;

  CustomListView(this.buses);

  Widget build(context) {
    return ListView.builder(
            itemCount: buses.length,
            itemBuilder: (BuildContext context, int index) {
              Bus bus = buses[index];
              return Stack(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    height: 110,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('  ${bus.busName}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),),
                            Text('Rp.${bus.price}  ', style: const TextStyle(color: Colors.white))
                          ],
                        ),
                        const SizedBox(height: 3,),
                        Row(
                          children: <Widget>[
                            Text('  ${bus.depLoc}', style: const TextStyle(color: Colors.white),),
                            const Text(' - ', style: TextStyle(color: Colors.white)),
                            Text('${bus.desLoc}  ', style: const TextStyle(color: Colors.white))
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('  ${bus.busSeats} Seats', style: const TextStyle(color: Colors.white),)
                          ],
                        ),
                        const SizedBox(height: 3,),
                        Row(
                          children: <Widget>[
                            Text('  ${DateFormat.Hm().format(bus.depTime)}', style: const TextStyle(color: Colors.white)),
                            const Text(' - ', style: TextStyle(color: Colors.white)),
                            Text(DateFormat.Hm().format(bus.arrTime), style: const TextStyle(color: Colors.white))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
            }
    );
  }
}

class _BusListPageState extends State<BusListPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded (
            child: FutureBuilder<List<Bus>>(
              future: downloadJSON(),
              builder: (context, snapshot){
                if (snapshot.hasData) {
                  List<Bus>? buses = snapshot.data;
                  return CustomListView(buses!);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return CircularProgressIndicator();
              }
            ) 
          )
        ],
      ),
    );
  }
}