import 'package:flutter/material.dart';
import 'controllers/pagesControllers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boobus',
      home: PagesController(),
    );
  }
}