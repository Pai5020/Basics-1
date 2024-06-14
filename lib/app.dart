import 'package:flutter/material.dart';
import 'package:new_project/statefulApp.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StatefulApp(),
      ),
    );
  }
}
