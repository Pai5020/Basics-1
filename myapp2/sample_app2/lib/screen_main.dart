import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});

  final _list = ['Apple', 'Orange', 'Pine Apple'];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: DropdownButtonFormField(
          onChanged: (value) {
            print(value);
          },
          items: _list.map((e) {
            return DropdownMenuItem(value: e, child: Text(e));
          }).toList()),
    ));
  }
}
