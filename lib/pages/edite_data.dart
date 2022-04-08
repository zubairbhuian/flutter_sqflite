import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sqflite/database/sqldb.dart';
import 'package:flutter_sqflite/pages/homescreen.dart';

class EditeData extends StatefulWidget {
  final note;
  final title;
  final id;
  final color;
  const EditeData({Key? key, this.note, this.title, this.id, this.color})
      : super(key: key);

  @override
  State<EditeData> createState() => _EditeDataState();
}

class _EditeDataState extends State<EditeData> {
  SqlDb sqlDb = SqlDb();
  GlobalKey<FormState> formState = GlobalKey();
  final TextEditingController _note = TextEditingController();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _color = TextEditingController();

  @override
  void initState() {
    _note.text = widget.note;
    _title.text = widget.title;
    _color.text = widget.color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edite Notes')),
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
                    int response = await sqlDb.updateData('''
                    UPDATE notes SET 
                    note="${_note.text}",
                    title="${_title.text}",
                    color="${_color.text}"
                    WHERE id = "${widget.id}"
                   ''');
                    if (response > 0) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                          (route) => false);
                    }
                  },
                  child: const Text('Edit Note'),
                ),
              )
            ]))
      ]),
    );
  }
}
