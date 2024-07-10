import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Newpage extends StatelessWidget {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();

  Future<void> _submit(BuildContext context) async {
    String firstName = _firstnameController.text;
    String lastName = _lastnameController.text;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', firstName);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NextPage(lastName: lastName),
      ),
    );
  }

  Newpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          TextField(
            controller: _firstnameController,
            decoration: InputDecoration(labelText: 'First name'),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _lastnameController,
            decoration: InputDecoration(labelText: 'Last name'),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () => _submit(context), child: Text('submit'))
        ],
      ),
    ));
  }
}

class NextPage extends StatefulWidget {
  final String lastName;

  NextPage({super.key, required this.lastName});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  String firstName = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'First Name: $firstName',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20),
        Text(
          ' Last Name: ${widget.lastName}',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _loadFirstName();
  }

  Future<void> _loadFirstName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      firstName = prefs.getString('firstName') ?? 'no firstname';
    });
  }
}
