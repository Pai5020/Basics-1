import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/productProvider.dart';
import 'screens/dashboardScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DashboardScreen(),
      ),
    );
  }
}
