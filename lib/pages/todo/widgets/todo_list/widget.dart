import 'package:flutter/material.dart';

import 'package:doottodooat/models/todo.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.todos,
    required this.onToggle,
    required this.onDelete,
  });

  final List<Todo> todos;
  final ValueChanged<Todo> onToggle;
  final ValueChanged<Todo> onDelete;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (final todo in todos)
          ListTile(
            onTap: () => onToggle(todo),
            leading: Checkbox(
              value: todo.done,
              onChanged: (_) => onToggle(todo),
            ),
            title: Text(
              todo.title,
              style: todo.done
                  ? const TextStyle(decoration: TextDecoration.lineThrough)
                  : null,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              tooltip: 'Delete',
              onPressed: () => onDelete(todo),
            ),
          ),
      ],
    );
  }
}
