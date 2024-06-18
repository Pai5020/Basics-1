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

  void navigateToPage(BuildContext context, String label) {
    switch (label) {
      case "Button1":
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Button1(),
          ),
        );
        break;

      case 'Button2':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Button2()),
        );
        break;

      case 'Button3':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Button3()),
        );
        break;

      case 'Button4':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Button4()),
        );
        break;

      case 'default':
        print("Default!!!");
        break;
    }
  }

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
              onPressed: () {
                navigateToPage(context, buttonData['label']);
              },
              child: Text(buttonData['label']),
            ),
          );
        },
      ),
    );
  }
}

class Button1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text("ButtonPAge1"),
      ),
      body: Center(
        child: Text("Page 1"),
      ),
    );
  }
}

class Button2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("ButtonPAge2"),
      ),
      body: Center(
        child: Text("Page 2"),
      ),
    );
  }
}

class Button3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("ButtonPAge3"),
      ),
      body: Center(
        child: Text("Page 3"),
      ),
    );
  }
}

class Button4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("ButtonPAge4"),
      ),
      body: Center(
        child: Text("Page 4"),
      ),
    );
  }
}
