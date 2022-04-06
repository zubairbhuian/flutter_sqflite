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
            ElevatedButton(
                onPressed: () async {
                  var response = await sqlDb.insertData(
                      "INSERT INTO 'notes' ('note') VALUES('note one')");
                  print(response);
                },
                child: const Text('Create')),
            ElevatedButton(
                onPressed: () async {
                  List<Map> response =
                      await sqlDb.readData("SELECT *FROM 'notes'");
                  print("$response");
                },
                child: const Text('ReadData')),
            ElevatedButton(onPressed: ()async {
              int response = await sqlDb
                      .updateData("UPDATE 'notes' SET 'note'= 'note sex' WHERE id =6");
                  print("$response");
            }, child: const Text('Update')),
            ElevatedButton(
                onPressed: () async {
                  int response = await sqlDb
                      .deleteData("DELETE FROM 'notes' WHERE id =7 ");
                  print("$response");
                },
                child: const Text('Delete'))
          ],
        ),
      ),
    );
  }
}
