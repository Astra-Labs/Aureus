import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:aureus/aureus.dart'; // Import your library

void main() {
  /*
  testWidgets(
      'InteractiveSemanticsWrapper should trigger onInteract when tapped',
      (WidgetTester tester) async {
    bool interacted = false;

    await tester.pumpWidget(
      MaterialApp(
        home: InteractiveSemanticsWrapper(
          properties: const SemanticsProperties(
            label: 'Test Semantics',
          ),
          onInteract: () {
            interacted = true;
          },
          child: Container(),
        ),
      ),
    );

    await tester.tap(find.byType(InteractiveSemanticsWrapper));
    await tester.pump();

    expect(interacted, true);
  });

  testWidgets(
      'InteractiveSemanticsWrapper should change border color when focused',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: InteractiveSemanticsWrapper(
          properties: const SemanticsProperties(
            label: 'Test Semantics',
          ),
          child: Container(),
        ),
      ),
    );

    // Initially, the border color should be transparent
    Container borderContainer =
        find.byType(Container).evaluate().first.widget as Container;
    BoxDecoration borderDecoration =
        borderContainer.decoration as BoxDecoration;
    expect(borderDecoration.border!.top.color, Colors.transparent);

    // Simulate a focus event
    await tester
        .tap(find.byType(Focus)); // Tap on the Focus widget to simulate focus

    // After focus, the border color should be the accent color
    await tester.pump();
    borderContainer =
        find.byType(Container).evaluate().first.widget as Container;
    borderDecoration = borderContainer.decoration as BoxDecoration;
    expect(borderDecoration.border!.top.color, coloration.accentColor());
  });*/
}
