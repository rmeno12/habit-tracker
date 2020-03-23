import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'day.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper db = DatabaseHelper._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "database.db");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE Days ("
            "id TEXT PRIMARY KEY,"
            "event_list TEXT"
            ")");
      },
    );
  }

  Future<int> newDay(Day day) async {
    final db = await database;
    var result = await db.insert("Days", day.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    return result;
  }

  Future<dynamic> getDay(String date) async {
    final db = await database;
    var result = await db.query("Days", where: "id = ?", whereArgs: [date]);

    return result.isNotEmpty ? Day.fromMap(result.first) : 0;
  }

  Future<int> updateDay(Day day) async {
    final db = await database;
    var result = await db.update("Days", day.toMap(),
        where: "id = ?", whereArgs: [Day.formatter.format(day.date)]);

    return result;
  }

  Future<int> deleteDay(Day day) async {
    final db = await database;
    var result = await db.delete("Days",
        where: "id = ?", whereArgs: [Day.formatter.format(day.date)]);

    return result;
  }
}
