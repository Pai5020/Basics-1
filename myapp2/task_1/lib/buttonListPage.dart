import 'package:flutter/material.dart';

class ButtonListPage extends StatelessWidget {
  ButtonListPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> buttonList = [
    {"label": "Button1", "color": Colors.green},
    {"label": "Button2", "color": Colors.red},
    {"label": "Button3", "color": Colors.yellow},
    {"label": "Button4", "color": Colors.blue},
  ];

  void navigateToPage(BuildContext context, String label) {
    Widget nextPage;

    switch (label) {
      case 'Button1':
        nextPage = NextPage(title: label);
        break;
      case 'Button2':
        nextPage = NextPage(title: label);
        break;
      case 'Button3':
        nextPage = NextPage(title: label);
        break;
      case 'Button4':
        nextPage = NextPage(title: label);
        break;
      default:
        nextPage = NextPage(title: 'Unknown');
    }

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => nextPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Button List Page')),
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

class NextPage extends StatelessWidget {
  final String title;

  NextPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'You are on $title page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
