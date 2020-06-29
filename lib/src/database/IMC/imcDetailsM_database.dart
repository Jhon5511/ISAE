import 'dart:io';

import 'package:path/path.dart';
import 'package:isae/src/models/IMC/imcDetailsM_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class IMCDetailsMDatabase {

  static final _databaseName = "ImcDetailsMDb.db";
  static final _databaseVersion = 1;
  static final table = 'imcDetailsM_table';

  IMCDetailsMDatabase._privateConstructor();
  static final IMCDetailsMDatabase instance = IMCDetailsMDatabase._privateConstructor();

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
            id INTEGER,
            idM INTEGER ,
            anioAnt TEXT NOT NULL,
            concepto TEXT NOT NULL,
            conceptoL TEXT NOT NULL,
            creditos TEXT NOT NULL,
            mesAct TEXT NOT NULL,
            mesAnt TEXT NOT NULL,
            porcentajeAnioAnt TEXT NOT NULL,
            porcentajeMesAnt TEXT NOT NULL,
            varAnioAnt TEXT NOT NULL,
            varMesAnt TEXT NOT NULL,
            PRIMARY KEY ( id, idM)
          )
          ''');
    /*await db.execute('''
          CREATE TABLE $table (
            id INTEGER PRIMARY KEY,
            anioAnt TEXT ARRAY NOT NULL,
            concepto TEXT ARRAY NOT NULL,
            conceptoL TEXT ARRAY NOT NULL,
            creditos TEXT ARRAY NOT NULL,
            mesAct TEXT ARRAY NOT NULL,
            mesAnt TEXT ARRAY NOT NULL,
            porcentajeAnioAnt TEXT ARRAY NOT NULL,
            porcentajeMesAnt TEXT ARRAY NOT NULL,
            varAnioAnt TEXT ARRAY NOT NULL,
            varMesAnt TEXT ARRAY NOT NULL
          )
          ''');*/
  }

  // inserted row.
  Future<void> insertDetails(IMCDetailsMModel details) async {
    Database db = await instance.database;
    await db.insert(table, details.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //get number of rows:
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  //Get all row in UserDataModel
  Future<List<IMCDetailsMModel>> getAllDetails() async {
    Database db = await instance.database;

    final List<Map<String, dynamic>> maps = await db.query(table);

    // Convierte List<Map<String, dynamic> en List<UserDataModel>.
    return List.generate(maps.length, (i) {
      return IMCDetailsMModel(
        idM: maps[i]['idM'],
        id: maps[i]['id'],
        aAnioAn: maps[i]['anioAnt'],
        aConcept: maps[i]['concepto'],
        aConceptL: maps[i]['conceptoL'],
        aCreditos: maps[i]['creditos'],
        aMonthAc: maps[i]['mesAct'],
        aMonthAn: maps[i]['mesAnt'],
        aPercentAA: maps[i]['porcentajeAnioAnt'],
        aPercentMA: maps[i]['porcentajeMesAnt'],
        aVarAnioAn: maps[i]['varAnioAnt'],
        aVarMonthAn: maps[i]['varMesAnt'],
      );
    });
  }

  //Get specific data from specific column
  Future<List<Map<String, dynamic>>> getDetail(String nColumn, int idM) async {
    Database db = await instance.database;

    return await db.rawQuery('SELECT $nColumn FROM $table WHERE idM = $idM');

  }

  //Get coun from specific column & idM
  Future<int> queryCount(String nColumn, int idM) async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT($nColumn) FROM $table WHERE idM = $idM'));
  }

  //Update row in UserDataModel
  Future<void> updateDetail(IMCDetailsMModel detail) async {
    Database db = await instance.database;

    await db.update(table, detail.toMap(), where: "id = ?", whereArgs: [detail.id]);
  }

  //Delete row in UserDataModel
  Future<void> deleteDetail(int id) async {
    Database db = await instance.database;

    await db.delete(table, where: "id = ?", whereArgs: [id]);
  }

}