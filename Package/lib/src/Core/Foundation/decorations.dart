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
      } else if (priority == decorationPriority.inverted) {
        decorationCornerRadius = BorderRadius.circular(20.0);
        decorationBorder = universalBorder();

        if (brightness() == Brightness.light) {
          decorationGradient = lightGradient();
          decorationHaze = darkShadow();
        } else if (brightness() == Brightness.dark) {
          decorationGradient = darkGradient();
          decorationHaze = darkShadow();
        }
      } else if (priority == decorationPriority.active) {
        decorationFill = coloration.contrastColor().withOpacity(0.4);
        decorationBorder = Border.all(
            color: coloration.contrastColor().withOpacity(0.8), width: 1);
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

class CardBackingDecoration extends BaseBackingDecoration {
  CardBackingDecoration({required priority}) : super(priority: priority) {
    //defining variants for the specific priority
    if (priority == decorationPriority.inactive) {
      //defining variants for the specific mode

      decorationCornerRadius = BorderRadius.circular(10.0);
      decorationFill = coloration.inactiveColor().withOpacity(0.1);
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
    } else if (priority == decorationPriority.inverted) {
      decorationCornerRadius = BorderRadius.circular(20.0);
      decorationBorder = universalBorder();

      if (brightness() == Brightness.light) {
        decorationGradient = lightGradient();
        decorationHaze = darkShadow();
      } else if (brightness() == Brightness.dark) {
        decorationGradient = darkGradient();
        decorationHaze = darkShadow();
      }
    }
  }
}

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
