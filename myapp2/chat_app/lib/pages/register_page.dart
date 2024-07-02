import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  RegisterPage({super.key});

  void register() {}

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
            height: 25,
          ),

          //Welcome back msg
          Text("lets create :)",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16)),

          TextfieldMy(
              hinText: "Email",
              obscureText: false,
              controller: _emailController),

          const SizedBox(
            height: 10,
          ),

          TextfieldMy(
            hinText: "Password",
            obscureText: true,
            controller: _pwController,
          ),
          const SizedBox(
            height: 10,
          ),

          TextfieldMy(
            hinText: " confirm Password",
            obscureText: true,
            controller: _confirmPwController,
          ),

          //login button
          const SizedBox(
            height: 25,
          ),

          MyButton(
            text: "Register",
            onTap: register,
          ),

          const SizedBox(
            height: 25,
          ),

          Row(
            children: [
              Text(
                'account? login',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text(
                'Login now ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
