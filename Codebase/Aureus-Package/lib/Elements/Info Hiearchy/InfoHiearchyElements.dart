import 'package:flutter/cupertino.dart';
import 'package:aureus/foundation.dart';

//A set of texts / label styles that acts as the typographic foundation for the rest of the UDS
//Doc Link:

final foundation = UDSVariables();

class HeadingOneText extends Text {
  HeadingOneText(String data) : super(data, style: foundation.heading1());
}

class HeadingTwoText extends Text {
  HeadingTwoText(String data) : super(data, style: foundation.heading2());
}

class HeadingThreeText extends Text {
  HeadingThreeText(String data) : super(data, style: foundation.heading3());
}

class HeadingFourText extends Text {
  HeadingFourText(String data) : super(data, style: foundation.heading4());
}

class BodyOneText extends Text {
  BodyOneText(String data) : super(data, style: foundation.body1());
}

class BodyTwoText extends Text {
  BodyTwoText(String data) : super(data, style: foundation.body2());
}

class SubheaderText extends Text {
  SubheaderText(String data) : super(data, style: foundation.subheading());
}
