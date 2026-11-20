import 'package:flutter/material.dart';

import 'package:doottodooat/models/todo.dart';

part 'state.dart';

class TodoTile extends StatefulWidget {
  const TodoTile({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onRename,
  });

  final Todo todo;
  final ValueChanged<Todo> onToggle;
  final void Function(Todo todo, String title) onRename;

  @override
  State<TodoTile> createState() => _TodoTileState();
}
