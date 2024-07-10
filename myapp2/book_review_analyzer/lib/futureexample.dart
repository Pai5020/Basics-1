import 'package:flutter/material.dart';

class FutureExample extends StatefulWidget {
  @override
  _FutureExampleState createState() => _FutureExampleState();
}

class _FutureExampleState extends State<FutureExample> {
  String _message = 'Press the button to fetch data';

  // Simulate a network request
  Future<String> _fetchData() async {
    // Simulate a delay
    await Future.delayed(Duration(seconds: 3));
    return 'Data fetched successfully!';
  }

  void _onButtonPressed() async {
    setState(() {
      _message = 'Fetching data...';
    });

    // Call the future function and wait for the result
    String data = await _fetchData();

    // Update the state with the result
    setState(() {
      _message = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Function Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onButtonPressed,
              child: Text('Fetch Data'),
            ),
          ],
        ),
      ),
    );
  }
}
