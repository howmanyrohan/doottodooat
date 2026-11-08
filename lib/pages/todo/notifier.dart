import 'package:flutter/foundation.dart';

import 'package:doottodooat/database/database.dart' show Todo;
import 'package:doottodooat/pages/todo/interface.dart';

class Notifier extends ChangeNotifier {
  Notifier(this.data);
  final Interface data;

  late final Stream<List<Todo>> todos = data.watchTodos();

  Future<void> addTodo(String title) async {
    if (title.trim().isEmpty) return;
    await data.addTodo(title.trim());
  }
}
