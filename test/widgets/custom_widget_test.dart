import 'package:cocoon/cocoon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('custom widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Cocoon(
        {
          "type": "my_custom_widget",
        },
        customWidgets: {
          "my_custom_widget": Text("Hello"),
        },
      ),
    ));

    expect(find.text("Hello"), findsOneWidget);
  });
}