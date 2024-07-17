import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_app/models/note.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colPriority = 'priority';
  String colDate = 'date';
  String colDescription = 'description';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == Null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }

    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == Null) {
      _database = await initializeDatabase();
    }

    Future<int> insertNote(Note Note) async {
      Database db = await this.database;
      var result = await db.insert(noteTable, note.toMap());
      return result;
    }

    Future<int> updateNote(Note Note) async {
      var db = await this.database;
      var result = await db.update(noteTable, note.toMap(), where: '$colId = ?', whereArgs: [note.id]);
      return result;
    }
    

    return _database;
  }

  Future initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,  $colTitle TEXT, '
        '$colDescription TEXT, $colPriority INTEGER, $colDate TEXT) ');
  }

  //fetch
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;

    //var result =
    await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(noteTable, orderBy: '$colPriority ASC');
    return result;
  }
}
