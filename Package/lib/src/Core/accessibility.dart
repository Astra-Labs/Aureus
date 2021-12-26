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
      {required double widthLimit,
      required String textInput,
      required TextStyle textStyle,
      required TextDirection textDirection,
      required MediaQueryData query}) {
    //creates variable that contains MediaQuery information that will be used to return proper sizing
    TextPainter textPainter = TextPainter(
        text: TextSpan(text: textInput, style: textStyle),
        textScaleFactor: query.textScaleFactor,
        textDirection: textDirection)
      ..layout(maxWidth: widthLimit);

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

  Color decorationColor({required decorationPriority decorationVariant}) {
    switch (decorationVariant) {
      case decorationPriority.important:
        return sameColor();

      case decorationPriority.inactive:
        return contrastColor().withOpacity(0.5);

      case decorationPriority.standard:
        return contrastColor();
    }
  }

  Color contrastColor() {
    if (foundation.brightness == Brightness.light) {
      return foundation.black();
    } else if (foundation.brightness == Brightness.dark) {
      return foundation.white();
    }

    //throws an error because there are only two mode options, so if the function falls through, something has gone wrong.
    return foundation.steel();
  }

  //sometimes, items will have a high contrast background and need to be the same color as the mode. in that case, use this text color.
  Color sameColor() {
    if (foundation.brightness == Brightness.light) {
      return foundation.white();
    } else if (foundation.brightness == Brightness.dark) {
      return foundation.black();
    }

    return foundation.steel();
  }

  //sometimes, items will have a high contrast background and need to be the same color as the mode. in that case, use this text color.
  Color inactiveColor() {
    if (foundation.brightness == Brightness.light) {
      return foundation.frost();
    } else if (foundation.brightness == Brightness.dark) {
      return foundation.carbon().withOpacity(0.5);
    }

    return foundation.steel();
  }
}
