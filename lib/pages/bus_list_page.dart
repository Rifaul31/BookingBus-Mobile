import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
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
                            Text('BusName', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                            Text('BusPrice')
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('BusType'),
                            Text('Available Seats')
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