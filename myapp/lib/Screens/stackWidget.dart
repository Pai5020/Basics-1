import 'package:flutter/material.dart';

class Stackwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          color: Colors.grey,
          child: Stack(
            textDirection: TextDirection.rtl,
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                width: 400,
                height: 400,
                color: Colors.red,
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.blueAccent,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
              )
            ],
          )),
    );
  }
}
