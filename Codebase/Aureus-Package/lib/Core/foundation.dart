import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

//All Variables for the UDS Elements
//Doc Link:

//Global Foundational Enums go here since Dart doesn't support nested types
enum modeVariants { light, dark }
enum buttonVariants { inactive, lightActive, darkActive }
enum messagingVariants { sender, receiver }
enum communicationStatus { sending, delivered, failed }
enum CardType { standard, badge }
enum userInputType { singleDataType, multiDataType }
enum sizingWeight { w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10 }

enum decorationPriority { standard, important, inactive }
enum buttonDecorationVariants {
  roundedPill,
  roundedRectangle,
  edgedRectangle,
  circle
}
enum layerDecorationVariants { rounded, edged }
enum cardDecorationVariants { pilledRectangle, roundedRectangle }
enum tabItemDecorationVariants { circle, roundedRectangle }

class UDSVariables {
  final Color prodColor;
  final String prodName;
  final Gradient lightGrad;
  final Gradient mediumGrad;
  final Gradient darkGrad;

  const UDSVariables(
      {this.prodColor = const Color.fromRGBO(181, 190, 242, 1.0),
      this.prodName = 'Aureus',
      this.lightGrad = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Color.fromRGBO(227, 231, 248, 1.0),
          ]),
      this.mediumGrad = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(212, 219, 244, 1.0),
            Color.fromRGBO(184, 195, 236, 1.0),
          ]),
      this.darkGrad = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromRGBO(241, 243, 251, 1.0),
            const Color.fromRGBO(219, 225, 246, 1.0),
          ])});

//Global Gradients

  Gradient lightGradient() {
    return lightGrad;
  }

  Gradient mediumGradient() {
    return mediumGrad;
  }

  Gradient darkGradient() {
    return darkGrad;
  }

//Global Colors

  Color productColor() {
    return prodColor;
  }

  Color white() {
    return Color.fromRGBO(255, 255, 255, 1.0);
  }

  Color black() {
    return Color.fromRGBO(0, 0, 0, 1.0);
  }

  Color ice() {
    return Color.fromRGBO(241, 243, 251, 1.0);
  }

  Color melt() {
    return Color.fromRGBO(234, 237, 250, 1.0);
  }

  Color frost() {
    return Color.fromRGBO(214, 215, 222, 1.0);
  }

  Color steel() {
    return Color.fromRGBO(184, 192, 214, 1.0);
  }

  Color iron() {
    return Color.fromRGBO(110, 115, 128, 1.0);
  }

  Color carbon() {
    return Color.fromRGBO(77, 79, 90, 1.0);
  }

  Shadow lightHaze() {
    return Shadow(
        color: steel().withOpacity(0.4),
        offset: Offset(0.0, 3.0),
        blurRadius: 30.0);
  }

  Shadow darkHaze() {
    return Shadow(color: carbon(), offset: Offset(0.0, 3.0), blurRadius: 30.0);
  }

  Shadow pastelHaze() {
    return Shadow(
        color: prodColor.withOpacity(0.4),
        offset: Offset(0.0, 3.0),
        blurRadius: 30.0);
  }

  Border universalBorder() {
    return Border.all(color: steel(), width: 1);
  }

  Border pastelBorder() {
    return Border.all(color: prodColor.withOpacity(0.4), width: 1);
  }

