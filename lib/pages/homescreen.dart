import 'package:flutter/material.dart';
import 'package:flutter_sqflite/database/sqldb.dart';
import 'package:flutter_sqflite/pages/edite_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SqlDb sqlDb = SqlDb();
  bool isloading = true;
  List notes = [];
  Future readData() async {
    List<Map> responce = await sqlDb.readData("SELECT * FROM notes");
    notes.addAll(responce);
    isloading = false;
    setState(() {});
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: isloading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                TextButton(
                    onPressed: () async {
                      await sqlDb.deleteDatebase();
                    },
                    child: const Text('Delete Database')),
                ListView.builder(
                    itemCount: notes.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return Card(
                        child: ListTile(
                            title: Text("${notes[index]['note']}"),
                            subtitle: Text("${notes[index]['title']}"),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    int response = await sqlDb.deleteData(
                                        "DELETE FROM notes WHERE id = ${notes[index]['id']}");
                                    if (response > 0) {
                                      notes.removeWhere((element) =>
                                          element['id'] == notes[index]['id']);
                                      setState(() {});
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (_) => EditeData(
                                                  color: notes[index]['color'],
                                                  note: notes[index]['note'],
                                                  title: notes[index]['title'],
                                                  id: notes[index]['id'],
                                                )));
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            )),
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
