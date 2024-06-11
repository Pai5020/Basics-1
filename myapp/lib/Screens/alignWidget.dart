import 'package:flutter/material.dart';

class Alignwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                width: 300,
                height: 500,
                color: Colors.grey,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    Positioned(
                      left: 100,
                      top: 200,
                      child: Container(
                        width: 200,
                        height: 200,
                        color: Colors.amber,
                      ),
                    ),
                    Positioned(
                      left: 100,
                      top: 200,
                      child: Container(
                        width: 200,
                        height: 200,
                        color: Colors.amber,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ],
                ))));
  }
}
