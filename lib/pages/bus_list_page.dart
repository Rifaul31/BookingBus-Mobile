import 'package:flutter/material.dart';
import 'package:boobus/models/bus_model.dart';
import 'package:intl/intl.dart';

class BusListPage extends StatefulWidget{
  @override
  _BusListPageState createState() => _BusListPageState();
}

late DateTime selectedDate;
String departure = '';
String destination = '';
int seats = 0;

setVariables(date, dep, des, seats) {
  selectedDate = date;
  departure = dep;
  destination = des;
  seats = seats;
}

List<Bus> buses = <Bus>[];

getBus() {
  buses = [];
  for (int i = 0; i < busList.length; i++) {
    if (busList[i].depLoc == departure) {
      if (busList[i].desLoc == destination) {
        if (busList[i].availableSeats >= seats) {
          if (busList[i].depTime.year == selectedDate.year && busList[i].depTime.month == selectedDate.month && busList[i].depTime.day == selectedDate.day)
          buses.add(busList[i]);
        }
      }
    }
  }
}

class _BusListPageState extends State<BusListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Image.asset('assets/images/logo.png', width: 210, height: 100,),
        elevation: 0,
      ),

      body: Center(
      child: Column(
        children: <Widget>[
          Expanded (
            child: ListView.builder(
            itemCount: buses.length,
            itemBuilder: (BuildContext context, int index) {
              Bus bus = buses[index];
              return Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    height: 140,
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
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          onPressed: () {
                            tickets.add(bus);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Order Processed'))
                          );
                          },
                          child: const Text("Order", style: TextStyle(color: Colors.blue))
                        )
                      ],
                    ),
                  )
                ],
              );
            }
            )
          )
        ],
      ),
    )
    );
  }
}