// Global Text Styles
  TextStyle heading1() {
    return GoogleFonts.exo(
        fontSize: 26, fontWeight: FontWeight.w300, letterSpacing: 0.2);
  }

  TextStyle heading2() {
    return GoogleFonts.exo(
      fontSize: 21,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.0,
    );
  }

  TextStyle heading3() {
    return GoogleFonts.exo(
        fontSize: 17, fontWeight: FontWeight.w500, letterSpacing: 1.0);
  }

  TextStyle heading4() {
    return GoogleFonts.exo(
        fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 1.0);
  }

  TextStyle subheading() {
    return GoogleFonts.exo(
        fontSize: 17, fontWeight: FontWeight.w300, letterSpacing: 0.2);
  }

  TextStyle body1() {
    return GoogleFonts.exo(
        fontSize: 14, fontWeight: FontWeight.w300, letterSpacing: 0.2);
  }

  TextStyle body2() {
    return GoogleFonts.exo(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.2);
  }

  TextStyle button1() {
    return GoogleFonts.exo(
        fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 1.0);
  }

  TextStyle button2() {
    return GoogleFonts.exo(
        fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 1.0);
  }

  TextStyle tag1({color: Color}) {
    return GoogleFonts.exo(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5);
  }

  TextStyle tag2({color: Color}) {
    return GoogleFonts.exo(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.0);
  }

  //Global Theme Data

  CupertinoThemeData cupertinoThemeData() {
    return CupertinoThemeData();
  }

  ThemeData productTheme() {
    return ThemeData();
  }

  BoxDecoration buttonDecoration(
      {variant: buttonDecorationVariants,
      mode: modeVariants,
      priority: decorationPriority}) {
    //variables for box decoration
    Border decorationBorder;
    Color decorationFill;
    Gradient decorationGradient;
    double decorationCornerRadius;
    BoxShape decorationShape;

    //defining variants for the specific item
    if (variant == buttonDecorationVariants.circle) {
      decorationShape = BoxShape.circle;
      decorationCornerRadius = 0.0;
    } else if (variant == buttonDecorationVariants.edgedRectangle) {
      decorationShape = BoxShape.rectangle;
      decorationCornerRadius = 0.0;
    } else if (variant == buttonDecorationVariants.roundedPill) {
      decorationShape = BoxShape.rectangle;
      decorationCornerRadius = BorderRadius.circular(30.0) as double;
    } else if (variant == buttonDecorationVariants.roundedRectangle) {
      decorationShape = BoxShape.rectangle;
      decorationCornerRadius = 7.0;
    }

    //defining variants for the specific priority
    if (priority == decorationPriority.inactive) {
      //defining variants for the specific mode
      if (mode == modeVariants.light) {
      } else if (mode == modeVariants.dark) {}
    } else if (priority == decorationPriority.important) {
      //defining variants for the specific mode
      if (mode == modeVariants.light) {
      } else if (mode == modeVariants.dark) {}
    } else if (priority == decorationPriority.standard) {
      //defining variants for the specific mode
      if (mode == modeVariants.light) {
      } else if (mode == modeVariants.dark) {}
    }

    return BoxDecoration();
  }

  BoxDecoration layerDecoration(
      {variant: layerDecorationVariants,
      mode: modeVariants,
      priority: decorationPriority}) {
    //variables for box decoration

    Color decorationFill;
    double decorationCornerRadius;
    BoxShape decorationShape = BoxShape.rectangle;
    Shadow decorationShadow;

    //defining variants for the specific item
    if (variant == layerDecorationVariants.edged) {
      decorationCornerRadius = 0.0;
    } else if (variant == layerDecorationVariants.rounded) {
      decorationCornerRadius = 5.0;
    }

    //defining variants for the specific priority
    if (priority == decorationPriority.inactive) {
      //defining variants for the specific mode
      if (mode == modeVariants.light) {

        
      } else if (mode == modeVariants.dark) {

      }
    } else if (priority == decorationPriority.important) {
      //defining variants for the specific mode
      if (mode == modeVariants.light) {
      } else if (mode == modeVariants.dark) {}
    } else if (priority == decorationPriority.standard) {
      //defining variants for the specific mode
      if (mode == modeVariants.light) {
      } else if (mode == modeVariants.dark) {}
    }

    return BoxDecoration();
  }

  BoxDecoration cardDecoration(
      {variant: cardDecorationVariants, mode: modeVariants}) {
    //variables for box decoration
    Border decorationBorder;
    Color decorationFill;
    Gradient decorationGradient;
    double decorationCornerRadius;
    BoxShape decorationShape = BoxShape.rectangle;

    //defining variants for the specific item
    if (variant == cardDecorationVariants.pilledRectangle) {
      decorationCornerRadius = 20.0;
    } else if (variant == cardDecorationVariants.roundedRectangle) {
      decorationCornerRadius = 5.0;
    }

    //defining variants for the specific mode
    if (mode == modeVariants.light) {
      decorationBorder = universalBorder();
    } else if (mode == modeVariants.dark) {}

    return BoxDecoration();
  }

  BoxDecoration inputDecoration({mode: modeVariants}) {
    //variables for box decoration
    Border decorationBorder;
    Color decorationFill;
    double decorationCornerRadius;
    BoxShape decorationShape = BoxShape.rectangle;

    //defining variants for the specific mode
    if (mode == modeVariants.light) {
      decorationFill = melt();
      decorationBorder = universalBorder();
    } else if (mode == modeVariants.dark) {
      decorationFill = carbon();
      decorationBorder = universalBorder();
    }

    decorationCornerRadius = 7.0;
    decorationShape = BoxShape.rectangle;

    return BoxDecoration();
  }

  BoxDecoration tabItemDecoration(
      {variant: tabItemDecorationVariants,
      mode: modeVariants,
      priority: decorationPriority}) {
    //variables for box decoration
    Border decorationBorder;
    Color decorationFill;
    double decorationCornerRadius;
    Gradient decorationGradient;
    BoxShape decorationShape;
    Shadow decorationShadow;

    //defining variants for the specific item
    if (variant == tabItemDecorationVariants.circle) {
      decorationShape = BoxShape.circle;
    } else if (variant == tabItemDecorationVariants.roundedRectangle) {
      decorationShape = BoxShape.rectangle;
      decorationCornerRadius = BorderRadius.circular(30.0) as double;
    }

    //defining variants for the specific priority
    if (priority == decorationPriority.inactive) {
      //defining variants for the specific mode
      decorationFill = steel();
    } else if (priority == decorationPriority.important) {
      //defining variants for the specific mode

      decorationGradient = mediumGradient();
      decorationBorder = pastelBorder();

      if (mode == modeVariants.light) {
        decorationShadow = pastelHaze();
      } else if (mode == modeVariants.dark) {
        decorationShadow = darkHaze();
      }
    }

    return BoxDecoration();
  }
}

