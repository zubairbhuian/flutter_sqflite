import 'package:flutter/material.dart';
import 'package:flutter_sqflite/database/sqldb.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SqlDb sqlDb = SqlDb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SQL Lite Practice')),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () async {
                  var response = await sqlDb
                      .insertData("INSERT INTO 'noteS'VALUES('note one')");
                  print(response);
                },
                child: const Text('Create')),
            TextButton(
                onPressed: () async {
                  List<Map> response =
                      await sqlDb.readData("SECCT *FROM 'notes'");
                  print(response);
                },
                child: const Text('Upgrate')),
          ],
        ),
      ),
    );
  }
}
