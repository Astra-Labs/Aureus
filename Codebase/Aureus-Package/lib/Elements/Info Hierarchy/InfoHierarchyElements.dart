import 'package:flutter/cupertino.dart';
import 'package:aureus/foundation.dart';

//A set of texts / label styles that acts as the typographic foundation for the rest of the UDS
//Doc Link:

final foundation = UDSVariables();

class HeadingOneText extends Text {
  HeadingOneText(String data, Color color)
      : super(data, style: foundation.heading1().copyWith(color: color));
}

class HeadingTwoText extends Text {
  HeadingTwoText(String data, Color color)
      : super(data, style: foundation.heading2().copyWith(color: color));
}

class HeadingThreeText extends Text {
  HeadingThreeText(String data, Color color)
      : super(data, style: foundation.heading3().copyWith(color: color));
}

class HeadingFourText extends Text {
  HeadingFourText(String data, Color color)
      : super(data, style: foundation.heading4().copyWith(color: color));
}

class BodyOneText extends Text {
  BodyOneText(String data, Color color)
      : super(data, style: foundation.body1().copyWith(color: color));
}

class BodyTwoText extends Text {
  BodyTwoText(String data, Color color)
      : super(data, style: foundation.body2().copyWith(color: color));
}

class SubheaderText extends Text {
  SubheaderText(String data, Color color)
      : super(data, style: foundation.subheading().copyWith(color: color));
}
