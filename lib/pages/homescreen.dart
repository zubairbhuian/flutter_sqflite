import 'package:flutter/material.dart';
import 'package:flutter_sqflite/database/sqldb.dart';

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
        children: [
          // ElevatedButton(
          //     onPressed: () async {
          //       await sqlDb.deleteDatebase();
          //     },
          //     child: const Text('Delete Database')),
          FutureBuilder(
              future: readData(),
              builder:
                  ((BuildContext context, AsyncSnapshot<List<Map>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) {
                        return Card(
                          child: ListTile(
                            title: Text("${snapshot.data![index]['note']}"),
                            subtitle: Text("${snapshot.data![index]['title']}"),
                            trailing: IconButton(
                              onPressed: () async {
                                int response = await sqlDb.deleteData(
                                    "DELETE FROM notes WHERE id = ${snapshot.data![index]['id']}");
                                if (response > 0) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (_) => const HomeScreen()),
                                      (route) => false);
                                }
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
                      }));
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("adddata");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
