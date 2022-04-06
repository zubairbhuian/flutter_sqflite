import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  intialDb() async {
    // get a location using getdatabsepath
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'weal.db');
    Database mydb = await openDatabase(path, onCreate: _onCreate);
    return mydb;
  }

  _onCreate(Database db, int version)async {
    await db.execute(sql)
  }
}
