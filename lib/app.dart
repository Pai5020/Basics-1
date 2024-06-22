import 'package:flutter/material.dart';
import 'package:new_project/buttonListPage.dart';
import 'package:new_project/screen1.dart';
import 'package:new_project/screen2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getSavedData(context);
    return MaterialApp(
      home: Scaffold(
        body: Screen1(),
      ),
    );
  }
}

Future<void> getSavedData(BuildContext context) async {
  final sharedPrefs = await SharedPreferences.getInstance();
  final savedValue = sharedPrefs.getString('saved_value');

  if (savedValue != null) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Screen2()));
  }
}
