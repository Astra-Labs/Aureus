import 'dart:ui';

import 'package:aureus/aureus.dart';
import 'package:flutter/semantics.dart';

/*

A class that contains variables, methods, and other items to ensure full 
accessibility compliance. 

*/

class Accessibility {
  // returns the proper sizing of a string for a given text style with
  // regards to the scale factor to accomodate dynamic text sizing.

  final AccessibilityFeatures accessFeatures =
      WidgetsBinding.instance!.window.accessibilityFeatures;

  Semantics aureusSemanticsObject() {
    SemanticsProperties properties = SemanticsProperties();

    return Semantics.fromProperties(properties: properties);
  }

  static Size textStringSize(
      {required String textInput,
      required TextStyle textStyle,
      required TextDirection textDirection,
      required MediaQueryData query}) {
    //creates variable that contains MediaQuery information to return proper sizing

    var screenSize = size.logicalScreenSize();

    TextPainter textPainter = TextPainter(
        text: TextSpan(text: textInput, style: textStyle),
        textScaleFactor: query.textScaleFactor,
        textDirection: textDirection)
      ..layout(
          maxWidth: size.layoutItemWidth(1, screenSize),
          minWidth: size.widthOf(weight: sizingWeight.w1));

    return textPainter.size;
  }

  //Creates a text scale factor to adjust for size differences between
  //mobile, tablet, and web.
  double responsiveTextSize(double base) {
    var screenSize = size.logicalScreenSize();

    double scaleFactor = 0.0;
    double shortSide = screenSize.shortestSide;

    if (shortSide < 550) {
      //needs mobile phone scale
      scaleFactor = 1.1;
    } else if (shortSide >= 550 && shortSide < 900) {
      //needs tablet scale
      scaleFactor = 1.18;
    } else if (shortSide >= 900) {
      //needs web phone scale
      scaleFactor = 1.35;
    }

    return scaleFactor * base;
  }
}

/*

Description: 
A class that takes variables into consideration to properly color the text of different items to match contrast standards
*/

// 🛑
class Coloration {
  //Returns logo for the proper mode.
  Image resourceLogo() {
    if (brightness() == Brightness.light) {
      return resourceValues.lightMode.logo!;
    } else if (brightness() == Brightness.dark) {
      return resourceValues.darkMode.logo!;
    }

    //throws an error because there are only two mode options, so if the function falls through, something has gone wrong.
    throw ("Brightness is returning a mode that doesn't exist");
  }

  //Returns primary image for the proper mode.
  Image primaryImage() {
    if (brightness() == Brightness.light) {
      return resourceValues.lightMode.primaryImage!;
    } else if (brightness() == Brightness.dark) {
      return resourceValues.darkMode.primaryImage!;
    }

    //throws an error because there are only two mode options, so if the function falls through, something has gone wrong.
    throw ("Brightness is returning a mode that doesn't exist");
  }

  //Returns secondary image for the proper mode.
  Image secondaryImage() {
    if (brightness() == Brightness.light) {
      return resourceValues.lightMode.secondaryImage!;
    } else if (brightness() == Brightness.dark) {
      return resourceValues.darkMode.secondaryImage!;
    }

    //throws an error because there are only two mode options, so if the function falls through, something has gone wrong.
    throw ("Brightness is returning a mode that doesn't exist");
  }

  //Coloration for dynamically changing items that use all of the priority variants.
  Color decorationColor({required decorationPriority decorationVariant}) {
    switch (decorationVariant) {
      case decorationPriority.important:
        return sameColor();

      case decorationPriority.inactive:
        return contrastColor().withOpacity(0.6);

      case decorationPriority.standard:
        return contrastColor();
    }
  }

  //Accent color for the given mode.
  Color accentColor() {
    if (brightness() == Brightness.light) {
      return resourceValues.lightMode.accentColor;
    } else if (brightness() == Brightness.dark) {
      return resourceValues.darkMode.accentColor;
    }

    //throws an error because there are only two mode options, so if the function falls through, something has gone wrong.
    throw ("Brightness is returning a mode that doesn't exist");
  }

  //Returns alternate color to the mode.
  Color contrastColor() {
    if (brightness() == Brightness.light) {
      return black();
    } else if (brightness() == Brightness.dark) {
      return white();
    }

    //throws an error because there are only two mode options, so if the function falls through, something has gone wrong.
    throw ("Brightness is returning a mode that doesn't exist");
  }

  //Returns same color as the mode.
  Color sameColor() {
    if (brightness() == Brightness.light) {
      return white();
    } else if (brightness() == Brightness.dark) {
      return black();
    }

    throw ("Brightness is returning a mode that doesn't exist");
  }

  //Returns inactive color for the mode.
  Color inactiveColor() {
    if (brightness() == Brightness.light) {
      return iron().withOpacity(0.2);
    } else if (brightness() == Brightness.dark) {
      return melt().withOpacity(0.3);
    }

    throw ("Brightness is returning a mode that doesn't exist");
  }

  //returns a decoration priority dynamically based on if the item is active or not.
  decorationPriority itemPriority(bool isActive) {
    if (isActive == true) {
      return decorationPriority.important;
    } else if (isActive == false) {
      return decorationPriority.standard;
    }
    return decorationPriority.inactive;
  }
}
