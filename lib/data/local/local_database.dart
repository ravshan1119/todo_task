import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_task/data/model/event_model.dart';

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();

  LocalDatabase._init();

  factory LocalDatabase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("todos.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";

    await db.execute('''
    CREATE TABLE ${EventModelFields.eventTable} (
    ${EventModelFields.id} $idType,
    ${EventModelFields.eventName} $textType,
    ${EventModelFields.eventDescription} $textType,
    ${EventModelFields.eventLocation} $textType,
    ${EventModelFields.eventPriority} $textType,
    ${EventModelFields.eventTime} $textType,
    ${EventModelFields.day} $textType
    )
    ''');

    debugPrint("-------DB----------CREATED---------");
  }

  static Future<EventModel> insertTodo(EventModel eventModel) async {
    final db = await getInstance.database;
    final int id =
        await db.insert(EventModelFields.eventTable, eventModel.toJson());
    print("ID:  $id");
    eventModel.id = id;
    return eventModel.copyWith(id: id);
  }

  static Future<List<EventModel>> getAllTodos() async {
    List<EventModel> allToDos = [];
    final db = await getInstance.database;
    allToDos = (await db.query(EventModelFields.eventTable))
        .map((e) => EventModel.fromJson(e))
        .toList();

    return allToDos;
  }

  static updateTodo({required EventModel eventModel}) async {
    final db = await getInstance.database;
    db.update(
      EventModelFields.eventTable,
      eventModel.toJson(),
      where: "${EventModelFields.id} = ?",
      whereArgs: [eventModel.id],
    );
  }

  static Future<int> deleteTodo(int id) async {
    final db = await getInstance.database;
    int count = await db.delete(
      EventModelFields.eventTable,
      where: "${EventModelFields.id} = ?",
      whereArgs: [id],
    );
    return count;
  }
}
