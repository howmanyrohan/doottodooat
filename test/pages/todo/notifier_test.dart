import 'package:flutter_test/flutter_test.dart';

import 'package:doottodooat/models/todo.dart';
import 'package:doottodooat/pages/todo/notifier.dart';

import 'fake_data.dart';

void main() {
  const a = Todo(id: 1, title: 'A', done: false, position: 3);
  const b = Todo(id: 2, title: 'B', done: false, position: 2);
  const c = Todo(id: 3, title: 'C', done: false, position: 1);

  test('moving between two todos takes the midpoint', () async {
    final data = FakeData();
    await Notifier(data).move([a, b, c], 0, 1);
    expect(data.moved, {1: 1.5});
  });

  test('moving to the top goes above the first', () async {
    final data = FakeData();
    await Notifier(data).move([a, b, c], 2, 0);
    expect(data.moved, {3: 4});
  });

  test('moving to the bottom goes below the last', () async {
    final data = FakeData();
    await Notifier(data).move([a, b, c], 0, 2);
    expect(data.moved, {1: 0});
  });
}
