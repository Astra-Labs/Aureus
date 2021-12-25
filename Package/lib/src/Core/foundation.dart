import 'package:aureus/aureus.dart';
import 'dart:ui';

import 'package:flutter/scheduler.dart';

//All Variables for the UDS Elements
//Doc Link:

var foundation = Aureus(
    lightFluidImage: Image.asset('Light-Mesh'),
    darkFluidImage: Image.asset('Dark-Mesh'));
var size = Sizing();

/* ------------------ GLOBAL VARIABLES -------------------- */
// 🛑
class Aureus {
  Color prodColor;
  String prodName;
  Image darkFluidImage = Image.asset('');
  Image lightFluidImage = Image.asset('');

  Aureus(
      {this.prodColor = const Color.fromRGBO(181, 190, 242, 1.0),
      this.prodName = 'Aureus',
      required this.darkFluidImage,
      required this.lightFluidImage});

  var brightness = SchedulerBinding.instance!.window.platformBrightness;

//Global Gradients

  Gradient lightGradient() {
    return LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.white, Color.fromRGBO(199, 208, 241, 1.0)]);
  }

  Gradient mediumGradient() {
    return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(185, 195, 237, 1.0),
          Color.fromRGBO(216, 222, 244, 1.0)
        ]);
  }

  Gradient darkGradient() {
    return LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          const Color.fromRGBO(4, 4, 6, 1.0),
          const Color.fromRGBO(67, 72, 109, 1.0)
        ]);
  }

  Container lightBlur() {
    RadialGradient topLeftGradient = RadialGradient(
        colors: [foundation.lavender(), Color.fromRGBO(181, 190, 242, 1.0)],
        stops: [0.0, 1.0],
        center: Alignment.topLeft);

    RadialGradient bottomRightGradient = RadialGradient(colors: [
      Color.fromRGBO(184, 192, 214, 1.0),
      Color.fromRGBO(181, 190, 242, 1.0)
    ], stops: [
      0.0,
      1.0
    ], center: Alignment.bottomRight);

    Container topGradient = Container(
        decoration: BoxDecoration(gradient: topLeftGradient),
        width: size.widthOf(weight: sizingWeight.w10),
        height: size.heightOf(weight: sizingWeight.w10));

    Container bottomGradient = Container(
        decoration: BoxDecoration(gradient: bottomRightGradient),
        width: size.widthOf(weight: sizingWeight.w10),
        height: size.heightOf(weight: sizingWeight.w10));

    return topGradient; /*Container(
        child: Stack(
          children: [topGradient, bottomGradient],
        ),
        width: size.widthOf(weight: sizingWeight.w10),
        height: size.heightOf(weight: sizingWeight.w10));*/
  }

  Container darkBlur() {
    return Container();
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

  Color lavender() {
    return Color.fromRGBO(181, 190, 242, 1.0);
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

  Color onyx() {
    return Color.fromRGBO(56, 56, 56, 1.0);
  }

  Color lightModeFill() {
    return black().withOpacity(0.10);
  }

  Color darkModeFill() {
    return white().withOpacity(0.15);
  }

  BoxShadow lightShadow() {
    return BoxShadow(
        color: steel().withOpacity(0.4),
        offset: Offset(0.0, 3.0),
        blurRadius: 30.0);
  }

  BoxShadow darkShadow() {
    return BoxShadow(
        color: carbon().withOpacity(0.2),
        offset: Offset(0.0, 3.0),
        blurRadius: 30.0);
  }

  BoxShadow pastelShadow() {
    return BoxShadow(
        color: lavender().withOpacity(0.3),
        offset: Offset(0.0, 3.0),
        blurRadius: 30.0);
  }

  Border universalBorder() {
    return Border.all(color: steel().withOpacity(0.6), width: 1);
  }

  Border pastelBorder() {
    return Border.all(color: white().withOpacity(0.15), width: 1);
  }

  Border lightModeBorder() {
    return Border.all(color: black().withOpacity(0.20), width: 1);
  }

  Border darkModeBorder() {
    return Border.all(color: white().withOpacity(0.20), width: 1);
  }

// Global Text Styles
  TextStyle heading1() {
    return GoogleFonts.exo(
        fontSize: 26, fontWeight: FontWeight.w300, letterSpacing: 0.2);
  }

  TextStyle heading2() {
    return GoogleFonts.exo(
      fontSize: 21,
      fontWeight: FontWeight.w300,
      letterSpacing: 1.2,
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
        fontSize: 17, fontWeight: FontWeight.w600, letterSpacing: 1.0);
  }

  TextStyle button2() {
    return GoogleFonts.exo(
        fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 1.0);
  }

  TextStyle tag1() {
    return GoogleFonts.exo(
        fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 1.5);
  }

  TextStyle tag2() {
    return GoogleFonts.exo(
        fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 1.0);
  }
}

/* ------------------ TEXT CLASSES -------------------- */

// 🛑
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
final coloration = Coloration();

class HeadingOneText extends Text {
  HeadingOneText(String data, decorationPriority textColor)
      : super(TitleCase.convertToTitleCase(data),
            style: foundation.heading1().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)));
}

