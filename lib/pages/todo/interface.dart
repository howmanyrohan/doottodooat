import 'package:doottodooat/database/database.dart' show Todo;

abstract interface class Interface {
  Stream<List<Todo>> watchTodos();
  Future<void> addTodo(String title);
}
