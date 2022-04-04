import 'package:flutter_sqflite/database/database_conection.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  DatabaseConection? _databaseconection;
  Repository() {
    _databaseconection = DatabaseConection();
  }

  static Database _database;

  Future<Database> get  database()async{
if(_database !=null)return database;
_database=await _databaseconection?.setDatabase();
return _database;
  }
}
