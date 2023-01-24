// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:s_q_l_database/sql_data_base/data_base.dart';
import 'package:s_q_l_database/sql_data_base/db_handler.dart';
import 'package:s_q_l_database/sql_data_base/notes.dart';

class StoreData extends StatefulWidget {
  const StoreData({super.key});

  @override
  State<StoreData> createState() => _StoreDataState();
}

class _StoreDataState extends State<StoreData> {
  DataBaseHelper? dataBaseHelper;
  late Future<List<NotesModle>> notesList;

  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController depController = TextEditingController();
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            titleController.clear();
            noteController.clear();
            ageController.clear();
            depController.clear();
            Random no = Random();
            dataBaseHelper!
                .insert(NotesModle(
                    title: titleController.text.toString(),
                    age: int.parse(ageController.text.toString()),
                    email: 'R.love.t.143.pk@gmail.com',
                    description: depController.text.toString(),
                    id: no.nextInt(100)))
                .then((value) {
              print('Data added');
            }).onError((error, stackTrace) {
              print(error.toString());
            });
          });
        },
        child: const Icon(Icons.check),
      ),
      appBar: AppBar(
        title: const Text('Input Your Data Here'),
      ),
      body: Container(
        color: Colors.greenAccent,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 222, 226, 231),
                  filled: true,
                  hintText: 'Please Enter Your Title',
                  label: const Text('TITLE'),
                  hintStyle: const TextStyle(
                    fontFamily: 'Pacifico',
                    fontWeight: FontWeight.bold,
                  ),
                  suffixIcon: const Icon(Icons.title_outlined),
                  prefixIcon: const Icon(
                    Icons.title_rounded,
                    color: Color.fromARGB(255, 87, 6, 6),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: noteController,
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 222, 226, 231),
                  filled: true,
                  hintText: 'Please Enter Your Notes',
                  label: const Text('NOTES'),
                  hintStyle: const TextStyle(
                    fontFamily: 'Pacifico',
                    fontWeight: FontWeight.bold,
                  ),
                  suffixIcon: const Icon(Icons.note),
                  prefixIcon: const Icon(
                    Icons.note_add_rounded,
                    color: Color.fromARGB(255, 87, 6, 6),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: ageController,
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 222, 226, 231),
                  filled: true,
                  hintText: 'Please Enter Your Age',
                  label: const Text('AGE'),
                  hintStyle: const TextStyle(
                    fontFamily: 'Pacifico',
                    fontWeight: FontWeight.bold,
                  ),
                  suffixIcon: const Icon(Icons.person_add_alt_sharp),
                  prefixIcon: const Icon(
                    Icons.person_add_alt_1_outlined,
                    color: Color.fromARGB(255, 87, 6, 6),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: depController,
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 222, 226, 231),
                  filled: true,
                  hintText: 'Please Enter Your Description',
                  label: const Text('DESCRIPTION'),
                  hintStyle: const TextStyle(
                    fontFamily: 'Pacifico',
                    fontWeight: FontWeight.bold,
                  ),
                  suffixIcon: const Icon(Icons.description_outlined),
                  prefixIcon: const Icon(
                    Icons.description_sharp,
                    color: Color.fromARGB(255, 87, 6, 6),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 29,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.amber),
                overlayColor: MaterialStatePropertyAll(Colors.cyanAccent),
                shape: MaterialStatePropertyAll(OvalBorder()),
                fixedSize: MaterialStatePropertyAll(Size(250, 45)),
                elevation: MaterialStatePropertyAll(15.0),
                shadowColor: MaterialStatePropertyAll(Colors.redAccent),
                textStyle: MaterialStatePropertyAll(
                  TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 6, 156, 11)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DataBase(),
                  ),
                );
                setState(() {});
              },
              child: const Text(
                'STORE BOX',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
