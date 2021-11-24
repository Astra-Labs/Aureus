import 'package:aureus/aureus.dart';

//All Variables for the UDS Elements
//Doc Link:

var foundation = UDSVariables();

/* ------------------ GLOBAL VARIABLES -------------------- */
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

  BoxShadow lightHaze() {
    return BoxShadow(
        color: steel().withOpacity(0.4),
        offset: Offset(0.0, 3.0),
        blurRadius: 30.0);
  }

  BoxShadow darkHaze() {
    return BoxShadow(
        color: carbon(), offset: Offset(0.0, 3.0), blurRadius: 30.0);
  }

  BoxShadow pastelHaze() {
    return BoxShadow(
        color: prodColor.withOpacity(0.4),
        offset: Offset(0.0, 3.0),
        blurRadius: 30.0);
  }

  Border universalBorder() {
    return Border.all(color: steel().withOpacity(0.6), width: 1);
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
}

/* ------------------ TEXT CLASSES -------------------- */

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

//Info Hiearchy - A set of texts / label styles that acts as the typographic foundation for the rest of the UDS
final titleCase = TitleCase();
final coloration = Coloration();

Color universalTextColoration(modeVariant) {
  return coloration.universalTextColor(modeVariant);
}

class HeadingOneText extends Text {
  HeadingOneText(String data, modeVariants variants)
      : super(TitleCase.convertToTitleCase(data),
            style: foundation
                .heading1()
                .copyWith(color: universalTextColoration(variants)));
}

class HeadingTwoText extends Text {
  HeadingTwoText(String data, modeVariants variants)
      : super(data.toUpperCase(),
            style: foundation
                .heading2()
                .copyWith(color: universalTextColoration(variants)));
}

class HeadingThreeText extends Text {
  HeadingThreeText(String data, modeVariants variants)
      : super(data.toUpperCase(),
            style: foundation
                .heading3()
                .copyWith(color: universalTextColoration(variants)));
}

class HeadingFourText extends Text {
  HeadingFourText(String data, modeVariants variants)
      : super(data.toUpperCase(),
            style: foundation
                .heading4()
                .copyWith(color: universalTextColoration(variants)));
}

class SubheaderText extends Text {
  SubheaderText(String data, modeVariants variants)
      : super(TitleCase.convertToTitleCase(data),
            style: foundation
                .subheading()
                .copyWith(color: universalTextColoration(variants)));
}

class BodyOneText extends Text {
  BodyOneText(String data, modeVariants variants)
      : super(data,
            style: foundation
                .body1()
                .copyWith(color: universalTextColoration(variants)));
}

class BodyTwoText extends Text {
  BodyTwoText(String data, modeVariants variants)
      : super(data,
            style: foundation
                .body2()
                .copyWith(color: universalTextColoration(variants)));
}

class ButtonOneText extends Text {
  ButtonOneText(String data, modeVariants variants)
      : super(data.toUpperCase(),
            style: foundation
                .button1()
                .copyWith(color: universalTextColoration(variants)));
}

class ButtonTwoText extends Text {
  ButtonTwoText(String data, modeVariants variants)
      : super(data.toUpperCase(),
            style: foundation
                .button2()
                .copyWith(color: universalTextColoration(variants)));
}

class TagOneText extends Text {
  TagOneText(String data, modeVariants variants)
      : super(data.toUpperCase(),
            style: foundation.tag1(color: universalTextColoration(variants)));
}

class TagTwoText extends Text {
  TagTwoText(String data, modeVariants variants)
      : super(data.toUpperCase(),
            style: foundation.tag2(color: universalTextColoration(variants)));
}

