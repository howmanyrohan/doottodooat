import 'package:flutter/material.dart' hide Page;
import 'package:flutter_test/flutter_test.dart';

import 'package:doottodooat/models/todo.dart';
import 'package:doottodooat/pages/todo/page.dart';

import 'fake_data.dart';

void main() {
  const milk = Todo(id: 1, title: 'Milk', done: false, position: 2);
  const bread = Todo(id: 3, title: 'Bread', done: true, position: 0);

  Future<FakeData> pumpPage(WidgetTester tester, [List<Todo>? todos]) async {
    final data = FakeData(todos ?? [milk]);
    await tester.pumpWidget(MaterialApp(home: Page(data: data)));
    await tester.pump();
    return data;
  }

  testWidgets('submitting the input adds a todo', (tester) async {
    final data = await pumpPage(tester, []);

    expect(find.text('Add a todo...'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'Milk');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(data.added, ['Milk']);
    expect(find.text('Milk'), findsNothing);
  });

  testWidgets('tapping the circle marks it done', (tester) async {
    final data = await pumpPage(tester);

    await tester.tap(find.byTooltip('Mark done'));

    expect(data.done, {1: true});
  });

  testWidgets('tapping the title edits it', (tester) async {
    final data = await pumpPage(tester);

    await tester.tap(find.text('Milk'));
    await tester.pump();
    await tester.enterText(find.byType(TextField).last, 'Oat milk');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(data.renamed, {1: 'Oat milk'});
  });

  testWidgets('swiping deletes the todo', (tester) async {
    final data = await pumpPage(tester);

    await tester.drag(find.text('Milk'), const Offset(-1000, 0));
    await tester.pumpAndSettle();

    expect(data.deleted, [1]);
  });

  testWidgets('done todos are under Completed', (tester) async {
    await pumpPage(tester, [milk, bread]);

    expect(find.text('Completed (1)'), findsOneWidget);
    expect(find.text('Bread'), findsNothing);

    await tester.tap(find.text('Completed (1)'));
    await tester.pumpAndSettle();

    expect(find.text('Bread'), findsOneWidget);
  });
}