class HeadingTwoText extends Text {
  HeadingTwoText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: foundation.heading2().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)));
}

class HeadingThreeText extends Text {
  HeadingThreeText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: foundation.heading3().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)));
}

class HeadingFourText extends Text {
  HeadingFourText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: foundation.heading4().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)));
}

class SubheaderText extends Text {
  SubheaderText(String data, decorationPriority textColor)
      : super(TitleCase.convertToTitleCase(data),
            style: foundation.subheading().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)));
}

class BodyOneText extends Text {
  BodyOneText(String data, decorationPriority textColor)
      : super(data,
            style: foundation.body1().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)));
}

class BodyTwoText extends Text {
  BodyTwoText(String data, decorationPriority textColor)
      : super(data,
            style: foundation.body2().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)));
}

class ButtonOneText extends Text {
  ButtonOneText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: foundation.button1().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)));
}

class ButtonTwoText extends Text {
  ButtonTwoText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: foundation.button2().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)));
}

class TagOneText extends Text {
  TagOneText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: foundation.tag1().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)));
}

class TagTwoText extends Text {
  TagTwoText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: foundation.tag2().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)));
}

/* ------------------ SIZING -------------------- */
class Sizing {
  //Pixel Ratio of a given device
  final pixelRatio = window.devicePixelRatio;

  //Size in physical pixels
  final physicalScreenSize = window.physicalSize;

  late var physicalWidth = physicalScreenSize.width;
  late var physicalHeight = physicalScreenSize.height;

  //Size in logical pixels
  late var logicalScreenSize = window.physicalSize / pixelRatio;
  late var logicalWidth = logicalScreenSize.width;
  late var logicalHeight = logicalScreenSize.height;

//Creates universal padding for all items based on the screen size.
  EdgeInsets universalPadding() {
    return EdgeInsets.fromLTRB(20, 10, 20, 10);
  }

  EdgeInsets containerPadding() {
    return EdgeInsets.fromLTRB(
        widthOf(weight: sizingWeight.w1),
        heightOf(weight: sizingWeight.w1),
        widthOf(weight: sizingWeight.w1),
        heightOf(weight: sizingWeight.w1));
  }

  double heightOf({weight: sizingWeight}) {
    double screenWeightedHeight = 0.0;

    switch (weight) {

      //MINIMUM WIDTH OF ITEM - 5%
      case sizingWeight.w0:
        screenWeightedHeight = (logicalHeight) * 0.05;
        break;

      //10% of screen height
      case sizingWeight.w1:
        screenWeightedHeight = (logicalHeight) * 0.1;
        break;

      //20% of screen height
      case sizingWeight.w2:
        screenWeightedHeight = (logicalHeight) * 0.2;
        break;

      //30% of screen height
      case sizingWeight.w3:
        screenWeightedHeight = (logicalHeight) * 0.3;
        break;

      //40% of screen height
      case sizingWeight.w4:
        screenWeightedHeight = (logicalHeight) * 0.4;
        break;

      //50% of screen height
      case sizingWeight.w5:
        screenWeightedHeight = (logicalHeight) * 0.5;
        break;

      //60% of screen height
      case sizingWeight.w6:
        screenWeightedHeight = (logicalHeight) * 0.6;
        break;

      //70% of screen height
      case sizingWeight.w7:
        screenWeightedHeight = (logicalHeight) * 0.7;
        break;

      //80% of screen height
      case sizingWeight.w8:
        screenWeightedHeight = (logicalHeight) * 0.8;
        break;

      //90% of screen height
      case sizingWeight.w9:
        screenWeightedHeight = (logicalHeight) * 0.9;
        break;

      //100% of screen height
      case sizingWeight.w10:
        screenWeightedHeight = (logicalHeight);
        break;
    }

    return screenWeightedHeight;
  }

