import 'package:aureus/aureus.dart';
import 'dart:ui';
import 'package:flutter/scheduler.dart';

//All Variables for the UDS Elements
//Doc Link:

var size = Sizing();
late Aureus apiVariables;

/* ------------------ GLOBAL VARIABLES -------------------- */
// 🛑

class Aureus {
  Color? prodColor = lavender();
  String? prodName = 'Aureus';
  Safety? safetyPlan = Safety(
      frequencyUsage: SafetyPlanFrequency.singleUse,
      productEligiblePlanOptions: []);
  Image? darkFluidImage = Image.network(
      'https://github.com/Astra-Labs/Aureus/blob/Amanda-Stable/Package/lib/assets/Dark%20Fluid%20-%20Portrait.png?raw=true');
  Image? lightFluidImage = Image.network(
      'https://github.com/Astra-Labs/Aureus/blob/Amanda-Stable/Package/lib/assets/Light%20Fluid%20-%20Portrait.png?raw=true');
  Image? darkBlurImage = Image.network(
      'https://github.com/Astra-Labs/Aureus/blob/Amanda-Stable/Package/lib/assets/Dark%20Blur%20-%20Portrait.png?raw=true');
  Image? lightBlurImage = Image.network(
      'https://github.com/Astra-Labs/Aureus/blob/Amanda-Stable/Package/lib/assets/Light%20Blur%20-%20Portrait.png?raw=true');
  Image? lightLogo = Image.network(
      'https://github.com/Astra-Labs/Aureus/blob/Amanda-Stable/Package/lib/assets/Icon%20-%20Dark%20Mode.png?raw=true');
  Image? darkLogo = Image.network(
      'https://github.com/Astra-Labs/Aureus/blob/Amanda-Stable/Package/lib/assets/Icon%20-%20Light%20Mode.png?raw=true');

  Aureus(
      {required this.prodColor,
      required this.prodName,
      required this.safetyPlan,
      required this.darkFluidImage,
      required this.lightFluidImage,
      required this.darkBlurImage,
      required this.lightBlurImage,
      required this.lightLogo,
      required this.darkLogo});
}

Brightness brightness() {
  return SchedulerBinding.instance!.window.platformBrightness;
}

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
  return black().withOpacity(0.07);
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
      fontSize: size.responsiveTextSize(26),
      fontWeight: FontWeight.w200,
      letterSpacing: 0.4);
}

TextStyle heading2() {
  return GoogleFonts.exo(
    fontSize: size.responsiveTextSize(21),
    fontWeight: FontWeight.w300,
    letterSpacing: 1.2,
  );
}

TextStyle heading3() {
  return GoogleFonts.exo(
      fontSize: size.responsiveTextSize(17),
      fontWeight: FontWeight.w500,
      letterSpacing: 1.0);
}

TextStyle heading4() {
  return GoogleFonts.exo(
      fontSize: size.responsiveTextSize(14),
      fontWeight: FontWeight.w600,
      letterSpacing: 1.0);
}

TextStyle subheading() {
  return GoogleFonts.exo(
      fontSize: size.responsiveTextSize(17),
      fontWeight: FontWeight.w300,
      letterSpacing: 0.4);
}

TextStyle body1() {
  return GoogleFonts.exo(
      fontSize: size.responsiveTextSize(14),
      fontWeight: FontWeight.w200,
      letterSpacing: 0.4);
}

TextStyle body2() {
  return GoogleFonts.exo(
      fontSize: size.responsiveTextSize(14),
      fontWeight: FontWeight.w300,
      letterSpacing: 0.4);
}

TextStyle button1() {
  return GoogleFonts.exo(
      fontSize: size.responsiveTextSize(17),
      fontWeight: FontWeight.w600,
      letterSpacing: 1.0);
}

TextStyle button2() {
  return GoogleFonts.exo(
      fontSize: size.responsiveTextSize(12),
      fontWeight: FontWeight.w400,
      letterSpacing: 1.0);
}

TextStyle tag1() {
  return GoogleFonts.exo(
      fontSize: size.responsiveTextSize(12),
      fontWeight: FontWeight.w600,
      letterSpacing: 1.5);
}