//MARK: - Sizing
/* ------------------ SIZING -------------------- */
class Sizing {
  static double heightOf({context: MediaQueryData, weight: sizingWeight}) {
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

  static double widthOf({context: MediaQueryData, weight: sizingWeight}) {
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

//MARK: - Decorations
/* ------------------ DECORATIONS -------------------- */

class BaseBackingDecoration {
  final modeVariants mode;
  final decorationPriority priority;

  BaseBackingDecoration({required this.mode, required this.priority});

  Border decorationBorder =
      Border.all(color: foundation.white().withOpacity(0.0));
  Color decorationFill = foundation.white().withOpacity(0.0);
  late Gradient decorationGradient;
  double decorationCornerRadius = 0.0;
  BoxShape decorationShape = BoxShape.rectangle;
  BoxShadow decorationHaze = BoxShadow();

  //this should always be overriden by the child classes, so this will throw an error because it is not implemented.
  BoxDecoration buildBacking() {
    throw UnimplementedError();
  }
}

class ButtonBackingDecoration extends BaseBackingDecoration {
  final buttonDecorationVariants variant;

  ButtonBackingDecoration(
      {required this.variant, required mode, required priority})
      : super(mode: mode, priority: priority);

  @override
  BoxDecoration buildBacking() {
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
      decorationFill = foundation.steel().withOpacity(0.5);
    } else if (priority == decorationPriority.important) {
      //defining variants for the specific mode
      if (mode == modeVariants.light) {
        decorationGradient = foundation.lightGradient();
        decorationBorder = foundation.pastelBorder();
      } else if (mode == modeVariants.dark) {
        decorationGradient = foundation.darkGradient();
        decorationBorder = foundation.pastelBorder();
      }
    } else if (priority == decorationPriority.standard) {
      //defining variants for the specific mode
      if (mode == modeVariants.light) {
        decorationFill = foundation.frost();
        decorationBorder = foundation.universalBorder();
      } else if (mode == modeVariants.dark) {
        decorationFill = foundation.carbon();
        decorationBorder = foundation.universalBorder();
      }
    }

    return BoxDecoration(
        color: decorationFill,
        gradient: decorationGradient,
        border: decorationBorder,
        shape: decorationShape,
        boxShadow: [decorationHaze],
        borderRadius: BorderRadius.all(decorationCornerRadius as Radius));
  }
}

class LayerBackingDecoration extends BaseBackingDecoration {
  final layerDecorationVariants variant;

  LayerBackingDecoration(
      {required this.variant, required mode, required priority})
      : super(mode: mode, priority: priority);

  @override
  BoxDecoration buildBacking() {
    //defining variants for the specific item
    if (variant == layerDecorationVariants.edged) {
      decorationCornerRadius = 0.0;
    } else if (variant == layerDecorationVariants.rounded) {
      decorationCornerRadius = 5.0;
    }

    //defining variants for the specific priority
    if (priority == decorationPriority.important) {
      //defining variants for the specific mode
      decorationFill = foundation.prodColor.withOpacity(0.4);

      if (mode == modeVariants.light) {
        decorationHaze = foundation.lightHaze();
      } else if (mode == modeVariants.dark) {
        decorationHaze = foundation.darkHaze();
      }
    } else if (priority == decorationPriority.standard) {
      //defining variants for the specific mode
      if (mode == modeVariants.light) {
        decorationFill = foundation.ice();
      } else if (mode == modeVariants.dark) {
        decorationFill = foundation.carbon();
      }
    }

    return BoxDecoration(
        color: decorationFill,
        gradient: decorationGradient,
        border: decorationBorder,
        shape: decorationShape,
        boxShadow: [decorationHaze],
        borderRadius: BorderRadius.all(decorationCornerRadius as Radius));
  }
}

class CardBackingDecoration extends BaseBackingDecoration {
  final cardDecorationVariants variant;

  CardBackingDecoration(
      {required this.variant, required mode, required priority})
      : super(mode: mode, priority: priority);

  @override
  BoxDecoration buildBacking() {
    //defining variants for the specific item
    if (variant == cardDecorationVariants.pilledRectangle) {
      decorationCornerRadius = 20.0;
    } else if (variant == cardDecorationVariants.roundedRectangle) {
      decorationCornerRadius = 5.0;
    }

    //defining variants for the specific priority
    if (priority == decorationPriority.inactive) {
      //defining variants for the specific mode
      decorationFill = foundation.steel().withOpacity(0.5);
    } else if (priority == decorationPriority.important) {
      decorationGradient = foundation.mediumGradient();
      decorationBorder = foundation.pastelBorder();
    } else if (priority == decorationPriority.standard) {
      //defining variants for the specific mode
      if (mode == modeVariants.light) {
        decorationGradient = foundation.lightGradient();
        decorationBorder = foundation.universalBorder();
      } else if (mode == modeVariants.dark) {
        decorationGradient = foundation.darkGradient();
        decorationBorder = foundation.universalBorder();
      }
    }

    return BoxDecoration(
        color: decorationFill,
        gradient: decorationGradient,
        border: decorationBorder,
        shape: decorationShape,
        boxShadow: [decorationHaze],
        borderRadius: BorderRadius.all(decorationCornerRadius as Radius));
  }
}

class InputBackingDecoration extends BaseBackingDecoration {
  InputBackingDecoration({required mode, required priority})
      : super(mode: mode, priority: priority);

  @override
  BoxDecoration buildBacking() {
    //defining variants for the specific mode
    if (mode == modeVariants.light) {
      decorationFill = foundation.melt();
      decorationBorder = foundation.universalBorder();
    } else if (mode == modeVariants.dark) {
      decorationFill = foundation.carbon();
      decorationBorder = foundation.universalBorder();
    }

    decorationCornerRadius = 7.0;
    decorationShape = BoxShape.rectangle;

    return BoxDecoration(
        color: decorationFill,
        gradient: decorationGradient,
        border: decorationBorder,
        shape: decorationShape,
        boxShadow: [decorationHaze],
        borderRadius: BorderRadius.all(decorationCornerRadius as Radius));
  }
}

class TabItemBackingDecoration extends BaseBackingDecoration {
  final tabItemDecorationVariants variant;

  TabItemBackingDecoration(
      {required this.variant, required mode, required priority})
      : super(mode: mode, priority: priority);

  @override
  BoxDecoration buildBacking() {
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
      decorationFill = foundation.steel().withOpacity(0.5);
    } else if (priority == decorationPriority.important) {
      //defining variants for the specific mode

      decorationGradient = foundation.mediumGradient();
      decorationBorder = foundation.pastelBorder();

      if (mode == modeVariants.light) {
        decorationHaze = foundation.pastelHaze();
      } else if (mode == modeVariants.dark) {
        decorationHaze = foundation.darkHaze();
      }
    }

    return BoxDecoration(
        color: decorationFill,
        gradient: decorationGradient,
        border: decorationBorder,
        shape: decorationShape,
        boxShadow: [decorationHaze],
        borderRadius: BorderRadius.all(decorationCornerRadius as Radius));
  }
}

/// Flutter icons
/// Copyright (C) 2021 by original authors @ fluttericon.com, fontello.com
/// This font was generated by FlutterIcon.com, which is derived from Fontello.

class Assets {
  Assets._();