  double widthOf({weight: sizingWeight}) {
    double screenWeightedWidth = 0.0;

    switch (weight) {

      //MINIMUM WIDTH OF ITEM - 5%
      case sizingWeight.w0:
        screenWeightedWidth = (logicalWidth) * 0.05;
        break;

      //10% of width
      case sizingWeight.w1:
        screenWeightedWidth = (logicalWidth) * 0.1;
        break;

      //20% of width
      case sizingWeight.w2:
        screenWeightedWidth = (logicalWidth) * 0.2;
        break;

      //30% of width
      case sizingWeight.w3:
        screenWeightedWidth = (logicalWidth) * 0.3;
        break;

      //40% of width
      case sizingWeight.w4:
        screenWeightedWidth = (logicalWidth) * 0.4;
        break;

      //50% of width
      case sizingWeight.w5:
        screenWeightedWidth = (logicalWidth) * 0.5;
        break;

      //60% of width
      case sizingWeight.w6:
        screenWeightedWidth = (logicalWidth) * 0.6;
        break;

      //70% of width
      case sizingWeight.w7:
        screenWeightedWidth = (logicalWidth) * 0.7;
        break;

      //80% of width
      case sizingWeight.w8:
        screenWeightedWidth = (logicalWidth) * 0.8;
        break;

      //90% of width
      case sizingWeight.w9:
        screenWeightedWidth = (logicalWidth) * 0.9;
        break;

      //100% of width
      case sizingWeight.w10:
        screenWeightedWidth = (logicalWidth);
        break;
    }

    return screenWeightedWidth;
  }
}

//MARK: - Decorations
/* ------------------ DECORATIONS -------------------- */

// 🛑
class BaseBackingDecoration {
  final decorationPriority priority;

  BaseBackingDecoration({required this.priority});

  Border? decorationBorder;
  Color? decorationFill;
  Gradient? decorationGradient;
  BorderRadius? decorationCornerRadius;
  BoxShape? decorationShape;
  BoxShadow? decorationHaze;

  BoxDecoration buildBacking() {
    print('Returning backing decoration with the following values:');
    print(
        'color is $decorationFill, gradient is $decorationGradient, border is $decorationBorder, shape is $decorationShape, haze is $decorationHaze, radius is $decorationCornerRadius');

    //performs null safety check on backing shadow and passes an empty list if null
    List<BoxShadow> backingShadow =
        decorationHaze != null ? [decorationHaze!] : [];

    return BoxDecoration(
        color: decorationFill,
        gradient: decorationGradient,
        border: decorationBorder,
        shape: decorationShape ?? BoxShape.rectangle,
        boxShadow: backingShadow,
        borderRadius: decorationCornerRadius);
  }
}

// 🛑
//
class ButtonBackingDecoration extends BaseBackingDecoration {
  final buttonDecorationVariants variant;

  ButtonBackingDecoration({required this.variant, required priority})
      : super(priority: priority) {
    //defining variants for the specific item
    if (variant == buttonDecorationVariants.circle) {
      print('item is circle');
      decorationCornerRadius = BorderRadius.circular(100);
    } else if (variant == buttonDecorationVariants.roundedPill) {
      decorationCornerRadius = BorderRadius.circular(30.0);
    } else if (variant == buttonDecorationVariants.roundedRectangle) {
      decorationCornerRadius = BorderRadius.circular(7.0);
    }

    //defining variants for the specific priority
    if (priority == decorationPriority.inactive) {
      //defining variants for the specific mode
      decorationFill = coloration.inactiveColor();
    } else if (priority == decorationPriority.important) {
      //defining variants for the specific mode
      if (foundation.brightness == Brightness.light) {
        print('is light!');
        decorationGradient = foundation.darkGradient();
        decorationBorder = foundation.universalBorder();
      } else if (foundation.brightness == Brightness.dark) {
        print('is dark!');
        decorationGradient = foundation.lightGradient();
        decorationBorder = foundation.universalBorder();
      }
    } else if (priority == decorationPriority.standard) {
      //defining variants for the specific mode
      if (foundation.brightness == Brightness.light) {
        print('is light!');
        decorationFill = foundation.lightModeFill();
        decorationBorder = foundation.lightModeBorder();
      } else if (foundation.brightness == Brightness.dark) {
        print('is dark!');
        decorationFill = foundation.darkModeFill();
        decorationBorder = foundation.darkModeBorder();
      }
    }
  }
}

