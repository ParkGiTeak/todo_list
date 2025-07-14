import 'package:flutter/material.dart';
import 'package:todo_list/main.dart';
import 'package:todo_list/model/todo.dart';
import 'package:uuid/uuid.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo 작성'),
        actions: [
          IconButton(
            onPressed: () async {
              final String newTodoId = Uuid().v4();
              await todos.put(
                newTodoId,
                Todo(
                  id: newTodoId,
                  title: _textController.text,
                  dateTime: DateTime.now().millisecondsSinceEpoch,
                ),
              );

              if (mounted) {
                Navigator.pop(context);
              }
            },
            icon: Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _textController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: '할일을 입력하세요.',
            hintStyle: TextStyle(color: Colors.grey[800]),
            filled: true,
            fillColor: Colors.white70,
          ),
        ),
      ),
    );
  }
}
