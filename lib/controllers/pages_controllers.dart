import 'package:boobus/pages/bus_list_page.dart';
import 'package:boobus/pages/bus_page.dart';
import 'package:boobus/pages/my_tickets.dart';
import 'package:flutter/material.dart';

class PagesController extends StatefulWidget {
  @override
  _PagesControllerState createState() => _PagesControllerState();
}

class _PagesControllerState extends State<PagesController> {
  PageController _pageController = PageController(initialPage: 0);
  int bottomNavigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Image.asset('assets/images/logo.png', width: 210, height: 100,),
        elevation: 0,
      ),

      body: PageView(
        controller: _pageController,
        children: [
          BusPage(),
          MyTicket(),
          Container(
            child: Center(
              child: Text('Notifications'),
            ),
          ),
          Container(
            child: Center(
              child: Text('Profile'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 4,
            )
          ],
        ),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          currentIndex: bottomNavigationIndex,
          onTap: (index) {
            setState(() {
              _pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 400),
                curve: Curves.decelerate,
              );
              bottomNavigationIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
            icon: bottomNavigationIndex == 0
            ? Icon(Icons.house)
            : Icon(Icons.house_outlined),
            label: 'Home'
            ),
            BottomNavigationBarItem(
            icon: bottomNavigationIndex == 1
            ? Icon(Icons.confirmation_num)
            : Icon(Icons.confirmation_num_outlined),
            label: 'My Tickets'
            ),
            BottomNavigationBarItem(
            icon: bottomNavigationIndex == 2
            ? Icon(Icons.notifications)
            : Icon(Icons.notifications_none),
            label: 'Notifications'
            ),
            BottomNavigationBarItem(
            icon: bottomNavigationIndex == 3
            ? Icon(Icons.account_box)
            : Icon(Icons.account_box_outlined),
            label: 'Account'
            ),
          ],
        ),
      ),
    );
  }
}