class TitleCase {
  static String convertToTitleCase(String text) {
    if (text.length <= 1) {
      return text.toUpperCase();
    }

    final List<String> words = text.split(' ');
    final capitalizedWords = words.map((word) {
      if (word.trim().isNotEmpty) {
        final String firstLetter = word.trim().substring(0, 1).toUpperCase();
        final String remainingLetters = word.trim().substring(1);

        return '$firstLetter$remainingLetters';
      }

      return '';
    });

    return capitalizedWords.join('');
  }
}

//
class Sizing {
  double heightOf({context: MediaQueryData, weight: sizingWeight}) {
    double screenWeightedHeight = 0.0;

    switch (weight) {

      //MINIMUM WIDTH OF ITEM - 5%
      case sizingWeight.w0:
        screenWeightedHeight = (context.size.height) * 0.05;
        break;

      //10% of screen height
      case sizingWeight.w1:
        screenWeightedHeight = (context.size.height) * 0.1;
        break;

      //20% of screen height
      case sizingWeight.w2:
        screenWeightedHeight = (context.size.height) * 0.2;
        break;

      //30% of screen height
      case sizingWeight.w3:
        screenWeightedHeight = (context.size.height) * 0.3;
        break;

      //40% of screen height
      case sizingWeight.w4:
        screenWeightedHeight = (context.size.height) * 0.4;
        break;

      //50% of screen height
      case sizingWeight.w5:
        screenWeightedHeight = (context.size.height) * 0.5;
        break;

      //60% of screen height
      case sizingWeight.w6:
        screenWeightedHeight = (context.size.height) * 0.6;
        break;

      //70% of screen height
      case sizingWeight.w7:
        screenWeightedHeight = (context.size.height) * 0.7;
        break;

      //80% of screen height
      case sizingWeight.w8:
        screenWeightedHeight = (context.size.height) * 0.8;
        break;

      //90% of screen height
      case sizingWeight.w9:
        screenWeightedHeight = (context.size.height) * 0.9;
        break;

      //100% of screen height
      case sizingWeight.w10:
        screenWeightedHeight = (context.size.height);
        break;
    }

    return screenWeightedHeight;
  }

