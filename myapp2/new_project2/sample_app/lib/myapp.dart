import 'package:flutter/material.dart';
import 'package:sample_app/screens/splash.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScreenSplash(),
    );
  }
}
