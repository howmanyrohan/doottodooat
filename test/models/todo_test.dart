import 'package:flutter_test/flutter_test.dart';

import 'package:doottodooat/models/todo.dart';

void main() {
  test('fromJson reads a Supabase row', () {
    final todo =
        Todo.fromJson({'id': 1, 'title': 'Milk', 'done': false, 'position': 1});
    expect((todo.id, todo.title, todo.done, todo.position),
        (1, 'Milk', false, 1.0));
  });
}
