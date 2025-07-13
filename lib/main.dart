import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_list/list_screen.dart';

import 'model/todo.dart';

late final Box<Todo> todos;

void main() async {
  // 각 플랫폼의 바인딩을 요청 보통 runApp에서 하지만 path_provider와 같이
  // 네이티브에 접근하는 라이브러리를 runApp전에 사용하면 먼저 호출해야한다.
  // 멱시적함수여서 한번 초기화되면 다음부터는 작동하지 않고 runApp에서 보통 한다.
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  final String path = appDocumentDir.path;
  Hive
    ..init(path)
    ..registerAdapter(TodoAdapter());
  todos = await Hive.openBox<Todo>('todolist.db');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ListScreen(),
    );
  }
}
