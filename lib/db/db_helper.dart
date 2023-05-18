import 'package:adigym/screeens/calendar/logic/models/task.dart';
import 'package:adigym/screeens/kalculator/logic/models/personal.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:typed_data';

import 'package:path/path.dart' as p;

class DBHelper {
  static Database? _db;
  static const int _versoin = 1;
  static const String _tableName = "tasks";
  static const String _tablePersonal = "personal";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      var databasePath = await getDatabasesPath();
      String _path = p.join(databasePath, 'adigym.db');
      _db = await openDatabase(_path,
          version: _versoin, onUpgrade: onUpgrade, onCreate: onCreate);
    } catch (e) {}
  }

  static void onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, title STRING, podhod INTEGER, povtor INTEGER, masStaryad INTEGER, dayWeek INTEGER, exerciseStatus STRING, photo BLOB)",
    );
    await db.execute(
      "CREATE TABLE $_tablePersonal(id INTEGER PRIMARY KEY AUTOINCREMENT, name STRING, age INTEGER, height INTEGER, weight INTEGER)", //DEFAULT
    );
  }

  static void onUpgrade(Database db, int oldVersion, int version) async {
    if (oldVersion > version) {}
  }

// task-------------------------------------------------------------------------
  static Future<int> insert(Task? task) async {
    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    return await _db!.query(_tableName);
  }

  static delete(Task task) async {
    return await _db!.delete(_tableName, where: 'id=?', whereArgs: [task.id]);
  }

  static updateTask(Task task) async {
    return await _db!
        .update(_tableName, task.toJson(), where: 'id=?', whereArgs: [task.id]);
  }

  static updateTaskRaw(String exerciseStatus, int id) async {
    return await _db!.rawUpdate(
        'UPDATE $_tableName SET exerciseStatus = ? WHERE id = ?', [exerciseStatus, id]);
  }
  static updatePhotoRaw(Uint8List photo, int id) async {
    return await _db!.rawUpdate(
        'UPDATE $_tableName SET photo = ? WHERE id = ?',
        [photo, id]);
  }

//    static Future<void> updateTask(String title, String id) async {
//    final db = await DBHelper.database();
//    int res =
//        await db.rawUpdate('UPDATE user_places SET title = ? WHERE id = ?', [title, id]);
//    return res;
//  }

  static deleteAll() async {
    return await _db!.rawDelete("Delete from $_tableName");
  }

  //personal-------------------------------------------------------------------
  static Future<int> insertPersonal(Personal? personal) async {
    return await _db?.insert(_tablePersonal, personal!.toJson()) ?? 1;
  }

  static Future<int?> updatePersonal(Personal personal) async {
    return await _db?.update(_tablePersonal, personal.toJson(),
        where: 'id=?', whereArgs: [personal.id]);
  }

  static Future<List<Map<String, dynamic>>> queryPersonal() async {
    return await _db!.query(_tablePersonal);
  }
}
