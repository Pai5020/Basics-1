import 'package:flutter/material.dart';
import 'package:sample_app/screens/home.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isDataMatched = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
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
                validator: (_) {
                  if (_isDataMatched) {
                    return null;
                  } else {
                    return 'Error';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: !_isDataMatched,
                    child: Text(
                      'username psswd does not match',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      _formKey.currentState!.validate();
                      checkLogin(context);
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Login'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  void checkLogin(BuildContext context) {
    final _username = _usernameController.text;
    final _password = _passwordController.text;

    if (_username == _password) {
      //goto home
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ScreenHome()));
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

      setState(() {
        _isDataMatched = false;
      });
    }
  }
}
