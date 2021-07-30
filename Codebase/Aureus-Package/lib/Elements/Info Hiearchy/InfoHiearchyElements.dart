import 'package:flutter/cupertino.dart';
import 'package:aureus/product.dart';
import 'package:aureus/foundation.dart';

//A set of texts / label styles that acts as the typographic foundation for the rest of the UDS
//Doc Link:

UDSVariables udsVariables = new UDSVariables();

class HeadingOneText extends Text {
  HeadingOneText(String data) : super(data);
}

class HeadingTwoText extends Text {
  HeadingTwoText(String data) : super(data, style: udsVariables.heading2());
}

class HeadingThreeText extends Text {
  HeadingThreeText(String data) : super(data, style: udsVariables.heading3());
}

class HeadingFourText extends Text {
  HeadingFourText(String data) : super(data, style: udsVariables.heading4());
}

class BodyOneText extends Text {
  BodyOneText(String data) : super(data, style: udsVariables.body1());
}

class BodyTwoText extends Text {
  BodyTwoText(String data) : super(data, style: udsVariables.body2());
}

class SubheaderText extends Text {
  SubheaderText(String data) : super(data, style: udsVariables.subheading());
}
