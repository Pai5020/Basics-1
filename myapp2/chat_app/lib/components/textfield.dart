import 'package:flutter/material.dart';

class TextfieldMy extends StatelessWidget {
  final String hinText;
  final bool obscureText;
  const TextfieldMy(
      {super.key, required this.hinText, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextField(
          obscureText: false,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.tertiary),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary),
            ),
            fillColor: Theme.of(context).colorScheme.secondary,
            filled: true,
            hintText: hinText,
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ));
  }
}
