import 'package:aureus/aureus.dart';

/*

Description: 
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
    //creates variable that contains MediaQuery information that will be used to return proper sizing
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
A class that takes variables into consideration to properly color the text of different items to match contrsst standards
*/

// 🛑
class Coloration {
  //the color returned for all general text in Aureus.

  Image resourceLogo() {
    if (brightness() == Brightness.light) {
      return apiVariables.darkLogo!;
    } else if (brightness() == Brightness.dark) {
      return apiVariables.lightLogo!;
    }

    throw ('Brightness is having issues');
  }

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

  Color accentColor() {
    if (brightness() == Brightness.light) {
      return lavender();
    } else if (brightness() == Brightness.dark) {
      return frost();
    }

    //throws an error because there are only two mode options, so if the function falls through, something has gone wrong.
    return steel();
  }

  Color contrastColor() {
    if (brightness() == Brightness.light) {
      return black();
    } else if (brightness() == Brightness.dark) {
      return white();
    }

    //throws an error because there are only two mode options, so if the function falls through, something has gone wrong.
    return steel();
  }

  //sometimes, items will have a high contrast background and need to be the same color as the mode. in that case, use this text color.
  Color sameColor() {
    if (brightness() == Brightness.light) {
      return white();
    } else if (brightness() == Brightness.dark) {
      return black();
    }

    return steel();
  }

  //sometimes, items will have a high contrast background and need to be the same color as the mode. in that case, use this text color.
  Color inactiveColor() {
    if (brightness() == Brightness.light) {
      return iron().withOpacity(0.2);
    } else if (brightness() == Brightness.dark) {
      return melt().withOpacity(0.3);
    }

    return steel();
  }

  decorationPriority itemPriority(bool isActive) {
    if (isActive == true) {
      return decorationPriority.important;
    } else if (isActive == false) {
      return decorationPriority.standard;
    }
    return decorationPriority.inactive;
  }
}
