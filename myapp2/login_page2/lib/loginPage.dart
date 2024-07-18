import 'package:flutter/material.dart';
import './utils/database_helper.dart';
import './models/user_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _mobileController = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> _login() async {
    String mobile = _mobileController.text;
    if (mobile.isNotEmpty) {
      User user = User(mobile: mobile);
      await _databaseHelper.insertUser(user);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    } else {
      print('Mobile number is empty'); // Handle empty mobile number error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _mobileController,
              decoration: InputDecoration(
                labelText: 'Mobile Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final TextEditingController _mobileController = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  User? _user;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    User? user = await _databaseHelper.getUser();
    if (user != null) {
      setState(() {
        _user = user;
        _mobileController.text = user.mobile;
      });
    }
  }

  Future<void> _updateMobile() async {
    if (_user != null) {
      User updatedUser = User(id: _user!.id, mobile: _mobileController.text);
      await _databaseHelper.updateUser(updatedUser);
      setState(() {
        _user = updatedUser;
      });
    }
  }

  Future<void> _logout() async {
    await _databaseHelper.deleteUser();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Mobile Number: ${_user?.mobile ?? ""}'),
            SizedBox(height: 20),
            TextField(
              controller: _mobileController,
              decoration: InputDecoration(
                labelText: 'New Mobile Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateMobile,
              child: Text('Update'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _logout,
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
