import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(name),
      ),*/
      body: SafeArea(
          child: Column(children: [
        /* ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(name),
        )*/
        Text('Value Found'),
      ])),
    );
  }
}
