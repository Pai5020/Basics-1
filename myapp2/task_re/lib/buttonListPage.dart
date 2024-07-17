import 'package:flutter/material.dart';
import 'package:task_re/utils/database_helper.dart'; // Import the DatabaseHelper class
import 'model/buttonModel.dart';

class ButtonListPage extends StatefulWidget {
  @override
  _ButtonListPageState createState() => _ButtonListPageState();
}

class _ButtonListPageState extends State<ButtonListPage> {
  final List<Map<String, dynamic>> buttonList = [
    {"label": "Button1", "color": Colors.green.value},
    {"label": "Button2", "color": Colors.red.value},
    {"label": "Button3", "color": Colors.yellow.value},
    {"label": "Button4", "color": Colors.blue.value},
  ];

  late List<ButtonModel> buttons;

  @override
  void initState() {
    super.initState();
    buttons = [];
    _initializeButtons();
  }

  Future<void> _initializeButtons() async {
    final dbHelper = DatabaseHelper();
    await dbHelper.initializeButtons(buttonList);
    _loadButtons();
  }

  Future<void> _loadButtons() async {
    final dbHelper = DatabaseHelper();
    List<ButtonModel> loadedButtons = await dbHelper.getButtons();
    setState(() {
      buttons = loadedButtons;
    });
  }

  void navigateToPage(BuildContext context, String label) async {
    final buttonData = buttons.firstWhere(
      (element) => element.label == label,
      orElse: () =>
          ButtonModel(label: 'Unknown', colorValue: Colors.grey.value),
    );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NextPage(buttonData: buttonData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Button List Page')),
      body: buttons.isEmpty
          ? Center(child: Text('No buttons found'))
          : ListView.builder(
              itemCount: buttons.length,
              itemBuilder: (context, index) {
                ButtonModel buttonData = buttons[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: Color(buttonData.colorValue),
                    onPressed: () {
                      navigateToPage(context, buttonData.label);
                    },
                    child: Text(buttonData.label),
                  ),
                );
              },
            ),
    );
  }
}

class NextPage extends StatelessWidget {
  final ButtonModel buttonData;

  NextPage({required this.buttonData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(buttonData.label),
      ),
      body: Center(
        child: Text(
          'You are on ${buttonData.label} page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
