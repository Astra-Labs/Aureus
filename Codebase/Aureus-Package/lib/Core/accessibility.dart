import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
/*

Description: 
A class that contains variables, methods, and other items to ensure full accessibility compliance. 

*/

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
        maxLines: 1,
        textScaleFactor: query.textScaleFactor,
        textDirection: textDirection)
      ..layout(maxWidth: widthLimit);

    return textPainter.size;
  }
}
