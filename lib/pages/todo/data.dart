import 'package:doottodooat/database/database.dart';
import 'package:doottodooat/pages/todo/interface.dart';

class Data implements Interface {
  Data(this.db);
  final AppDatabase db;

  @override
  Stream<List<Todo>> watchTodos() => db.select(db.todos).watch();

  @override
  Future<void> addTodo(String title) =>
      db.into(db.todos).insert(TodosCompanion.insert(title: title));
}
