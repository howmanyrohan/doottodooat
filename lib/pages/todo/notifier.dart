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

  Future<void> delete(Todo todo) => data.deleteTodo(todo.id);

  Future<void> signOut() => data.signOut();
}
