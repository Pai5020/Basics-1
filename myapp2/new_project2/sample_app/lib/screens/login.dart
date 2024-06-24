import 'package:flutter/material.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Username',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                checkLogin(context);
              },
              icon: const Icon(Icons.check),
              label: const Text('Login'),
            )
          ],
        ),
      ),
    ));
  }

  void checkLogin(BuildContext context) {
    final _username = _usernameController.text;
    final _password = _passwordController.text;

    if (_username == _password) {
      //goto home
    } else {
      final _errorMessage = 'Username password does not match';

      //snackbar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          content: Text(_errorMessage)));

      //alert dialog

      showDialog(
          context: context,
          builder: (context1) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(_errorMessage),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context1).pop();
                    },
                    child: Text('Close'))
              ],
            );
          });

      //Show Text
    }
  }
}
