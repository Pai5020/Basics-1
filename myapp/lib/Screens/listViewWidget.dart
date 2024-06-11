import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListviewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.grey,
      child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(50),
          children: <Widget>[
            Container(
                color: Colors.red,
                width: 300,
                height: 200,
                child: Text("Contact one")),
            Container(
                color: Colors.yellow,
                width: 300,
                height: 200,
                child: Text("Contact two")),
            Container(
                color: Colors.blue,
                width: 300,
                height: 200,
                child: Text("Contact three")),
            Container(
                color: Colors.green,
                width: 300,
                height: 200,
                child: Text("Contact four")),
          ]),
    );
  }
}
