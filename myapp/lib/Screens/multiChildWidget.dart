import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Multichildwidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey,
        child: Column(children: <Widget>[
          Container(
              width: 250,
              height: 100,
              color: Colors.green,
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(100),
              child: Center(
                child: Text(
                  "COlumn MultiWidget",
                  style: TextStyle(
                    fontSize: 12.0, // Set the font size here
                  ),
                ),
              )),
          Container(
              child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Home")))
        ]));
  }
}
