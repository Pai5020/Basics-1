import 'package:flutter/material.dart';

class Textwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        "Text Widget",
        style: TextStyle(
            color: Colors.lightBlue,
            backgroundColor: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
            fontStyle: FontStyle.italic,
            fontFamily: "First Font"),
      ),
    ));
  }
}
