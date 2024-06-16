import 'package:flutter/material.dart';

class ButtonListPage extends StatelessWidget {
  ButtonListPage({super.key});
  final List<Map<String, dynamic>> buttonList = [
    {
      "label": "Button1",
      "color": Colors.green,
    },
    {
      "label": "Button2",
      "color": Colors.red,
    },
    {
      "label": "Button3",
      "color": Colors.yellow,
    },
    {
      "label": "Button4",
      "color": Colors.blue,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: buttonList.length,
        itemBuilder: (context, index) {
          final buttonData = buttonList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: buttonData['color'],
              onPressed: () {},
              child: Text(buttonData['label']),
            ),
          );
        },
      ),
    );
  }
}
