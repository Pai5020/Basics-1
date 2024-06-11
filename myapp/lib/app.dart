import 'package:flutter/material.dart';
import 'package:myapp/Screens/alignWidget.dart';
import 'package:myapp/Screens/gridViewWidget.dart';
import 'package:myapp/Screens/imageWidget.dart';
import 'package:myapp/Screens/listViewWidget.dart';
import 'package:myapp/Screens/stackWidget.dart';
import 'package:myapp/Screens/textFieldWidget.dart';
import 'package:myapp/Screens/textWidget.dart';
import 'Screens/basicWidget.dart';
import 'Screens/home.dart';
import 'Screens/multiChildWidget.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basics-1',
      routes: {
        '/': (context) => HomeButton(),
        '/basicWidget': (context) => BasicWidget(),
        '/multiChildWidget': (context) => Multichildwidget(),
        '/imageWidget': (context) => Imagewidget(),
        '/textWidget': (context) => Textwidget(),
        '/textFieldWidget': (context) => Textfieldwidget(),
        '/listViewWidget': (context) => ListviewWidget(),
        '/gridViewWidget': (context) => Gridviewwidget(),
        '/stackWidget': (context) => Stackwidget(),
        '/alignWidget': (context) => Alignwidget()
      },
    );
  }
}
