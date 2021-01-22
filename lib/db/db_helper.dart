import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static Database _database;
  static final _dbName = 'formulario.db';
  static final _dbVersion = 1;
  static final _tableName = 'services';

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
        CREATE TABLE services(
        id INTEGER PRIMARY KEY,
        photo TEXT NOT NULL,
        providerName TEXT NOT NULL,
        category TEXT NOT NULL,
        serviceTitle TEXT NOT NULL,
        description TEXT NOT NULL,
        score REAL NOT NULL,
        latitude REAL NOT NULL,
        longitude REAL NOT NULL,
        region TEXT NOT NULL
      );
      ''');
    await db.execute(
        '''INSERT INTO services VALUES('1','Foto','Marco Meulen','Albañil','Mantenimiento','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','2.4','-17.761291','-63.215174','Santa Cruz');''');
    await db.execute(
        '''INSERT INTO services VALUES('2','Foto','Carla Paredez','Plomero','Matenimiento','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','3.1','-17.776559','-63.17681','Cochabamba');''');
    await db.execute(
        '''INSERT INTO services VALUES('3','Foto','Marco Torrez','Plomero','Matenimiento','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','4.4','-17.815926','-63.210524','Santa Cruz');''');
    await db.execute(
        '''INSERT INTO services VALUES('4','Foto','Luisa Paredez','Plomero','Reparaciones','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','2.7','-17.761242','-63.20493','La Paz');''');
    await db.execute(
        '''INSERT INTO services VALUES('5','Foto','Finelo Meulen','Plomero','Matenimiento','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','2.8','-17.797075','-63.187279','Cochabamba');''');
    await db.execute(
        '''INSERT INTO services VALUES('6','Foto','Federico Torrez','Carpintero','Diseño de Muebles','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','3.6','-17.793132','-63.21302','Santa Cruz');''');
    await db.execute(
        '''INSERT INTO services VALUES('7','Foto','Luisa Espada','Plomero','Reparaciones','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','3.9','-17.778529','-63.205981','Santa Cruz');''');
    await db.execute(
        '''INSERT INTO services VALUES('8','Foto','Federico Carrasco','Carpintero','Mantenimiento','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','4.2','-17.805392','-63.203073','Cochabamba');''');
    await db.execute(
        '''INSERT INTO services VALUES('9','Foto','Manuel Paredez','Plomero','Reparaciones','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','1.9','-17.776583','-63.174744','Santa Cruz');''');
    await db.execute(
        '''INSERT INTO services VALUES('10','Foto','Manuel Torrez','Albañil','Mantenimiento','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','4.6','-17.806948','-63.166289','Santa Cruz');''');
    await db.execute(
        '''INSERT INTO services VALUES('11','Foto','Federico Espada','Carpintero','Mantenimiento','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','3.6','-17.763916','-63.192554','Cochabamba');''');
    await db.execute(
        '''INSERT INTO services VALUES('12','Foto','Carla Torrez','Carpintero','Barnizado','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','3.9','-17.796571','-63.17093','La Paz');''');
    await db.execute(
        '''INSERT INTO services VALUES('13','Foto','Carla Espada','Carpintero','Diseño de Muebles','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','3.3','-17.820522','-63.200931','Cochabamba');''');
    await db.execute(
        '''INSERT INTO services VALUES('14','Foto','Manuel Espada','Carpintero','Diseño de Muebles','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','3.5','-17.758979','-63.194052','La Paz');''');
    await db.execute(
        '''INSERT INTO services VALUES('15','Foto','Finelo Carrasco','Plomero','Matenimiento','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','1.8','-17.797129','-63.202797','Cochabamba');''');
    await db.execute(
        '''INSERT INTO services VALUES('16','Foto','Carla Meulen','Albañil','Pintado','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','3.5','-17.773955','-63.156641','Cochabamba');''');
    await db.execute(
        '''INSERT INTO services VALUES('17','Foto','Finelo Carrasco','Plomero','Matenimiento','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','4','-17.809423','-63.191086','Santa Cruz');''');
    await db.execute(
        '''INSERT INTO services VALUES('18','Foto','Manuel Miranda','Plomero','Reparaciones','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','3.6','-17.786389','-63.162198','La Paz');''');
    await db.execute(
        '''INSERT INTO services VALUES('19','Foto','Marco Meulen','Carpintero','Diseño de Muebles','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','3.1','-17.765364','-63.201964','Cochabamba');''');
    await db.execute(
        '''INSERT INTO services VALUES('20','Foto','Finelo Paredez','Carpintero','Barnizado','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','2','-17.804136','-63.166052','La Paz');''');
    await db.execute(
        '''INSERT INTO services VALUES('21','Foto','Marco Carrasco','Plomero','Reparaciones','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','3.7','-17.768202','-63.203234','Santa Cruz');''');
    await db.execute(
        '''INSERT INTO services VALUES('22','Foto','Juan Paredez','Carpintero','Barnizado','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','1.5','-17.770174','-63.199857','La Paz');''');
    await db.execute(
        '''INSERT INTO services VALUES('23','Foto','Carla Meulen','Albañil','Pintado','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','3.5','-17.769916','-63.170088','La Paz');''');
    await db.execute(
        '''INSERT INTO services VALUES('24','Foto','Luisa Carrasco','Plomero','Matenimiento','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','1.3','-17.760234','-63.204686','Santa Cruz');''');
    await db.execute(
        '''INSERT INTO services VALUES('25','Foto','Manuel Miranda','Carpintero','Diseño de Muebles','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','1.4','-17.804064','-63.201752','Cochabamba');''');
    await db.execute(
        '''INSERT INTO services VALUES('26','Foto','Federico Carrasco','Carpintero','Diseño de Muebles','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','4.7','-17.775893','-63.196738','Santa Cruz');''');
    await db.execute(
        '''INSERT INTO services VALUES('27','Foto','Juan Meulen','Carpintero','Barnizado','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','2.5','-17.810873','-63.174928','La Paz');''');
    await db.execute(
        '''INSERT INTO services VALUES('28','Foto','Manuel Espada','Plomero','Matenimiento','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','1.8','-17.763499','-63.19975','La Paz');''');
    await db.execute(
        '''INSERT INTO services VALUES('29','Foto','Manuel Paredez','Plomero','Reparaciones','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','3.4','-17.811555','-63.174196','Santa Cruz');''');
    await db.execute(
        '''INSERT INTO services VALUES('30','Foto','Juan Carrasco','Albañil','Pintado','Lorem ipsum dolor sit amet. consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','2.9','-17.776596','-63.210234','La Paz');''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_tableName);
  }

  Future<List<Map<String, dynamic>>> query(
      var selColumns, String wheres, var args) async {
    Database db = await instance.database;
    var data = await db.query(_tableName,
        columns: selColumns, where: wheres, whereArgs: args);
    return data;
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
