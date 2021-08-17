import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aureus/core.dart';
import 'package:google_fonts/google_fonts.dart';

//All Variables for the UDS Elements
//Doc Link:

//Global Foundational Enums go here since Dart doesn't support nested types
enum modeVariants { light, dark }
enum buttonVariants { inactive, lightActive, darkActive }
enum messagingVariants { sender, receiver }
enum communicationStatus { sending, delivered, failed }
enum CardType { standard, badge }

class UDSVariables {
//Global Product Variations

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

    return capitalizedWords.join(' ');
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
