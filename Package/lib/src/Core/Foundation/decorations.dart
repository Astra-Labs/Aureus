import 'package:aureus/aureus.dart';

/* ------------------ DECORATIONS -------------------- */
/*

A set of classes that dynamically create BoxDecorations in accordance with the 
design system principles for each kind of interactivity.

Some classes have their own custom variants that further differentiate them. 
Every backing decoration inherits from the Parent - Base Backing Decoration. 

*/

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

class ButtonBackingDecoration extends BaseBackingDecoration {
  final buttonDecorationVariants variant;

  ButtonBackingDecoration({required this.variant, required priority})
      : super(priority: priority) {
    //defining variants for the specific item

    switch (variant) {
      // -- CIRCLE ( )
      case buttonDecorationVariants.circle:
        decorationCornerRadius = BorderRadius.circular(100);
        break;
      // -- ROUNDED PILL (-----)
      case buttonDecorationVariants.roundedPill:
        decorationCornerRadius = BorderRadius.circular(30);
        break;
      // -- ROUNDED RECTANGLE {-----}
      case buttonDecorationVariants.roundedRectangle:
        decorationCornerRadius = BorderRadius.circular(7);
        break;
      // -- EDGED RECTANGLE [-----]
      case buttonDecorationVariants.edgedRectangle:
        decorationCornerRadius = BorderRadius.circular(0);
        break;
    }

    switch (priority) {
      // when something is clickable, but not chosen
      case decorationPriority.inactive:
        {
          decorationFill = coloration.inactiveColor();
          return;
        }

      // when something is active, or chosen
      case decorationPriority.active:
        {
          decorationFill = coloration.contrastColor().withOpacity(0.4);
          decorationBorder = Border.all(
              color: coloration.contrastColor().withOpacity(0.8), width: 1);
          break;
        }

      // when something is standard, but neither inactive nor active.
      case decorationPriority.standard:
        {
          decorationFill = palette.brightness() == Brightness.light
              ? palette.lightModeFill()
              : palette.darkModeFill();
          decorationBorder = palette.brightness() == Brightness.light
              ? palette.lightModeBorder()
              : palette.darkModeBorder();
          break;
        }

      // Super important, needs highest UI CTA
      case decorationPriority.important:
        {
          decorationGradient = palette.brightness() == Brightness.light
              ? palette.darkGradient()
              : palette.lightGradient();
          decorationBorder = palette.universalBorder();
          break;
        }

      // item is inverted to have colors of the opposite mode.
      case decorationPriority.inverted:
        {
          decorationCornerRadius = BorderRadius.circular(20.0);
          decorationBorder = palette.universalBorder();

          decorationGradient = palette.brightness() == Brightness.light
              ? palette.lightGradient()
              : palette.darkGradient();
          decorationHaze = palette.brightness() == Brightness.light
              ? palette.darkShadow()
              : palette.lightShadow();
          break;
        }
    }
  }
}

class LayerBackingDecoration extends BaseBackingDecoration {
  LayerBackingDecoration({required priority}) : super(priority: priority) {
    decorationCornerRadius = BorderRadius.circular(10.0);
    //defining variants for the specific priority
    if (priority == decorationPriority.inactive ||
        priority == decorationPriority.standard) {
      //defining variants for the specific mode

      //layers do not show inactive colors because layers aren't interactable by definition, so one statement covers standard & inactive.
      if (palette.brightness() == Brightness.light) {
        decorationFill = palette.lightModeFill();
      } else if (palette.brightness() == Brightness.dark) {
        decorationFill = palette.darkModeFill();
      }
    } else if (priority == decorationPriority.important) {
      if (palette.brightness() == Brightness.light) {
        decorationGradient = palette.darkGradient();
        decorationBorder = palette.universalBorder();
        decorationHaze = palette.darkShadow();
      } else if (palette.brightness() == Brightness.dark) {
        decorationGradient = palette.lightGradient();
        decorationBorder = palette.universalBorder();
        decorationHaze = palette.pastelShadow();
      }
    }
  }
}

class CardBackingDecoration extends BaseBackingDecoration {
  CardBackingDecoration({required priority}) : super(priority: priority) {
    //defining variants for the specific priority
    if (priority == decorationPriority.inactive) {
      //defining variants for the specific mode
      decorationCornerRadius = BorderRadius.circular(10.0);
      decorationFill = coloration.inactiveColor().withOpacity(0.1);
    } else if (priority == decorationPriority.important) {
      decorationCornerRadius = BorderRadius.circular(20.0);
      decorationBorder = palette.universalBorder();
    } else if (priority == decorationPriority.standard) {
      //defining variants for the specific mode
      decorationFill = palette.brightness() == Brightness.light
          ? palette.lightModeFill()
          : palette.darkModeFill();
      decorationBorder = palette.brightness() == Brightness.light
          ? palette.lightModeBorder()
          : palette.darkModeBorder();
      decorationCornerRadius = BorderRadius.circular(20.0);
    } else if (priority == decorationPriority.inverted) {
      decorationCornerRadius = BorderRadius.circular(20.0);
      decorationBorder = palette.universalBorder();

      if (palette.brightness() == Brightness.light) {
        decorationGradient = palette.lightGradient();
        decorationHaze = palette.darkShadow();
      } else if (palette.brightness() == Brightness.dark) {
        decorationGradient = palette.darkGradient();
        decorationHaze = palette.darkShadow();
      }
    }
  }
}

class InputBackingDecoration extends BaseBackingDecoration {
  InputBackingDecoration() : super(priority: decorationPriority.standard) {
    decorationFill = palette.brightness() == Brightness.light
        ? palette.lightModeFill()
        : palette.darkModeFill();
    decorationBorder = palette.brightness() == Brightness.light
        ? palette.lightModeBorder()
        : palette.darkModeBorder();
    decorationCornerRadius = BorderRadius.circular(7.0);
  }
}

class TabItemBackingDecoration extends BaseBackingDecoration {
  final tabItemDecorationVariants variant;

  TabItemBackingDecoration({required this.variant, required priority})
      : super(priority: priority) {
    switch (variant) {
      case tabItemDecorationVariants.circle:
        {
          decorationCornerRadius = BorderRadius.circular(100);
          break;
        }
      case tabItemDecorationVariants.roundedRectangle:
        {
          decorationShape = BoxShape.rectangle;
          decorationCornerRadius = BorderRadius.circular(30.0);
          break;
        }
    }

    switch (priority) {
      case decorationPriority.standard:
        {
          decorationFill = palette.brightness() == Brightness.light
              ? palette.lightModeFill()
              : palette.darkModeFill();
          decorationBorder = palette.brightness() == Brightness.light
              ? palette.lightModeBorder()
              : palette.darkModeBorder();
          return;
        }
      case decorationPriority.important:
        {
          decorationBorder = palette.universalBorder();

          decorationGradient = palette.brightness() == Brightness.light
              ? palette.lightGradient()
              : palette.darkGradient();
          decorationHaze = palette.brightness() == Brightness.light
              ? palette.darkShadow()
              : palette.lightShadow();
          return;
        }
      case decorationPriority.inactive:
        {
          decorationFill = coloration.inactiveColor();
          return;
        }
      // Has no support for this priority in this element
      case decorationPriority.inverted:
        {
          return;
        }
      // Has no support for this priority in this element
      case decorationPriority.active:
        {
          return;
        }
    }
  }
}
