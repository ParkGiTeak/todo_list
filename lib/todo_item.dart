import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(Todo) onTap;
  final Function(Todo) onDelete;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap(todo);
      },
      leading: todo.isDone
          ? Icon(Icons.check_circle, color: Colors.green)
          : Icon(Icons.check_circle_outline),
      title: Text(
        todo.title,
        style: TextStyle(color: todo.isDone ? Colors.grey : Colors.black),
      ),
      subtitle: Text(
        DateFormat.yMMMMd().format(
          DateTime.fromMillisecondsSinceEpoch(todo.dateTime),
        ),
        style: TextStyle(color: todo.isDone ? Colors.grey : Colors.black),
      ),
      trailing: todo.isDone
          ? GestureDetector(
              child: Icon(Icons.delete_forever),
              onTap: () {
                onDelete(todo);
              },
            )
          : null,
    );
  }
}
