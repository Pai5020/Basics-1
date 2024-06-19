import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  final String name;
  const Screen2({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(name),
      ),
      body: SafeArea(
          child: Column(children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(name),
        )
      ])),
    );
  }
}
