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
  List<String> _bookAuthors = [];
  List<String> _bookRatings = [];

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  _loadBooks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _books = prefs.getStringList('books') ?? [];
      _bookAuthors = prefs.getStringList('bookAuthors') ?? [];
      _bookRatings = prefs.getStringList('bookRatings') ?? [];
    });
  }

  _addBook(String book, String author, String rating) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _books.add(book);
    _bookAuthors.add(author);
    _bookRatings.add(rating);
    await prefs.setStringList('books', _books);
    await prefs.setStringList('bookAuthors', _bookAuthors);
    await prefs.setStringList('bookRatings', _bookRatings);
    setState(() {});
  }

  _showAddBookDialogue() {
    final TextEditingController _bookController = TextEditingController();
    final TextEditingController _authorController = TextEditingController();
    final TextEditingController _ratingController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Book'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _bookController,
                decoration: InputDecoration(labelText: 'Book Name'),
              ),
              TextField(
                controller: _authorController,
                decoration: InputDecoration(labelText: 'Author'),
              ),
              TextField(
                controller: _ratingController,
                decoration: InputDecoration(labelText: 'Rating'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (_bookController.text.isNotEmpty &&
                    _authorController.text.isNotEmpty &&
                    _ratingController.text.isNotEmpty) {
                  _addBook(_bookController.text, _authorController.text,
                      _ratingController.text);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DASHBOARD'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _books.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_books[index]),
            subtitle: Text(
                'Author: ${_bookAuthors[index]}\nRating: ${_bookRatings[index]}'),
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
