import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boobus/models/bus_model.dart';

class BusListPage extends StatefulWidget{
  @override
  _BusListPageState createState() => _BusListPageState();
}

class _BusListPageState extends State<BusListPage> {

  @override
  Widget build(BuildContext context) {
    return Center(
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
                    height: 170,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(bus.busName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                            Text('\Rp.${bus.price}')
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(bus.busType),
                            Text(bus.busSeats)
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('DepartureTime'),
                            Text('ArrivalTime')
                          ],
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
    );
  }
}