// 🛑
class LayerBackingDecoration extends BaseBackingDecoration {
  LayerBackingDecoration({required priority}) : super(priority: priority) {
    decorationCornerRadius = BorderRadius.circular(10.0);
    //defining variants for the specific priority
    if (priority == decorationPriority.inactive ||
        priority == decorationPriority.standard) {
      //defining variants for the specific mode

      //layers do not show inactive colors because layers aren't interactable by definition, so one statement covers standard & inactive.
      if (foundation.brightness == Brightness.light) {
        print('is light layer!');
        decorationFill = foundation.lightModeFill();
      } else if (foundation.brightness == Brightness.dark) {
        print('is dark layer!');
        decorationFill = foundation.darkModeFill();
      }
    } else if (priority == decorationPriority.important) {
      if (foundation.brightness == Brightness.light) {
        print('is light layer!');
        decorationGradient = foundation.darkGradient();
        decorationBorder = foundation.universalBorder();
        decorationHaze = foundation.darkShadow();
      } else if (foundation.brightness == Brightness.dark) {
        print('is dark layer!');
        decorationGradient = foundation.lightGradient();
        decorationBorder = foundation.universalBorder();
        decorationHaze = foundation.pastelShadow();
      }
    }
  }
}

// 🛑
class CardBackingDecoration extends BaseBackingDecoration {
  CardBackingDecoration({required priority}) : super(priority: priority) {
    //defining variants for the specific priority
    if (priority == decorationPriority.inactive) {
      //defining variants for the specific mode
      print('is inactive card');
      decorationCornerRadius = BorderRadius.circular(10.0);
      decorationFill = coloration.inactiveColor();
    } else if (priority == decorationPriority.important) {
      decorationCornerRadius = BorderRadius.circular(20.0);
      decorationBorder = foundation.universalBorder();

      if (foundation.brightness == Brightness.light) {
        print('is light and important card!');
        decorationGradient = foundation.darkGradient();
        decorationHaze = foundation.darkShadow();
      } else if (foundation.brightness == Brightness.dark) {
        print('is dark and important card!');
        decorationGradient = foundation.lightGradient();
        decorationHaze = foundation.pastelShadow();
      }
    } else if (priority == decorationPriority.standard) {
      //defining variants for the specific mode
      decorationCornerRadius = BorderRadius.circular(20.0);
      if (foundation.brightness == Brightness.light) {
        print('is light and standard card!');
        decorationFill = foundation.lightModeFill();
        decorationBorder = foundation.lightModeBorder();
      } else if (foundation.brightness == Brightness.dark) {
        print('is dark and standard card!');
        decorationFill = foundation.darkModeFill();
        decorationBorder = foundation.darkModeBorder();
      }
    }
  }
}

// 🛑
class InputBackingDecoration extends BaseBackingDecoration {
  InputBackingDecoration() : super(priority: decorationPriority.standard) {
    //defining variants for the specific mode
    if (foundation.brightness == Brightness.light) {
      decorationFill = foundation.lightModeFill();
      decorationBorder = foundation.lightModeBorder();
    } else if (foundation.brightness == Brightness.dark) {
      decorationFill = foundation.darkModeFill();
      decorationBorder = foundation.darkModeBorder();
    }
    decorationCornerRadius = BorderRadius.circular(7.0);
  }
}

// 🛑
class TabItemBackingDecoration extends BaseBackingDecoration {
  final tabItemDecorationVariants variant;

  TabItemBackingDecoration({required this.variant, required priority})
      : super(priority: priority) {
    //defining variants for the specific item
    if (variant == tabItemDecorationVariants.circle) {
      decorationCornerRadius = BorderRadius.circular(100);
    } else if (variant == tabItemDecorationVariants.roundedRectangle) {
      decorationShape = BoxShape.rectangle;
      decorationCornerRadius = BorderRadius.circular(30.0);
    }

    //defining variants for the specific priority
    if (priority == decorationPriority.inactive) {
      decorationFill = coloration.inactiveColor();
    }

    if (priority == decorationPriority.standard) {
      //defining variants for the specific mode

      if (foundation.brightness == Brightness.light) {
        decorationFill = foundation.lightModeFill();
        decorationBorder = foundation.lightModeBorder();
      } else if (foundation.brightness == Brightness.dark) {
        decorationFill = foundation.darkModeFill();
        decorationBorder = foundation.darkModeBorder();
      }
    }

    if (priority == decorationPriority.important) {
      //defining variants for the specific mode
      decorationBorder = foundation.universalBorder();

      if (foundation.brightness == Brightness.light) {
        decorationGradient = foundation.darkGradient();
        decorationHaze = foundation.darkShadow();
      } else if (foundation.brightness == Brightness.dark) {
        decorationGradient = foundation.lightGradient();
        decorationHaze = foundation.pastelShadow();
      }
    }
  }
}
