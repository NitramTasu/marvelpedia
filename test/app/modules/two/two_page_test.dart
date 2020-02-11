import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:marvelpedia/app/modules/two/two_page.dart';

main() {
  testWidgets('TwoPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(TwoPage(title: 'Two')));
    final titleFinder = find.text('Two');
    expect(titleFinder, findsOneWidget);
  });
}
