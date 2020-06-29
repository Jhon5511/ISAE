
import 'dart:io';

import 'package:path/path.dart';
import 'package:isae/src/models/General/gnrlDates_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class GnrlDatesDatabase {

  static final _databaseName = "GnrlDatesDb.db";
  static final _databaseVersion = 1;
  static final table = 'gnrlDates_table';

  GnrlDatesDatabase._privateConstructor();
  static final GnrlDatesDatabase instance = GnrlDatesDatabase._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            id INTEGER PRIMARY KEY,
            date TEXT NOT NULL
          )
          ''');
  }

  // inserted row.
  Future<void> insertDates(GnrlDatesModel dates) async {
    Database db = await instance.database;
    await db.insert(table, dates.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //get number of rows:
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  //Get all row in UserDataModel
  Future<List<GnrlDatesModel>> getAllDates() async {
    Database db = await instance.database;

    final List<Map<String, dynamic>> maps = await db.query(table);

    // Convierte List<Map<String, dynamic> en List<UserDataModel>.
    return List.generate(maps.length, (i) {
      return GnrlDatesModel(
        id: maps[i]['id'],
        date: maps[i]['date'],
      );
    });
  }

  //Get specific data from specific column
  Future<List<Map<String, dynamic>>> getDate(String nColumn) async {
    Database db = await instance.database;

    //return await db.rawQuery('SELECT date FROM $table');

    return await db.rawQuery('SELECT $nColumn FROM $table');

  }

  //Update row in UserDataModel
  Future<void> updateDate(GnrlDatesModel date) async {
    Database db = await instance.database;

    await db.update(table, date.toMap(), where: "id = ?", whereArgs: [date.id]);
  }

  //Delete row in UserDataModel
  Future<void> deleteDate(int id) async {
    Database db = await instance.database;

    await db.delete(table);
  }
}