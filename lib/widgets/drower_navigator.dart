import 'package:flutter/material.dart';
import 'package:flutter_sqflite/pages/categories_screen.dart';
import 'package:flutter_sqflite/pages/home_screen.dart';

class DrawerNavigator extends StatelessWidget {
  const DrawerNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://lh3.googleusercontent.com/a-/AOh14Gj6PZBNfnTwfQ4b4fbXZx5WPC3eV2pUJxhyy409yA=s80'),
            ),
            accountName: Text('Dr. Tarek'),
            accountEmail: Text('tirahman105@gmail.com')),
        ListTile(
          title: const Text("Home"),
          leading: const Icon(Icons.home),
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => const HomeScreen())),
        ),
        ListTile(
          title: const Text("Categories"),
          leading: const Icon(Icons.view_list),
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const CategoriasScreen())),
        ),
      ]),
    );
  }
}
