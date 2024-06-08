import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/basicWidget');
              },
              child: Text(
                "Basic Widget",
              )),
          SizedBox(
            height: 40,
          ),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/multiChildWidget');
              },
              child: Text(
                "multi ChildWidget",
              ))
        ],
      ),
    ));
  }
}
