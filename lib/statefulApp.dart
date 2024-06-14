import 'package:flutter/material.dart';

class StatefulApp extends StatefulWidget {
  @override
  StatefulAppState createState() {
    return StatefulAppState();
  }
}

class StatefulAppState extends State<StatefulApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text("Stateful widget"),
    ));
  }
}
