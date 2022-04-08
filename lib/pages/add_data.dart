import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sqflite/database/sqldb.dart';
import 'package:flutter_sqflite/pages/homescreen.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  SqlDb sqlDb = SqlDb();
  GlobalKey<FormState> formState = GlobalKey();
  final TextEditingController _note = TextEditingController();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _color = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Notes')),
      body: ListView(padding: EdgeInsets.all(16.h), children: [
        Form(
            key: formState,
            child: Column(children: [
              TextFormField(
                controller: _note,
                decoration: const InputDecoration(hintText: 'note'),
              ),
              TextFormField(
                controller: _title,
                decoration: const InputDecoration(hintText: 'title'),
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'color'),
                controller: _color,
              ),
              SizedBox(
                height: 40.h,
              ),
              SizedBox(
                width: 160.h,
                child: ElevatedButton(
                  onPressed: () async {
                    int response = await sqlDb.insertData('''
                    INSERT INTO notes (`note` , `title` ,`color`)
                    VALUES ("${_note.text}","${_title.text}","${_color.text}")
                   ''');
                    if (response > 0) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                          (route) => false);
                    }
                  },
                  child: const Text('Add Note'),
                ),
              )
            ]))
      ]),
    );
  }
}
