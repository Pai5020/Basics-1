import 'package:flutter/material.dart';
import 'package:sample_app2/screen_accounts.dart';
import 'package:sample_app2/screen_main.dart';
import 'package:sample_app2/screen_search.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int _currentSelectedIndex = 0;

  final _pages = [ScreenMain(), ScreenSearch(), ScreenAccounts()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentSelectedIndex,
          selectedItemColor: Colors.blue,
          onTap: (newIndex) {
            setState(() {
              _currentSelectedIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          ]),
    );
  }
}
