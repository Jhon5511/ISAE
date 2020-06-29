import 'dart:io';

import 'package:path/path.dart';
import 'package:isae/src/models/General/gnrlDetails_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class GnrlEDetailsVivDatabase {

  static final _databaseName = "GnrlEDetailsVivDb.db";
  static final _databaseVersion = 1;
  static final table = 'gnrlEDetailsViv_table';

  GnrlEDetailsVivDatabase._privateConstructor();
  static final GnrlEDetailsVivDatabase instance = GnrlEDetailsVivDatabase._privateConstructor();

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
            idDt INTEGER ,
            anticipos TEXT NOT NULL,
            capital TEXT NOT NULL,
            intereses TEXT NOT NULL,
            leyenda TEXT NOT NULL,
            pedidos TEXT NOT NULL,
            plazo_promedio TEXT NOT NULL,
            saldo TEXT NOT NULL,
            ticket_promedio TEXT NOT NULL,
            PRIMARY KEY ( idD, idDt)
          )
          ''');
  }

  // inserted row.
  Future<void> insertDetails(GnrlDetailsModel details) async {
    Database db = await instance.database;
    await db.insert(table, details.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //get number of rows:
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  //Get all row in UserDataModel
  Future<List<GnrlDetailsModel>> getAllDetails() async {
    Database db = await instance.database;

    final List<Map<String, dynamic>> maps = await db.query(table);

    // Convierte List<Map<String, dynamic> en List<UserDataModel>.
    return List.generate(maps.length, (i) {
      return GnrlDetailsModel(
        idD: maps[i]['idD'],
        idDt: maps[i]['idDt'],
        aAnticipos: maps[i]['anticipos'],
        aCapital: maps[i]['capital'],
        aIntereses: maps[i]['intereses'],
        aLeyenda: maps[i]['leyenda'],
        aPedidos: maps[i]['pedidos'],
        aPlazoProm: maps[i]['plazo_promedio'],
        aSaldo: maps[i]['saldo'],
        aTicketProm: maps[i]['ticket_promedio'],
      );
    });
  }

  //Get specific data from specific column
  Future<List<Map<String, dynamic>>> getDetail(String nColumn, int idD) async {
    Database db = await instance.database;

    return await db.rawQuery('SELECT $nColumn FROM $table WHERE idD = $idD');

  }

  //get subdetails
  Future<List<Map<String, dynamic>>> getSubDetail(String nColumn, int idD, int idDt) async {
    Database db = await instance.database;

    return await db.rawQuery('SELECT $nColumn FROM $table WHERE idD = $idD AND idDt = $idDt');

  }
  //Get coun from specific column & idM
  Future<int> queryCount(String nColumn, int idD) async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT($nColumn) FROM $table WHERE idD = $idD'));
  }

  //Update row in GnrlDetailsModel
  Future<void> updateDetail(GnrlDetailsModel detail) async {
    Database db = await instance.database;

    await db.update(table, detail.toMap(), where: "idDt = ?", whereArgs: [detail.idDt]);
  }

  //Delete row in GnrlDetailsModel
  Future<void> deleteDetail(int id) async {
    Database db = await instance.database;

    await db.delete(table);
    //await db.delete(table, where: "idDt = ?", whereArgs: [id]);
  }

}