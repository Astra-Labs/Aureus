import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// @nodoc
import 'package:google_fonts/google_fonts.dart';

/// {@category Foundation}

/* ------------------ TEXT CLASSES -------------------- */

/// This is where the text styles are, and the text widgets that accompany them.
/// Items here also go through the coloration class to be properly rendered for
/// each mode.

// Global Text Styles ---------------------------------

var fontChoice = resourceValues.font!;

/// The text style for a heading one
TextStyle heading1() {
  return accessibility.accessFeatures.boldText == true
      ? GoogleFonts.getFont(fontChoice,
          fontSize: 26,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.4,
          decoration: TextDecoration.none)
      : GoogleFonts.getFont(fontChoice,
          fontSize: 29,
          fontWeight: FontWeight.w200,
          letterSpacing: 0.4,
          decoration: TextDecoration.none);
}

/// The text style for a heading two
TextStyle heading2() {
  return accessibility.accessFeatures.boldText == true
      ? GoogleFonts.getFont(fontChoice,
          fontSize: 21,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
          decoration: TextDecoration.none)
      : GoogleFonts.getFont(fontChoice,
          fontSize: 24,
          fontWeight: FontWeight.w300,
          letterSpacing: 1.2,
          decoration: TextDecoration.none);
}

/// The text style for a heading three
TextStyle heading3() {
  return accessibility.accessFeatures.boldText == true
      ? GoogleFonts.getFont(fontChoice,
          fontSize: 17,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.0,
          decoration: TextDecoration.none)
      : GoogleFonts.getFont(fontChoice,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
          decoration: TextDecoration.none);
}

/// The text style for a heading four
TextStyle heading4() {
  return accessibility.accessFeatures.boldText == true
      ? GoogleFonts.getFont(fontChoice,
          fontSize: 14,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.0,
          decoration: TextDecoration.none)
      : GoogleFonts.getFont(fontChoice,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
          decoration: TextDecoration.none);
}

/// The text style for a subheading
TextStyle subheading() {
  return accessibility.accessFeatures.boldText == true
      ? GoogleFonts.getFont(fontChoice,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.4,
          decoration: TextDecoration.none)
      : GoogleFonts.getFont(fontChoice,
          fontSize: 20,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.4,
          decoration: TextDecoration.none);
}

/// The text style for a body one
TextStyle body1() {
  return accessibility.accessFeatures.boldText == true
      ? GoogleFonts.getFont(fontChoice,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.4,
          decoration: TextDecoration.none)
      : GoogleFonts.getFont(fontChoice,
          fontSize: 17,
          fontWeight: FontWeight.w200,
          letterSpacing: 0.4,
          decoration: TextDecoration.none);
}

/// The text style for a body two
TextStyle body2() {
  return accessibility.accessFeatures.boldText == true
      ? GoogleFonts.getFont(fontChoice,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.4,
          decoration: TextDecoration.none)
      : GoogleFonts.getFont(fontChoice,
          fontSize: 18,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.4,
          decoration: TextDecoration.none);
}

/// The text style for a button one
TextStyle button1() {
  return accessibility.accessFeatures.boldText == true
      ? GoogleFonts.getFont(fontChoice,
          fontSize: 17,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.4,
          decoration: TextDecoration.none)
      : GoogleFonts.getFont(fontChoice,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
          decoration: TextDecoration.none);
}

/// The text style for a button two
TextStyle button2() {
  return accessibility.accessFeatures.boldText == true
      ? GoogleFonts.getFont(fontChoice,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4,
          decoration: TextDecoration.none)
      : GoogleFonts.getFont(fontChoice,
          fontSize: 15,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.0,
          decoration: TextDecoration.none);
}

/// The text style for a tag one
TextStyle tag1() {
  return accessibility.accessFeatures.boldText == true
      ? GoogleFonts.getFont(fontChoice,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.4,
          decoration: TextDecoration.none)
      : GoogleFonts.getFont(fontChoice,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.3,
          decoration: TextDecoration.none);
}

/// The text style for a tag two
TextStyle tag2() {
  return accessibility.accessFeatures.boldText == true
      ? GoogleFonts.getFont(fontChoice,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.4,
          decoration: TextDecoration.none)
      : GoogleFonts.getFont(fontChoice,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.0,
          decoration: TextDecoration.none);
}

/// A class who's responsibilites is managing TitleCases for typography.
class TitleCase {
  // A class that converts a string to title casing

  /// A function that converts your string to Title case where applicable
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

/// A text class that uses the heading one text style
class HeadingOneText extends Text {
  HeadingOneText(String data, decorationPriority textColor)
      : super(data,
            style: heading1().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)),
            semanticsLabel: data);
}

/// A text class that uses the heading two text style
class HeadingTwoText extends Text {
  HeadingTwoText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: heading2().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)),
            semanticsLabel: data);
}

/// A text class that uses the heading three text style
class HeadingThreeText extends Text {
  HeadingThreeText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: heading3().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)),
            semanticsLabel: data);
}

/// A text class that uses the heading four text style
class HeadingFourText extends Text {
  HeadingFourText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: heading4().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)),
            semanticsLabel: data);
}

/// A text class that uses the subheader text style
class SubheaderText extends Text {
  SubheaderText(String data, decorationPriority textColor)
      : super(TitleCase.convertToTitleCase(data),
            style: subheading().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)),
            semanticsLabel: data);
}

/// A text class that uses the body one text style
class BodyOneText extends Text {
  BodyOneText(String data, decorationPriority textColor)
      : super(data,
            style: body1().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)),
            semanticsLabel: data);
}

/// A text class that uses the body two text style
class BodyTwoText extends Text {
  BodyTwoText(String data, decorationPriority textColor)
      : super(data,
            style: body2().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)),
            semanticsLabel: data);
}

/// A text class that uses the button one text style
class ButtonOneText extends Text {
  ButtonOneText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: button1().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)),
            semanticsLabel: data);
}

/// A text class that uses the button two text style
class ButtonTwoText extends Text {
  ButtonTwoText(String data, decorationPriority textColor)
      : super(
          data.toUpperCase(),
          style: button2().copyWith(
              color: coloration.decorationColor(decorationVariant: textColor)),
          semanticsLabel: data,
        );
}

/// A text class that uses the tag one text style
class TagOneText extends Text {
  TagOneText(String data, decorationPriority textColor)
      : super(
          data.toUpperCase(),
          style: tag1().copyWith(
              color: coloration.decorationColor(decorationVariant: textColor)),
          semanticsLabel: data,
        );
}

/// A text class that uses the tag two text style
class TagTwoText extends Text {
  TagTwoText(String data, decorationPriority textColor)
      : super(
          data.toUpperCase(),
          style: tag2().copyWith(
              color: coloration.decorationColor(decorationVariant: textColor)),
          semanticsLabel: data,
        );
}