TextStyle tag2() {
  return GoogleFonts.exo(
      fontSize: size.responsiveTextSize(12),
      fontWeight: FontWeight.w400,
      letterSpacing: 1.0);
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
            style: heading1().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)));
}

class HeadingTwoText extends Text {
  HeadingTwoText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: heading2().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)));
}

class HeadingThreeText extends Text {
  HeadingThreeText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: heading3().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)));
}

class HeadingFourText extends Text {
  HeadingFourText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: heading4().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)));
}

class SubheaderText extends Text {
  SubheaderText(String data, decorationPriority textColor)
      : super(TitleCase.convertToTitleCase(data),
            style: subheading().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)));
}

class BodyOneText extends Text {
  BodyOneText(String data, decorationPriority textColor)
      : super(data,
            style: body1().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)));
}

class BodyTwoText extends Text {
  BodyTwoText(String data, decorationPriority textColor)
      : super(data,
            style: body2().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)));
}

class ButtonOneText extends Text {
  ButtonOneText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: button1().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)));
}

class ButtonTwoText extends Text {
  ButtonTwoText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: button2().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)));
}

class TagOneText extends Text {
  TagOneText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: tag1().copyWith(
                color:
                    coloration.decorationColor(decorationVariant: textColor)));
}

class TagTwoText extends Text {
  TagTwoText(String data, decorationPriority textColor)
      : super(data.toUpperCase(),
            style: tag2().copyWith(
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

  bool isDesktopDisplay() {
    if (logicalScreenSize.width >= logicalScreenSize.height) {
      return false;
    } else if (logicalScreenSize.width < logicalScreenSize.height) {
      return true;
    }

    throw ('oi a fucky wucky happened');
  }

  double responsiveTextSize(double base) {
    //creates a text scale factor to adjust for size differences between mobile, tablet, and web.

    double scaleFactor = 0.0;
    double shortSide = logicalScreenSize.shortestSide;

    if (shortSide < 550) {
      //needs mobile phone scale
      scaleFactor = 1.0;
    } else if (shortSide >= 550 && shortSide < 900) {
      //needs tablet scale
      scaleFactor = 1.15;
    } else if (shortSide >= 900) {
      //needs web phone scale
      scaleFactor = 1.30;
    }

    return scaleFactor * base;
  }

//Creates universal padding for all items based on the screen size.
  EdgeInsets universalPadding() {
    return EdgeInsets.fromLTRB(20, 10, 20, 10);
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

  //returns a maximum width accounting for padding, given how many rows, and depending on device type.
  double layoutItemWidth(int sections, Size area) {
    double sizingWidth = 0.0;

    if (sections == 1) {
      //item needs to be full width with w1 padding

      isDesktopDisplay()
          ? sizingWidth = area.width * 0.90
          : sizingWidth = area.width * 0.60;
    } else if (sections == 2) {
      //item needs to be 1/2 width for 2 sections

      isDesktopDisplay()
          ? sizingWidth = area.width * 0.45
          : sizingWidth = area.width * 0.30;
    } else if (sections == 3) {
      //item needs to be 1/3 width for 3 sections
      isDesktopDisplay()
          ? sizingWidth = area.width * 0.33
          : sizingWidth = area.width * 0.12;
    } else if (sections == 4) {
      //item needs to be 1/4 width for 4 sections
      isDesktopDisplay()
          ? (sizingWidth = area.width * 0.24)
          : (sizingWidth = area.width * 0.092);
    } else if (sections == 5) {
      //item needs to be 1/5 width for 5 sections
      isDesktopDisplay()
          ? (sizingWidth = area.width * 0.21)
          : (sizingWidth = area.width * 0.080);
    }
    return sizingWidth;
  }

  //returns a maximum width accounting for padding, given how many rows, and depending on device type.
  double layoutItemHeight(int sections, Size area) {
    double sizingHeight = 0.0;

    if (sections == 1) {
      //item needs to be full height with w1 padding

      isDesktopDisplay()
          ? sizingHeight = area.height * 0.89
          : sizingHeight = area.height * 0.806;
    } else if (sections == 2) {
      //item needs to be 1/2 height for 2 sections

      isDesktopDisplay()
          ? sizingHeight = area.height * 0.43
          : sizingHeight = area.height * 0.397;
    } else if (sections == 3) {
      //item needs to be 1/3 height for 3 sections
      isDesktopDisplay()
          ? sizingHeight = area.height * 0.287
          : sizingHeight = area.height * 0.264;
    } else if (sections == 4) {
      //item needs to be 1/4 height for 4 sections
      isDesktopDisplay()
          ? sizingHeight = area.height * 0.216
          : sizingHeight = area.height * 0.195;
    } else if (sections == 5) {
      //item needs to be 1/5 height for 5 sections
      isDesktopDisplay()
          ? sizingHeight = area.height * 0.168
          : sizingHeight = area.height * 0.155;
    } else if (sections <= 6) {
      //item needs to be 1/5 height for 5 sections

      isDesktopDisplay()
          ? sizingHeight = area.height * 0.100
          : sizingHeight = area.height * 0.097;
    }

    return sizingHeight;
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
      if (brightness() == Brightness.light) {
        decorationGradient = darkGradient();
        decorationBorder = universalBorder();
      } else if (brightness() == Brightness.dark) {
        decorationGradient = lightGradient();
        decorationBorder = universalBorder();
      }
    } else if (priority == decorationPriority.standard) {
      //defining variants for the specific mode
      if (brightness() == Brightness.light) {
        decorationFill = lightModeFill();
        decorationBorder = lightModeBorder();
      } else if (brightness() == Brightness.dark) {
        decorationFill = darkModeFill();
        decorationBorder = darkModeBorder();
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
      if (brightness() == Brightness.light) {
        decorationFill = lightModeFill();
      } else if (brightness() == Brightness.dark) {
        decorationFill = darkModeFill();
      }
    } else if (priority == decorationPriority.important) {
      if (brightness() == Brightness.light) {
        decorationGradient = darkGradient();
        decorationBorder = universalBorder();
        decorationHaze = darkShadow();
      } else if (brightness() == Brightness.dark) {
        decorationGradient = lightGradient();
        decorationBorder = universalBorder();
        decorationHaze = pastelShadow();
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

      decorationCornerRadius = BorderRadius.circular(10.0);
      decorationFill = coloration.inactiveColor();
    } else if (priority == decorationPriority.important) {
      decorationCornerRadius = BorderRadius.circular(20.0);
      decorationBorder = universalBorder();

      if (brightness() == Brightness.light) {
        decorationGradient = darkGradient();
        decorationHaze = lightShadow();
      } else if (brightness() == Brightness.dark) {
        decorationGradient = lightGradient();
        decorationHaze = lightShadow();
      }
    } else if (priority == decorationPriority.standard) {
      //defining variants for the specific mode
      decorationCornerRadius = BorderRadius.circular(20.0);
      if (brightness() == Brightness.light) {
        decorationFill = lightModeFill();
        decorationBorder = lightModeBorder();
      } else if (brightness() == Brightness.dark) {
        decorationFill = darkModeFill();
        decorationBorder = darkModeBorder();
      }
    }
  }
}

// 🛑
class InputBackingDecoration extends BaseBackingDecoration {
  InputBackingDecoration() : super(priority: decorationPriority.standard) {
    //defining variants for the specific mode
    if (brightness() == Brightness.light) {
      decorationFill = lightModeFill();
      decorationBorder = lightModeBorder();
    } else if (brightness() == Brightness.dark) {
      decorationFill = darkModeFill();
      decorationBorder = darkModeBorder();
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

      if (brightness() == Brightness.light) {
        decorationFill = lightModeFill();
        decorationBorder = lightModeBorder();
      } else if (brightness() == Brightness.dark) {
        decorationFill = darkModeFill();
        decorationBorder = darkModeBorder();
      }
    }

    if (priority == decorationPriority.important) {
      //defining variants for the specific mode
      decorationBorder = universalBorder();

      if (brightness() == Brightness.light) {
        decorationGradient = darkGradient();
        decorationHaze = darkShadow();
      } else if (brightness() == Brightness.dark) {
        decorationGradient = lightGradient();
        decorationHaze = pastelShadow();
      }
    }
  }
}
