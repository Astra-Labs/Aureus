import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Foundation}

/// A class that takes variables into consideration to properly color the text of
/// different items to match contrast standards

class Coloration {
  /// Returns logo for the proper mode.
  Image resourceLogo() {
    return palette.brightness() == Brightness.light
        ? resourceValues.lightMode.logo!
        : resourceValues.darkMode.logo!;
  }

  /// Returns primary image for the proper mode.
  Image primaryImage() {
    return palette.brightness() == Brightness.light
        ? resourceValues.lightMode.primaryImage!
        : resourceValues.darkMode.primaryImage!;
  }

  /// Returns secondary image for the proper mode.
  Image secondaryImage() {
    return palette.brightness() == Brightness.light
        ? resourceValues.lightMode.secondaryImage!
        : resourceValues.darkMode.secondaryImage!;
  }

  /// Coloration for dynamically changing items that use all of the priority variants.
  Color decorationColor({required decorationPriority decorationVariant}) {
    switch (decorationVariant) {
      case decorationPriority.important:
        return sameColor();

      case decorationPriority.inactive:
        return contrastColor().withOpacity(0.6);

      case decorationPriority.standard:
        return contrastColor();

      case decorationPriority.inverted:
        return sameColor();

      case decorationPriority.active:
        return contrastColor().withOpacity(0.8);
    }
  }

  /// Accent color for the given mode.
  Color accentColor() {
    return palette.brightness() == Brightness.light
        ? resourceValues.lightMode.accentColor
        : resourceValues.darkMode.accentColor;
  }

  /// Returns alternate color to the mode.
  Color contrastColor() {
    return palette.brightness() == Brightness.light
        ? palette.black()
        : palette.white();
  }

  /// Returns same color as the mode.
  Color sameColor() {
    return palette.brightness() == Brightness.light
        ? palette.white()
        : palette.black();
  }

  /// Returns inactive color for the mode.
  Color inactiveColor() {
    return palette.brightness() == Brightness.light
        ? palette.iron().withOpacity(0.2)
        : palette.melt().withOpacity(0.3);
  }
}
