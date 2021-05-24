import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import '../screens/home/directory-page/directory_screen.dart';

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'favorite_setence';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path, version: _databaseVersion,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE $table (
          id TEXT NOT NULL,
          audioResource TEXT,
          translatedAudioResource TEXT,
          language TEXT,
          toLang TEXT,
          vietnameseN TEXT,
          vietnameseS TEXT,
          spanish TEXT,
          japanese TEXT,
          chinese TEXT,
          french TEXT,
          english TEXT,
          american TEXT

          )
          ''');
    });
  }

  Future<int> insert(Map<String, dynamic> row) async {
    print(row);
    print('debugging');
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<bool> checkIdExists(String id) async {
    Database db = await instance.database;
    var result = await db.rawQuery(
      'SELECT EXISTS(SELECT 1 FROM $table WHERE id="$id")',
    );
    int exists = Sqflite.firstIntValue(result);
    return exists == 1;
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<bool> delete(String id) async {
    Database db = await instance.database;
    // return await db.delete(table, where: 'id = $id', whereArgs: [id]);
    int deleteResult = await db.rawDelete('DELETE FROM $table WHERE id="$id" ');
    return deleteResult == 1;
  }

  Future<int> deleteAll() async {
    Database db = await instance.database;
    // return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
    return await db.delete(table);
  }
}
