import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  GlobalKey<FormState> formState = GlobalKey();
  final TextEditingController _note = TextEditingController();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _color = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Notes')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        Form(
            key: formState,
            child: Column(children: [
              TextFormField(
                controller: _note,
                decoration: const InputDecoration(hintText: 'note'),
              ),
              TextFormField(
                controller: _title,
                decoration: const InputDecoration(hintText: 'note'),
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'color'),
                controller: _color,
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Add Note'),
                ),
              )
            ]))
      ]),
    );
  }
}
