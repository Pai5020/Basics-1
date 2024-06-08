import 'package:flutter/material.dart';

class BasicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 10,
                  blurRadius: 10,
                  offset: Offset(10, 10))
            ]),
        child: Center(
          child: Text("BASIC DEVELOPMENT"),
        ),
      ),
    );
  }
}
