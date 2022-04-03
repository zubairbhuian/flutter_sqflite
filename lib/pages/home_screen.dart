import 'package:flutter/material.dart';
import 'package:flutter_sqflite/widgets/drower_navigator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerNavigator(),
      appBar: AppBar(
        title: const Text('Tudolist Sqflite'),
      ),
    );
  }
}
