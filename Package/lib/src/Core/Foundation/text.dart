import 'package:aureus/aureus.dart';

/* ------------------ TEXT CLASSES -------------------- */

/*

This is where the text styles are, and the text widgets that accompany them. 
Items here also go through the coloration class to be properly rendered for 
each mode.

*/

// Global Text Styles ---------------------------------

TextStyle heading1() {
  return accessibility.accessFeatures.boldText == true
      ? GoogleFonts.exo(
          fontSize: accessibility.responsiveTextSize(26),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4)
      : GoogleFonts.exo(
          fontSize: accessibility.responsiveTextSize(26),
          fontWeight: FontWeight.w200,
          letterSpacing: 0.4);
}

TextStyle heading2() {
  return accessibility.accessFeatures.boldText == true
      ? GoogleFonts.exo(
          fontSize: accessibility.responsiveTextSize(21),
          fontWeight: FontWeight.w500,
          letterSpacing: 1.2,
        )
      : GoogleFonts.exo(
          fontSize: accessibility.responsiveTextSize(21),
          fontWeight: FontWeight.w300,
          letterSpacing: 1.2,
        );
}

TextStyle heading3() {
  return accessibility.accessFeatures.boldText == true
      ? GoogleFonts.exo(
          fontSize: accessibility.responsiveTextSize(17),
          fontWeight: FontWeight.w700,
          letterSpacing: 1.0)
      : GoogleFonts.exo(
          fontSize: accessibility.responsiveTextSize(17),
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0);
}

TextStyle heading4() {
  return accessibility.accessFeatures.boldText == true
      ? GoogleFonts.exo(
          fontSize: accessibility.responsiveTextSize(14),
          fontWeight: FontWeight.w800,
          letterSpacing: 1.0)
      : GoogleFonts.exo(
          fontSize: accessibility.responsiveTextSize(14),
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0);
}

TextStyle subheading() {
  return accessibility.accessFeatures.boldText == true
      ? GoogleFonts.exo(
          fontSize: accessibility.responsiveTextSize(17),
          fontWeight: FontWeight.w500,
          letterSpacing: 0.4)
      : GoogleFonts.exo(
          fontSize: accessibility.responsiveTextSize(17),
          fontWeight: FontWeight.w300,
          letterSpacing: 0.4);
}

TextStyle body1() {
  return accessibility.accessFeatures.boldText == true
      ? GoogleFonts.exo(
          fontSize: accessibility.responsiveTextSize(14),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4)
      : GoogleFonts.exo(
          fontSize: accessibility.responsiveTextSize(14),
          fontWeight: FontWeight.w200,
          letterSpacing: 0.4);
}

TextStyle body2() {
  return accessibility.accessFeatures.boldText == true
      ? GoogleFonts.exo(
          fontSize: accessibility.responsiveTextSize(15),
          fontWeight: FontWeight.w500,
          letterSpacing: 0.4)
      : GoogleFonts.exo(
          fontSize: accessibility.responsiveTextSize(14),
          fontWeight: FontWeight.w300,
          letterSpacing: 0.4);
}

TextStyle button1() {
  return accessibility.accessFeatures.boldText == true
      ? GoogleFonts.exo(
          fontSize: accessibility.responsiveTextSize(17),
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4)
      : GoogleFonts.exo(
          fontSize: accessibility.responsiveTextSize(17),
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0);
}

TextStyle button2() {
  return accessibility.accessFeatures.boldText == true
      ? GoogleFonts.exo(
          fontSize: accessibility.responsiveTextSize(12),
          fontWeight: FontWeight.w600,
          letterSpacing: 0.4)
      : GoogleFonts.exo(
          fontSize: accessibility.responsiveTextSize(12),
          fontWeight: FontWeight.w400,
          letterSpacing: 1.0);
}

TextStyle tag1() {
  return accessibility.accessFeatures.boldText == true
      ? GoogleFonts.exo(
          fontSize: accessibility.responsiveTextSize(12),
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4)
      : GoogleFonts.exo(
          fontSize: accessibility.responsiveTextSize(12),
          fontWeight: FontWeight.w500,
          letterSpacing: 1.5);
}

TextStyle tag2() {
  return accessibility.accessFeatures.boldText == true
      ? GoogleFonts.exo(
          fontSize: accessibility.responsiveTextSize(12),
          fontWeight: FontWeight.w600,
          letterSpacing: 0.4)
      : GoogleFonts.exo(
          fontSize: accessibility.responsiveTextSize(12),
          fontWeight: FontWeight.w400,
          letterSpacing: 1.0);
}

class TitleCase {
  // A class that converts a string to title casing
  //E.G: - 'This Is An Example Of Title Case'

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

class HeadingOneText extends Text {
  HeadingOneText(String data, decorationPriority textColor)
      : super(data,
            style: heading1().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)),
            semanticsLabel: data,
            key: ValueKey<bool>(containerEnvChanged));
}

class HeadingTwoText extends Text {
  HeadingTwoText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: heading2().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)),
            semanticsLabel: data,
            key: ValueKey<bool>(containerEnvChanged));
}

class HeadingThreeText extends Text {
  HeadingThreeText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: heading3().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)),
            semanticsLabel: data,
            key: ValueKey<bool>(containerEnvChanged));
}

class HeadingFourText extends Text {
  HeadingFourText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: heading4().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)),
            semanticsLabel: data,
            key: ValueKey<bool>(containerEnvChanged));
}

class SubheaderText extends Text {
  SubheaderText(String data, decorationPriority textColor)
      : super(TitleCase.convertToTitleCase(data),
            style: subheading().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)),
            semanticsLabel: data,
            key: ValueKey<bool>(containerEnvChanged));
}

class BodyOneText extends Text {
  BodyOneText(String data, decorationPriority textColor)
      : super(data,
            style: body1().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)),
            semanticsLabel: data,
            key: ValueKey<bool>(containerEnvChanged));
}

class BodyTwoText extends Text {
  BodyTwoText(String data, decorationPriority textColor)
      : super(data,
            style: body2().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)),
            semanticsLabel: data,
            key: ValueKey<bool>(containerEnvChanged));
}

class ButtonOneText extends Text {
  ButtonOneText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: button1().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)),
            semanticsLabel: data,
            key: ValueKey<bool>(containerEnvChanged));
}

class ButtonTwoText extends Text {
  ButtonTwoText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: button2().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)),
            semanticsLabel: data,
            key: ValueKey<bool>(containerEnvChanged));
}

class TagOneText extends Text {
  TagOneText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: tag1().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)),
            semanticsLabel: data,
            key: ValueKey<bool>(containerEnvChanged));
}

class TagTwoText extends Text {
  TagTwoText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: tag2().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)),
            semanticsLabel: data,
            key: ValueKey<bool>(containerEnvChanged));
}
