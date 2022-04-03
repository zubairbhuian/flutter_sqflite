import 'package:flutter/material.dart';
import 'package:flutter_sqflite/pages/home_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CategoriasScreen extends StatefulWidget {
  const CategoriasScreen({Key? key}) : super(key: key);

  @override
  State<CategoriasScreen> createState() => _CategoriasScreenState();
}

class _CategoriasScreenState extends State<CategoriasScreen> {
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const HomeScreen())),
            child: const Icon(Icons.arrow_back)),
        title: const Text('Categories'),
      ),
      body: const Center(child: Text('demo')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(context, 'Cencle'),
                          child: const Text('Cencle',
                              style: TextStyle(color: Colors.white)),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.red)),
                      TextButton(
                          onPressed: () {
                            print('A:${_categoryController.text}');
                            print('B:${_descriptionController.text}');
                            Fluttertoast.showToast(
                                msg: ' Add Successfully',
                                textColor: Colors.green,
                                backgroundColor: Colors.grey[400]);
                            Navigator.pop(context, 'Ok');
                          },
                          child: const Text('Add',
                              style: TextStyle(color: Colors.white)),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blue))
                    ],
                    title: const Text('Categories Form'),
                    content: SingleChildScrollView(
                        child: Column(
                      children: [
                        TextField(
                          controller: _categoryController,
                          decoration: const InputDecoration(
                              hintText: 'Write Category',
                              labelText: 'Category'),
                        ),
                        TextField(
                          controller: _descriptionController,
                          decoration: const InputDecoration(
                              hintText: 'Write Description',
                              labelText: 'Description'),
                        ),
                      ],
                    )),
                  ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
