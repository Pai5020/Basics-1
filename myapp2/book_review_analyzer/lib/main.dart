import 'package:book_review_analyzer/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book_Review',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Login(),
    );
  }
}