  double widthOf({context: MediaQueryData, weight: sizingWeight}) {
    double screenWeightedWidth = 0.0;

    switch (weight) {

      //MINIMUM WIDTH OF ITEM - 5%
      case sizingWeight.w0:
        screenWeightedWidth = (context.size.width) * 0.05;
        break;

      //10% of width
      case sizingWeight.w1:
        screenWeightedWidth = (context.size.width) * 0.1;
        break;

      //20% of width
      case sizingWeight.w2:
        screenWeightedWidth = (context.size.width) * 0.2;
        break;

      //30% of width
      case sizingWeight.w3:
        screenWeightedWidth = (context.size.width) * 0.3;
        break;

      //40% of width
      case sizingWeight.w4:
        screenWeightedWidth = (context.size.width) * 0.4;
        break;

      //50% of width
      case sizingWeight.w5:
        screenWeightedWidth = (context.size.width) * 0.5;
        break;

      //60% of width
      case sizingWeight.w6:
        screenWeightedWidth = (context.size.width) * 0.6;
        break;

      //70% of width
      case sizingWeight.w7:
        screenWeightedWidth = (context.size.width) * 0.7;
        break;

      //80% of width
      case sizingWeight.w8:
        screenWeightedWidth = (context.size.width) * 0.8;
        break;

      //90% of width
      case sizingWeight.w9:
        screenWeightedWidth = (context.size.width) * 0.9;
        break;

      //100% of width
      case sizingWeight.w10:
        screenWeightedWidth = (context.size.width);
        break;
    }

    return screenWeightedWidth;
  }
}

//Info Hiearchy - A set of texts / label styles that acts as the typographic foundation for the rest of the UDS
final titleCase = TitleCase();

class HeadingOneText extends Text {
  HeadingOneText(String data, Color color)
      : super(TitleCase.convertToTitleCase(data),
            style: foundation.heading1().copyWith(color: color));
}

class HeadingTwoText extends Text {
  HeadingTwoText(String data, Color color)
      : super(data.toUpperCase(),
            style: foundation.heading2().copyWith(color: color));
}

class HeadingThreeText extends Text {
  HeadingThreeText(String data, Color color)
      : super(data.toUpperCase(),
            style: foundation.heading3().copyWith(color: color));
}

class HeadingFourText extends Text {
  HeadingFourText(String data, Color color)
      : super(data.toUpperCase(),
            style: foundation.heading4().copyWith(color: color));
}

class SubheaderText extends Text {
  SubheaderText(String data, Color color)
      : super(TitleCase.convertToTitleCase(data),
            style: foundation.subheading().copyWith(color: color));
}

class BodyOneText extends Text {
  BodyOneText(String data, Color color)
      : super(data, style: foundation.body1().copyWith(color: color));
}

class BodyTwoText extends Text {
  BodyTwoText(String data, Color color)
      : super(data, style: foundation.body2().copyWith(color: color));
}

class ButtonOneText extends Text {
  ButtonOneText(String data, Color color)
      : super(data.toUpperCase(),
            style: foundation.button1().copyWith(color: color));
}

class ButtonTwoText extends Text {
  ButtonTwoText(String data, Color color)
      : super(data.toUpperCase(),
            style: foundation.button2().copyWith(color: color));
}

class TagOneText extends Text {
  TagOneText(String data, Color color)
      : super(data.toUpperCase(), style: foundation.tag1(color: color));
}

class TagTwoText extends Text {
  TagTwoText(String data, Color color)
      : super(data.toUpperCase(), style: foundation.tag2(color: color));
}
