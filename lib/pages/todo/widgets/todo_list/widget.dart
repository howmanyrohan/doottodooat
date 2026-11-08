import 'package:flutter/material.dart';

import 'package:doottodooat/database/database.dart' show Todo;

class TodoList extends StatelessWidget {
  const TodoList({super.key, required this.todos});

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [for (final todo in todos) ListTile(title: Text(todo.title))],
    );
  }
}
