import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// {@category Foundation}

/* ------------------ ASSET PALETTE -------------------- */

/// This is where all of the gradients, text styles, colors, and other related items
/// are located in Aureus. Since they are global items, you can call them without
/// accessing them through any specific class.

class AureusPalette {
  /// Returns the given 'mode' (light or dark) for the device that Aureus is running on.
  Brightness brightness() {
    return SchedulerBinding.instance!.window.platformBrightness;
  }

// Gradients ---------------------------------

  Gradient lightGradient() {
    return resourceValues.darkMode.contrastGradient;
  }

  Gradient darkGradient() {
    return resourceValues.lightMode.contrastGradient;
  }

// Colors ---------------------------------

  Color white() {
    return const Color.fromRGBO(255, 255, 255, 1.0);
  }

  Color black() {
    return const Color.fromRGBO(0, 0, 0, 1.0);
  }

  Color lavender() {
    return const Color.fromRGBO(181, 190, 242, 1.0);
  }

  Color ice() {
    return const Color.fromRGBO(241, 243, 251, 1.0);
  }

  Color melt() {
    return const Color.fromRGBO(234, 237, 250, 1.0);
  }

  Color frost() {
    return const Color.fromRGBO(214, 215, 222, 1.0);
  }

  Color steel() {
    return const Color.fromRGBO(184, 192, 214, 1.0);
  }

  Color iron() {
    return const Color.fromRGBO(110, 115, 128, 1.0);
  }

  Color carbon() {
    return const Color.fromRGBO(77, 79, 90, 1.0);
  }

  Color onyx() {
    return const Color.fromRGBO(56, 56, 56, 1.0);
  }

  Color lightModeFill() {
    return accessibility.accessFeatures.highContrast == true
        ? black().withOpacity(0.35)
        : black().withOpacity(0.07);
  }

  Color darkModeFill() {
    return accessibility.accessFeatures.highContrast == true
        ? white().withOpacity(0.35)
        : white().withOpacity(0.15);
  }

// Shadows ---------------------------------

  BoxShadow lightShadow() {
    return BoxShadow(
        color: steel().withOpacity(0.4),
        offset: const Offset(0.0, 3.0),
        blurRadius: 30.0);
  }

  BoxShadow darkShadow() {
    return BoxShadow(
        color: carbon().withOpacity(0.2),
        offset: const Offset(0.0, 3.0),
        blurRadius: 30.0);
  }

  BoxShadow pastelShadow() {
    return BoxShadow(
        color: coloration.accentColor().withOpacity(0.3),
        offset: const Offset(0.0, 3.0),
        blurRadius: 30.0);
  }

// Borders ---------------------------------

  Border universalBorder() {
    return accessibility.accessFeatures.highContrast == true
        ? Border.all(color: steel(), width: 2)
        : Border.all(color: steel().withOpacity(0.6), width: 1);
  }

  Border pastelBorder() {
    return accessibility.accessFeatures.highContrast
        ? Border.all(color: coloration.accentColor(), width: 2)
        : Border.all(
            color: coloration.accentColor().withOpacity(0.25), width: 1);
  }

  Border lightModeBorder() {
    return accessibility.accessFeatures.highContrast == true
        ? Border.all(color: onyx(), width: 2)
        : Border.all(color: black().withOpacity(0.25), width: 1);
  }

  Border darkModeBorder() {
    return accessibility.accessFeatures.highContrast == true
        ? Border.all(color: melt(), width: 2)
        : Border.all(color: white().withOpacity(0.25), width: 1);
  }
}

var palette = AureusPalette();
