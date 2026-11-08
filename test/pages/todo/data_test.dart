import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:doottodooat/database/database.dart';
import 'package:doottodooat/pages/todo/data.dart';

void main() {
  test('addTodo inserts a row', () async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);

    await Data(db).addTodo('Milk');

    final todos = await db.select(db.todos).get();
    expect(todos.single.title, 'Milk');
  });
}
