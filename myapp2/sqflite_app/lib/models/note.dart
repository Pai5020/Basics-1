import 'package:flutter/material.dart';

class Note {
  int _id = 0;
  String _title;
  String _date;
  String _description;
  int _priority;

  Note(this._title, this._date, this._priority, [this._description = '']);

  Note.withId(this._id, this._title, this._date, this._priority,
      [this._description = '']);

  int get id => _id;

  String get title => _title;

  String get date => _date;

  String get description => _description;

  int get priority => _priority;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      this._description = newDescription;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      this._priority = newPriority;
    }
  }

  set date(String newDate) {
    this._date = newDate;
  }

  //convert a note object to map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
   
      map['id'] = _id;
    

    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['date'] = _date;

    return map;
  }

  Note.fromMapObject(Map<String, dynamic> map)
      : _id = map['id'] ?? 0,
        _title = map['title'] ?? '',
        _description = map['description'] ?? '',
        _priority = map['priority'] ?? 1,
        _date = map['date'] ?? '';
}
