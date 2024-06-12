import 'package:flutter/material.dart';

Widget sportsButton({
  Color? buttonColor,
  String? buttonText,
}) {
  return OutlinedButton(
    onPressed: () {
      print("Clicked here");
    },
    style: OutlinedButton.styleFrom(
      backgroundColor: buttonColor,
    ),
    child: Text(buttonText ?? 'Default Text'),
  );
}
