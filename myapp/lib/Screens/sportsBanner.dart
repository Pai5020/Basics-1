import 'package:flutter/material.dart';
import 'package:myapp/Screens/sportsButton.dart';

class Sportsbanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.lightGreenAccent),
      child: ListTile(
        title: Text(
          "Scheduled matches",
          textAlign: TextAlign.center,
        ),
        subtitle: sportsButton(
            buttonColor: Colors.amber, buttonText: "View Schedules"),
      ),
    );
  }
}
