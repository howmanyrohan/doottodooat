import 'package:doottodooat/models/todo.dart';

abstract interface class Interface {
  Stream<List<Todo>> watchTodos();
  Future<void> addTodo(String title);
  Future<void> setDone(int id, bool done);
  Future<void> deleteTodo(int id);
  Future<void> signOut();
}
