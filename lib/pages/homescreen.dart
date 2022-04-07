import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/database/sqldb.dart';
import 'package:flutter_sqflite/pages/add_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SqlDb sqlDb = SqlDb();
  Future<List<Map>> readData() async {
    List<Map> responce = await sqlDb.readData("SELECT * FROM notes");
    return responce;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: ListView(
        children: const [],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, CupertinoPageRoute(builder: (_) => const AddData()));
          },
          child: const Icon(Icons.add)),
    );
  }
}
