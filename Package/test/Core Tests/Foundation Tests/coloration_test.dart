import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:aureus/aureus.dart'; // Import your library

void main() {
  setUp(() => {
        TestWidgetsFlutterBinding.ensureInitialized(),
      });

  test(
      'Coloration should return the correct decoration color for different priority variants',
      () {
    final coloration = Coloration();

    final importantColor = coloration.decorationColor(
        decorationVariant: decorationPriority.important);
    final inactiveColor = coloration.decorationColor(
        decorationVariant: decorationPriority.inactive);
    final standardColor = coloration.decorationColor(
        decorationVariant: decorationPriority.standard);
    final invertedColor = coloration.decorationColor(
        decorationVariant: decorationPriority.inverted);
    final activeColor = coloration.decorationColor(
        decorationVariant: decorationPriority.active);

    expect(importantColor, equals(coloration.sameColor()));
    expect(inactiveColor, equals(coloration.contrastColor().withOpacity(0.6)));
    expect(standardColor, equals(coloration.contrastColor()));
    expect(invertedColor, equals(coloration.sameColor()));
    expect(activeColor, equals(coloration.contrastColor().withOpacity(0.8)));
  });

  test('Coloration should return the correct contrast color', () {
    final coloration = Coloration();
    final contrastColor = coloration.contrastColor();

    // Determine whether the current palette brightness is light or dark and check the corresponding contrast color
    expect(
        contrastColor,
        equals(palette.brightness() == Brightness.light
            ? palette.black()
            : palette.white()));
  });

  test('Coloration should return the correct same color', () {
    final coloration = Coloration();
    final sameColor = coloration.sameColor();

    // Determine whether the current palette brightness is light or dark and check the corresponding same color
    expect(
        sameColor,
        equals(palette.brightness() == Brightness.light
            ? palette.white()
            : palette.black()));
  });

  test('Coloration should return the correct inactive color', () {
    final coloration = Coloration();
    final inactiveColor = coloration.inactiveColor();

    // Determine whether the current palette brightness is light or dark and check the corresponding inactive color
    expect(
        inactiveColor,
        equals(palette.brightness() == Brightness.light
            ? palette.iron().withOpacity(0.10)
            : palette.lavender().withOpacity(0.50)));
  });
}
