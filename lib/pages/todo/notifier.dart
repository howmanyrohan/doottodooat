import 'package:flutter/foundation.dart';

import 'package:doottodooat/models/todo.dart';
import 'package:doottodooat/pages/todo/interface.dart';

class Notifier extends ChangeNotifier {
  Notifier(this.data);
  final Interface data;

  late final Stream<List<Todo>> todos = data.watchTodos();

  Future<void> addTodo(String title) async {
    if (title.trim().isEmpty) return;
    await data.addTodo(title.trim());
  }

  Future<void> toggle(Todo todo) => data.setDone(todo.id, !todo.done);

  Future<void> rename(Todo todo, String title) async {
    if (title.trim().isEmpty || title.trim() == todo.title) return;
    await data.renameTodo(todo.id, title.trim());
  }

  Future<void> move(List<Todo> todos, int from, int to) async {
    final todo = todos[from];
    final others = [...todos]..removeAt(from);
    final above = to > 0 ? others[to - 1].position : null;
    final below = to < others.length ? others[to].position : null;
    final position = switch ((above, below)) {
      (null, null) => todo.position,
      (final a?, null) => a - 1,
      (null, final b?) => b + 1,
      (final a?, final b?) => (a + b) / 2,
    };
    await data.moveTodo(todo.id, position);
  }

  Future<void> delete(Todo todo) => data.deleteTodo(todo.id);

  Future<void> signOut() => data.signOut();
}
