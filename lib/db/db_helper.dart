import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static Database _database;
  static final _dbName = 'formulario.db';
  static final _dbVersion = 1;
  static final _tableName = 'contacts';

  // Hacer 'singleton' a la clase
  DbHelper._privateConstructor();
  static final DbHelper instance = DbHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initiateDatabase();
    return _database;
  }

  Future<Database> _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE contacts(
        id INTEGER PRYMARY KEY,
        name TEXT NOT NULL,
        lastname TEXT NOT NULL,
        address TEXT NOT NULL,
        phone INTEGER NOT NULL
      );
      ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_tableName);
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row['columnId'];
    return await db.update(_tableName, row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }
}
