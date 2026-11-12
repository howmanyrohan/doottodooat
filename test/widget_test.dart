import 'package:flutter/material.dart' hide Page;
import 'package:flutter_test/flutter_test.dart';

import 'package:doottodooat/models/todo.dart';
import 'package:doottodooat/pages/todo/interface.dart';
import 'package:doottodooat/pages/todo/page.dart';

class FakeData implements Interface {
  FakeData([this.todos = const []]);
  final List<Todo> todos;
  final added = <String>[];
  final done = <int, bool>{};
  final deleted = <int>[];

  @override
  Stream<List<Todo>> watchTodos() => Stream.value(todos);

  @override
  Future<void> addTodo(String title) async => added.add(title);

  @override
  Future<void> setDone(int id, bool value) async => done[id] = value;

  @override
  Future<void> deleteTodo(int id) async => deleted.add(id);

  @override
  Future<void> signOut() async {}
}

void main() {
  const milk = Todo(id: 1, title: 'Milk', done: false);

  testWidgets('submitting the input adds a todo', (tester) async {
    final data = FakeData();
    await tester.pumpWidget(MaterialApp(home: Page(data: data)));

    expect(find.text('Add a todo...'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'Milk');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(data.added, ['Milk']);
    expect(find.text('Milk'), findsNothing);
  });

  testWidgets('tapping a todo marks it done', (tester) async {
    final data = FakeData([milk]);
    await tester.pumpWidget(MaterialApp(home: Page(data: data)));
    await tester.pump();

    await tester.tap(find.text('Milk'));

    expect(data.done, {1: true});
  });

  testWidgets('delete button deletes the todo', (tester) async {
    final data = FakeData([milk]);
    await tester.pumpWidget(MaterialApp(home: Page(data: data)));
    await tester.pump();

    await tester.tap(find.byTooltip('Delete'));

    expect(data.deleted, [1]);
  });
}
