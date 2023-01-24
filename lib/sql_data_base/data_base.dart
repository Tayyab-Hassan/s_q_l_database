// ignore_for_file: avoid_print


import 'package:flutter/material.dart';
import 'package:s_q_l_database/sql_data_base/db_handler.dart';
import 'package:s_q_l_database/sql_data_base/notes.dart';

class DataBase extends StatefulWidget {
  const DataBase({super.key});

  @override
  State<DataBase> createState() => _DataBaseState();
}

class _DataBaseState extends State<DataBase> {
  DataBaseHelper? dataBaseHelper;
  late Future<List<NotesModle>> notesList;
  @override
  void initState() {
    super.initState();
    dataBaseHelper = DataBaseHelper();
    loadData();
  }

  loadData() async {
    notesList = dataBaseHelper!.getNotesList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('STORE BOX '),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: notesList,
                builder: (context, AsyncSnapshot<List<NotesModle>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          background: Container(
                            color: Colors.red,
                            child: const Icon(Icons.delete_forever_outlined),
                          ),
                          direction: DismissDirection.endToStart,
                          key: ValueKey<int>(snapshot.data![index].id),
                          onDismissed: (direction) {
                            setState(() {
                              dataBaseHelper!.delete(snapshot.data![index].id);
                              notesList = dataBaseHelper!.getNotesList();

                              snapshot.data!.remove(snapshot.data![index]);
                            });
                          },
                          child: Card(
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title:
                                  Text(snapshot.data![index].title.toString()),
                              subtitle: Text(
                                  snapshot.data![index].description.toString()),
                              trailing: Text(
                                  'ID : ${snapshot.data![index].id.toString()}'),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
