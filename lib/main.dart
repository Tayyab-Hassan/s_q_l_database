import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:s_q_l_database/Hive_DataBase/hive_database.dart';
import 'package:s_q_l_database/Hive_DataBase/notes_modle.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>('notes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        platform: TargetPlatform.android,
        brightness: Brightness.light,
        canvasColor: Colors.greenAccent,
        primarySwatch: Colors.green,
      ),
      home: const HiveDataBase(),
    );
  }
}
