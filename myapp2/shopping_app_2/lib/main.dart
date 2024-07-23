// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/cart_bloc.dart';
import './screens/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      home: BlocProvider(
        create: (context) => CartBloc(),
        child: DashboardScreen(),
      ),
    );
  }
}
