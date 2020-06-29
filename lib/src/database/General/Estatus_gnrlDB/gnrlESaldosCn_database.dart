import 'dart:io';

import 'package:path/path.dart';
import 'package:isae/src/models/General/gnrlSaldos_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class GnrlESaldosCnDatabase {

  static final _databaseName = "GnrlESaldosCnDb.db";
  static final _databaseVersion = 1;
  static final table = 'gnrlESaldosCn_table';

  GnrlESaldosCnDatabase._privateConstructor();
  static final GnrlESaldosCnDatabase instance = GnrlESaldosCnDatabase._privateConstructor();

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
            idD INTEGER,
            idS INTEGER ,
            capital TEXT NOT NULL,
            interes TEXT NOT NULL,
            leyenda TEXT NOT NULL,
            PRIMARY KEY ( idD, idS)
          )
          ''');
  }

  // inserted row.
  Future<void> insertSaldos(GnrlSaldosModel details) async {
    Database db = await instance.database;
    await db.insert(table, details.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //get number of rows:
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  //Get all row in GnrlSaldosModel
  Future<List<GnrlSaldosModel>> getAllSaldos() async {
    Database db = await instance.database;

    final List<Map<String, dynamic>> maps = await db.query(table);

    // Convierte List<Map<String, dynamic> en List<GnrlSaldosModel>.
    return List.generate(maps.length, (i) {
      return GnrlSaldosModel(
        idD: maps[i]['idD'],
        idS: maps[i]['idS'],
        aCapital: maps[i]['capital'],
        aIntereses: maps[i]['interes'],
        aLeyenda: maps[i]['leyenda'],
      );
    });
  }

  //Get specific data from specific column
  Future<List<Map<String, dynamic>>> getSaldos(String nColumn, int idD) async {
    Database db = await instance.database;

    return await db.rawQuery('SELECT $nColumn FROM $table WHERE idD = $idD');

  }

  //Get count from specific column & idM
  Future<int> queryCount(String nColumn, int idD) async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT($nColumn) FROM $table WHERE idD = $idD'));
  }

  //Update row in GnrlSaldosModel
  Future<void> updateSaldos(GnrlSaldosModel detail) async {
    Database db = await instance.database;

    await db.update(table, detail.toMap(), where: "idS = ?", whereArgs: [detail.idS]);
  }

  //Delete row in UserDataModel
  Future<void> deleteSaldos(int idS) async {
    Database db = await instance.database;

    await db.delete(table);
  }

}