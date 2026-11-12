import 'package:flutter/material.dart' hide Page;
import 'package:flutter_test/flutter_test.dart';

import 'package:doottodooat/pages/login/interface.dart';
import 'package:doottodooat/pages/login/page.dart';

class FakeData implements Interface {
  @override
  Future<String?> signIn(String email, String password) async =>
      'Invalid login credentials';

  @override
  Future<String?> signUp(String email, String password) async => null;
}

void main() {
  testWidgets('shows sign in error', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Page(data: FakeData())));

    await tester.enterText(find.byType(TextField).first, 'a@b.com');
    await tester.enterText(find.byType(TextField).last, 'wrong');
    await tester.tap(find.text('Sign in'));
    await tester.pump();

    expect(find.text('Invalid login credentials'), findsOneWidget);
  });
}
