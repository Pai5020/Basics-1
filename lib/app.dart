import 'package:flutter/material.dart';
import 'package:new_project/buttonListPage.dart';
import 'package:new_project/screen1.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Screen1(),
      ),
    );
  }
}
