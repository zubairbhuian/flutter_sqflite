import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    // get a location using getdatabsepath
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'weal.db');
    Database mydb = await openDatabase(path, onCreate: _onCreate,version: 1,onUpgrade: _onUpgrade);
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
  _onUpgrade(Database db,int oldversion,int newversion)async{

  }

  // SELECT
  // DELETE
  // UPDATE
  // INSERT
  readData(String sql) async {
    Database? mydb = await db;
    List<Map> respose = await mydb!.rawQuery(sql);
    return respose;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int respose = await mydb!.rawInsert(sql);
    return respose;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int respose = await mydb!.rawUpdate(sql);
    return respose;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int respose = await mydb!.rawDelete(sql);
    return respose;
  }
}
