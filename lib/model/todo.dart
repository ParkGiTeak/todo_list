import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  int dateTime;
  @HiveField(3)
  bool isDone;

  Todo({
    required this.id,
    required this.title,
    required this.dateTime,
    this.isDone = false,
  });
}
