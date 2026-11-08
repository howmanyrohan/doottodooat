import 'package:flutter/material.dart' hide Page;
import 'package:flutter_test/flutter_test.dart';

import 'package:doottodooat/database/database.dart' show Todo;
import 'package:doottodooat/pages/todo/interface.dart';
import 'package:doottodooat/pages/todo/page.dart';

class FakeData implements Interface {
  final added = <String>[];

  @override
  Stream<List<Todo>> watchTodos() => Stream.value([]);

  @override
  Future<void> addTodo(String title) async => added.add(title);
}

void main() {
  testWidgets('submitting the input adds a todo', (tester) async {
    final data = FakeData();
    await tester.pumpWidget(MaterialApp(home: Page(data: data)));

    expect(find.text('Add a todo...'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'Milk');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(data.added, ['Milk']);
    expect(find.text('Milk'), findsNothing); // input cleared
  });
}
