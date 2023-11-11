import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:aureus/aureus.dart'; // Import your library

void main() {
  test(
      'BaseBackingDecoration should build a BoxDecoration based on decorationVariant',
      () {
    final baseDecoration =
        BaseBackingDecoration(decorationVariant: decorationPriority.standard);

    final boxDecoration = baseDecoration.buildBacking();

    expect(
        boxDecoration.color,
        equals(palette.brightness() == Brightness.light
            ? palette.lightModeFill()
            : palette.darkModeFill()));
    expect(boxDecoration.border, isNull);
    expect(boxDecoration.shape, equals(BoxShape.rectangle));
    expect(boxDecoration.boxShadow, isEmpty);
    expect(boxDecoration.borderRadius, isNull);
  });

  test(
      'ButtonBackingDecoration should build a BoxDecoration based on variant and decorationVariant',
      () {
    final buttonDecoration = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedPill,
        decorationVariant: decorationPriority.active);

    final boxDecoration = buttonDecoration.buildBacking();

    expect(boxDecoration.color,
        equals(coloration.contrastColor().withOpacity(0.4)));
    expect(
        boxDecoration.border,
        equals(Border.all(
            color: coloration.contrastColor().withOpacity(0.8), width: 1)));
    expect(boxDecoration.shape, equals(BoxShape.rectangle));
    expect(boxDecoration.boxShadow, isEmpty);
    expect(boxDecoration.borderRadius, equals(BorderRadius.circular(30)));
  });

  test(
      'LayerBackingDecoration should build a BoxDecoration based on decorationVariant',
      () {
    final layerDecoration =
        LayerBackingDecoration(decorationVariant: decorationPriority.important);

    final boxDecoration = layerDecoration.buildBacking();

    expect(
        boxDecoration.color,
        equals(palette.brightness() == Brightness.light
            ? palette.lightModeFill()
            : palette.darkModeFill()));
    expect(boxDecoration.border, equals(palette.universalBorder()));
    expect(boxDecoration.shape, equals(BoxShape.rectangle));
    expect(boxDecoration.boxShadow, equals([palette.darkShadow()]));
    expect(boxDecoration.borderRadius, equals(BorderRadius.circular(10.0)));
  });

  test(
      'CardBackingDecoration should build a BoxDecoration based on decorationVariant',
      () {
    final cardDecoration =
        CardBackingDecoration(decorationVariant: decorationPriority.standard);

    final boxDecoration = cardDecoration.buildBacking();

    expect(
        boxDecoration.color,
        equals(palette.brightness() == Brightness.light
            ? palette.lightModeFill()
            : palette.darkModeFill()));
    expect(
        boxDecoration.border,
        equals(palette.brightness() == Brightness.light
            ? palette.lightModeBorder()
            : palette.darkModeBorder()));
    expect(boxDecoration.shape, equals(BoxShape.rectangle));
    expect(boxDecoration.boxShadow, isEmpty);
    expect(boxDecoration.borderRadius, equals(BorderRadius.circular(20.0)));
  });

  test(
      'InputBackingDecoration should build a BoxDecoration based on decorationVariant',
      () {
    final inputDecoration = InputBackingDecoration();

    final boxDecoration = inputDecoration.buildBacking();

    expect(
        boxDecoration.color,
        equals(palette.brightness() == Brightness.light
            ? palette.lightModeFill()
            : palette.darkModeFill()));
    expect(
        boxDecoration.border,
        equals(palette.brightness() == Brightness.light
            ? palette.lightModeBorder()
            : palette.darkModeBorder()));
    expect(boxDecoration.shape, equals(BoxShape.rectangle));
    expect(boxDecoration.boxShadow, isEmpty);
    expect(boxDecoration.borderRadius, equals(BorderRadius.circular(7.0)));
  });

  test(
      'TabItemBackingDecoration should build a BoxDecoration based on variant and decorationVariant',
      () {
    final tabDecoration = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.roundedRectangle,
        decorationVariant: decorationPriority.standard);

    final boxDecoration = tabDecoration.buildBacking();

    expect(
        boxDecoration.color,
        equals(palette.brightness() == Brightness.light
            ? palette.lightModeFill()
            : palette.darkModeFill()));
    expect(boxDecoration.border, isNull);
    expect(boxDecoration.shape, equals(BoxShape.rectangle));
    expect(boxDecoration.boxShadow, isEmpty);
    expect(boxDecoration.borderRadius, equals(BorderRadius.circular(30.0)));
  });
}
