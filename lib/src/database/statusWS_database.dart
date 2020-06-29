import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class StatusWSDatabase {

  static final _databaseName = "StatusWSDb.db";
  static final _databaseVersion = 1;

  static final table = 'statusWS_table';

  static final columnId = '_id';
  static final columnIdGnrlD = 'idGnrlD';
  static final columnIdCM = 'idCM';
  static final columnIdRM = 'idRM';
  static final columnIdVM = 'idVM';
  static final columnIdEM = 'idEM';
  static final columnIdIMC = 'idIMC';
  static final columnIdIMCD = 'idIMCD';
  static final columnIdVivDet = 'idVivDet';
  static final columnIdVivDetP = 'idVivDetP';
  static final columnIdVivDetRT = 'idVivDetRT';
  static final columnIdVivDetRVg = 'idVivDetRVg';
  static final columnIdVivDetRTr = 'idVivDetRTr';
  static final columnIdVivDetRVn = 'idVivDetRVn';
  static final columnIdVivDetCo = 'idVivDetCo';
  static final columnIdVivDetICV = 'idVivDetICV';
  static final columnIdVivDates = 'idVivDates';

  StatusWSDatabase._privateConstructor();
  static final StatusWSDatabase instance = StatusWSDatabase._privateConstructor();

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
            $columnId INTEGER PRIMARY KEY,
            $columnIdGnrlD TEXT NOT NULL,
            $columnIdCM TEXT NOT NULL,
            $columnIdRM TEXT NOT NULL,
            $columnIdVM TEXT NOT NULL,
            $columnIdEM TEXT NOT NULL,
            $columnIdIMC TEXT NOT NULL,
            $columnIdIMCD TEXT NOT NULL,
            $columnIdVivDet TEXT NOT NULL,
            $columnIdVivDetP TEXT NOT NULL,
            $columnIdVivDetRT TEXT NOT NULL,
            $columnIdVivDetRVg TEXT NOT NULL,
            $columnIdVivDetRTr TEXT NOT NULL,
            $columnIdVivDetRVn TEXT NOT NULL,
            $columnIdVivDetCo TEXT NOT NULL,
            $columnIdVivDetICV TEXT NOT NULL,
            $columnIdVivDates TEXT NOT NULL
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  //Get specif data column in table:
  Future<int> queryColumn(String columnName) async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT $columnName FROM $table'));
  }
  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}