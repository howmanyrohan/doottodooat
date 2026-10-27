import 'package:flutter_test/flutter_test.dart';

import 'package:doottodooat/main.dart';

void main() {
  testWidgets('shows Hello', (tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('Hello'), findsOneWidget);
  });
}
