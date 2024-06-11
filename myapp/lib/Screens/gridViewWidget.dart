import 'package:flutter/material.dart';

class Gridviewwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey,
        child: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 3,
          children: <Widget>[
            Container(
              color: Colors.red,
              child: Text("One"),
            ),
            Container(
              color: Colors.green,
              child: Text("Two"),
            ),
            Container(
              color: Colors.yellow,
              child: Text("Three"),
            ),
            Container(
              color: Colors.blue,
              child: Text("Four"),
            ),
          ],
        ));
  }
}
