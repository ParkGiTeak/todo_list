import 'package:flutter/material.dart';
import 'package:todo_list/create_screen.dart';
import 'package:todo_list/todo_item.dart';

import 'main.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo 리스트'),
      ),
      body: ListView(
        children: todos.values.map((e) {
          return TodoItem(
            todo: e,
            onTap: (todo) async {
              todo.isDone = !todo.isDone;
              if (todos.get(todo.id) != null) {
                await todos.put(todo.id, todo);
              } else {
                throw ('currentTodo is not contains DB');
              }

              setState(() {});
            },
            onDelete: (todo) async {
              if (todos.get(todo.id) != null) {
                await todos.delete(todo.id);
              } else {
                throw ('currentTodo is not contains DB');
              }
              setState(() {});
            },
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateScreen()),
          );

          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
