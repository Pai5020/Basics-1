import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:task_re/model/buttonModel.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'button_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE buttons(
        id INTEGER PRIMARY KEY,
        label TEXT,
        colorValue INTEGER
      )
    ''');
  }

  Future<void> insertButton(ButtonModel button) async {
    final db = await database;
    await db.insert(
      'buttons',
      button.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ButtonModel>> getButtons() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('buttons');
    return List.generate(maps.length, (i) {
      return ButtonModel(
        label: maps[i]['label'],
        colorValue: maps[i]['colorValue'],
      );
    });
  }

  Future<void> clearButtons() async {
    final db = await database;
    await db.delete('buttons');
  }

  Future<void> initializeButtons(
      List<Map<String, dynamic>> initialButtonList) async {
    final dbHelper = DatabaseHelper();
    await dbHelper.clearButtons();
    for (var button in initialButtonList) {
      await dbHelper.insertButton(ButtonModel(
        label: button['label'],
        colorValue: button['color'],
      ));
    }
  }
}
