import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    }else{
      return _db;
    }
  }

  intialDb() async {
    // get a location using getdatabsepath
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'weal.db');
    Database mydb = await openDatabase(path, onCreate: _onCreate);
    return mydb;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "notes"(
      id INTEGER  AUTOINCREMENT NOT NULL PRIMARY KEY,
      notes TEXT NOT NULL
    )
    ''');
    print("Create");
  }
}
