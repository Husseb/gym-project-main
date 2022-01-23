import 'dart:io';

import 'package:flutter_gym_app/models/day.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBDayHelper {
  DBDayHelper._();
  static DBDayHelper dbDayHelper = DBDayHelper._();
  static String id = 'id';
  static String day = 'day';
  static String date = 'date';
  static String water = 'water';
  static String wight = 'wight';
  static String daytable = 'daytable';

  Database database;

  initDatabase() async {
    if (database == null) {
      database = await connectToDatabase();
    }
  }

  Future<Database> connectToDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path; // get
    String databasePath = join(appDocPath, 'gym.db'); // to create db path
    Database database =
        await openDatabase(databasePath, version: 1, onCreate: (db, version) {
      createTable(db);
    }); // to connect to database if its estableshed else will be create new one and return connection to DB
    return database;
  }

  createTable(Database db) {
    db.execute(
        '''CREATE TABLE $daytable (id INTEGER PRIMARY KEY AUTOINCREMENT, day TEXT NOT NULL, date TEXT NOT NULL,water Double,wight Double )''');
  }

  insertInToDatabase(Day day) async {
    try {
      int rowIndex = await database.insert(daytable, day.toMap());
      print(rowIndex);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<List<Map<String, dynamic>>> getAllDaysDataFromDatabase() async {
    try {
      List<Map<String, dynamic>> allDays = await database.query(daytable);
      return allDays;
    } on Exception catch (e) {
      print(e);
    }
  }

  getOnePersonFromDatabase(int dayId) async {
    try {
      List<Map<String, dynamic>> listResult = await database.query(daytable,
          where: '$id=?',
          whereArgs: [dayId],
          // columns: [name, age, gender],
          distinct: true,
          limit: 1);
      Map<String, dynamic> result =
          listResult != null ? listResult.first : null;
         return result;
    } on Exception catch (e) {
      print(e);
    }
  }

  deleteOnePersonFromDatabase(int dayId) {
    database.delete(daytable, where: 'id=?', whereArgs: [dayId]);
  }

  updateDataInDatabase(Day day)async {

  database.update(daytable, day.toMap(), where: 'id=?', whereArgs: [day.id]);
  }

  deleteAllFromDatabase() {
    database.delete(daytable);
  }
}
