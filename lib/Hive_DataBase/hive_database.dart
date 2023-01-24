import 'package:flutter/material.dart';
import 'package:s_q_l_database/Hive_DataBase/box.dart';
import 'package:s_q_l_database/Hive_DataBase/notes_modle.dart';

class HiveDataBase extends StatefulWidget {
  const HiveDataBase({super.key});

  @override
  State<HiveDataBase> createState() => _HiveDataBaseState();
}

class _HiveDataBaseState extends State<HiveDataBase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HIVE DATA BASE'),
        centerTitle: true,
      ),
      body: Column(children: const []),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _showMyDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context) {
  final titlecontroller = TextEditingController();
  final descontroller = TextEditingController();
  return showDialog(
    context: context,
    builder: ((context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: titlecontroller,
                decoration: const InputDecoration(
                  focusColor: Colors.greenAccent,
                  label: Text('Title'),
                  hintText: 'Enter Your Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: descontroller,
                decoration: const InputDecoration(
                  focusColor: Colors.greenAccent,
                  label: Text('DESCRIPTION'),
                  hintText: 'Please Your Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              )
            ],
          ),
        ),
        title: const Text("ADD YOUR NOTE HERE"),
        actions: [
          TextButton(
              onPressed: () {
                final data = NotesModel(
                  description: descontroller.text.toString(),
                  title: titlecontroller.text.toString(),
                );
                final box = Boxes.getData();
                box.add(data);
                data.save();
                titlecontroller.clear();
                descontroller.clear();

                Navigator.pop(context);
              },
              child: const Text('Add')),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancle'))
        ],
      );
    }
    ),
  );
}
