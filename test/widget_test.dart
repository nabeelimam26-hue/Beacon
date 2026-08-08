import 'package:flutter_test/flutter_test.dart';

import 'package:beacon/main.dart';

void main() {
  testWidgets('Beacon boots to splash then auth shell', (WidgetTester tester) async {
    await tester.pumpWidget(const BeaconApp());

    expect(find.text('Beacon'), findsOneWidget);
    expect(find.text('A calmer place for study conversations.'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 750));
    await tester.pumpAndSettle();

    expect(find.text('Welcome to Beacon'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
  });
}
