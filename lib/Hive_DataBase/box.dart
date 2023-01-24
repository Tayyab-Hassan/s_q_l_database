import 'package:hive_flutter/hive_flutter.dart';
import 'package:s_q_l_database/Hive_DataBase/notes_modle.dart';

class Boxes {
  static Box<NotesModel> getData() => Hive.box<NotesModel>('notes');
}
