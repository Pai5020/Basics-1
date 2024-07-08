import 'package:book_review_analyzer/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<String> _books = [];

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  _loadBooks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _books = prefs.getStringList('books') ?? [];
    });
  }

  _addBook(String book) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _books.add(book);
    await prefs.setStringList('books', _books);
    setState(() {});
  }

  _showAddBookDialogue() {
    final TextEditingController _bookController = TextEditingController();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: TextField(
              controller: _bookController,
              decoration: InputDecoration(labelText: 'Book name'),
            ),
            actions: [
              TextButton(
                child: Text('cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  onPressed: () {
                    if (_bookController.text.isNotEmpty) {
                      _addBook(_bookController.text);
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('add'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DASHBOARD',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _books.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_books[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddBookDialogue,
        child: Icon(Icons.add),
      ),
    );
  }
}
