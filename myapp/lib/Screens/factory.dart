import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/Screens/sportsBanner.dart';
import './sportsButton.dart';

class Factorywidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget cricket = Icon(Icons.sports_cricket);
    Widget soccer = Icon(Icons.sports_soccer);
    Widget baseball = Icon(Icons.sports_baseball);
    Widget sportsRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [cricket, soccer, baseball],
    );
    return Scaffold(
      appBar: AppBar(title: Text("Sports")),
      body: ListView(children: [
        sportsRow,
        sportsRow,
        sportsRow,
        sportsButton(buttonColor: Colors.lightBlue, buttonText: "Click mee"),
        sportsButton(buttonColor: Colors.lightGreenAccent, buttonText: "OK"),
        Container(
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
        ),
        SizedBox(height: 10),
        Sportsbanner(),
        /*OutlinedButton(
          onPressed: () {
            print("Clicked here");
          },
          child: Text("Click me"),
        )*/
      ]),
    );
  }
}
