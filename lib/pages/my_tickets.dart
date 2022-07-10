import 'package:flutter/material.dart';
import 'package:boobus/models/bus_model.dart';
import 'package:intl/intl.dart';

class MyTicket extends StatefulWidget {
  @override
  _MyTicketState createState() => _MyTicketState();
}

class _MyTicketState extends State<MyTicket> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded (
            child: ListView.builder(
            itemCount: tickets.length,
            itemBuilder: (BuildContext context, int index) {
              Bus bus = tickets[index];
              return Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
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
                        ),
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