import 'package:flutter/material.dart';

import 'package:doottodooat/models/todo.dart';
import 'package:doottodooat/pages/todo/widgets/todo_tile/widget.dart';

part 'state.dart';

class TodoList extends StatefulWidget {
  const TodoList({
    super.key,
    required this.todos,
    required this.onToggle,
    required this.onRename,
    required this.onMove,
    required this.onDelete,
  });

  final List<Todo> todos;
  final ValueChanged<Todo> onToggle;
  final void Function(Todo todo, String title) onRename;
  final void Function(List<Todo> todos, int from, int to) onMove;
  final ValueChanged<Todo> onDelete;

  @override
  State<TodoList> createState() => _TodoListState();
}
