import 'package:chat_app/components/textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),

          const SizedBox(
            height: 50,
          ),

          //Welcome back msg
          Text("Welcome back :)",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16)),

          TextfieldMy(
            hinText: "Email",
            obscureText: false,
          ),

          const SizedBox(
            height: 50,
          ),

          TextfieldMy(
            hinText: "Password",
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
