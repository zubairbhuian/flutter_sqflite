import 'package:flutter/material.dart';
import 'package:flutter_sqflite/pages/home_screen.dart';

class CategoriasScreen extends StatelessWidget {
  const CategoriasScreen({Key? key}) : super(key: key);

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
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
