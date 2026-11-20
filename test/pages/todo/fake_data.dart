import 'package:doottodooat/models/todo.dart';
import 'package:doottodooat/pages/todo/interface.dart';

class FakeData implements Interface {
  FakeData([this.todos = const []]);
  final List<Todo> todos;
  final added = <String>[];
  final done = <int, bool>{};
  final renamed = <int, String>{};
  final moved = <int, double>{};
  final deleted = <int>[];

  @override
  Stream<List<Todo>> watchTodos() => Stream.value(todos);

  @override
  Future<void> addTodo(String title) async => added.add(title);

  @override
  Future<void> setDone(int id, bool value) async => done[id] = value;

  @override
  Future<void> renameTodo(int id, String title) async => renamed[id] = title;

  @override
  Future<void> moveTodo(int id, double position) async => moved[id] = position;

  @override
  Future<void> deleteTodo(int id) async => deleted.add(id);

  @override
  Future<void> signOut() async {}
}
