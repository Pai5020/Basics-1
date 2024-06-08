import 'package:flutter/material.dart';
import 'Screens/basicWidget.dart';
import 'Screens/home.dart';
import 'Screens/multiChildWidget.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Basics-1', routes: {
      '/': (context) => HomeButton(),
      '/basicWidget': (context) => BasicWidget(),
      '/multiChildWidget': (context) => Multichildwidget()
    });
  }
}
