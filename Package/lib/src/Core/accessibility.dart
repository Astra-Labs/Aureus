import 'package:aureus/aureus.dart';

/*

A class that contains variables, methods, and other items to ensure full accessibility compliance. 

*/

var accessibility = Accessibility();

// 🛑
class Accessibility {
  //returns the proper sizing of a string for a given text style with regards to the scale factor to accomodate dynamic text sizing.
  static Size textStringSize(
      {required String textInput,
      required TextStyle textStyle,
      required TextDirection textDirection,
      required MediaQueryData query}) {
    //creates variable that contains MediaQuery information to return proper sizing
    TextPainter textPainter = TextPainter(
        text: TextSpan(text: textInput, style: textStyle),
        textScaleFactor: query.textScaleFactor,
        textDirection: textDirection)
      ..layout(
          maxWidth: size.layoutItemWidth(1, size.logicalScreenSize),
          minWidth: size.widthOf(weight: sizingWeight.w0));

    return textPainter.size;
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
      return apiVariables.darkLogo!;
    } else if (brightness() == Brightness.dark) {
      return apiVariables.lightLogo!;
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
      return Color.fromRGBO(56, 62, 94, 1.0);
    } else if (brightness() == Brightness.dark) {
      return melt();
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
