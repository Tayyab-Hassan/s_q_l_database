import 'package:hive/hive.dart';
part 'notes_modle.g.dart';

@HiveType(typeId: 0)
class NotesModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  NotesModel({required this.description, required this.title});
}