  static const _kFontFam = 'Aureus';
  static const String? _kFontPkg = null;

  static const IconData add =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData alert =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData alertmessage =
      IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData android =
      IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData apple =
      IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData babycarriage =
      IconData(0xe805, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData back =
      IconData(0xe806, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData body =
      IconData(0xe807, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData brain =
      IconData(0xe808, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData camera =
      IconData(0xe809, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData expand =
      IconData(0xe80a, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData hamburgermenu =
      IconData(0xe80b, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData icon =
      IconData(0xe80c, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData link =
      IconData(0xe80d, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData location =
      IconData(0xe80e, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData lock =
      IconData(0xe80f, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData mail =
      IconData(0xe810, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData medicine =
      IconData(0xe811, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData money =
      IconData(0xe812, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData more1 =
      IconData(0xe813, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData more2 =
      IconData(0xe814, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData next =
      IconData(0xe815, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData no =
      IconData(0xe816, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData paperplane =
      IconData(0xe817, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData partnership =
      IconData(0xe818, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData pause =
      IconData(0xe819, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData pencil =
      IconData(0xe81a, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData people =
      IconData(0xe81b, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData person =
      IconData(0xe81c, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData phone =
      IconData(0xe81d, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData play =
      IconData(0xe81e, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData settings =
      IconData(0xe81f, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData snowflake =
      IconData(0xe820, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData speedometer =
      IconData(0xe821, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData stethoscope =
      IconData(0xe822, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData stop =
      IconData(0xe823, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData time =
      IconData(0xe824, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData window =
      IconData(0xe825, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData wrench =
      IconData(0xe826, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData yes =
      IconData(0xe827, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
