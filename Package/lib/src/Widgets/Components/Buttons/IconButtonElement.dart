import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/// A small, circular button that uses an icon to communicate its' purpose
/// big circular icon buttons that are greater than 70x70 and are intended
/// to be the main action of the page (e.g: add, message, etc).

class IconButtonElement extends StatefulWidget {
  /// {@macro aureus.decorationPriority}
  final decorationPriority decorationVariant;

  /// An icon to visually describe the button
  final IconData buttonIcon;

  /// What your button does. Used for tooltips / accessibility information.
  final String buttonHint;

  /// The action that your button completes.
  final VoidCallback buttonAction;

  /// The size of your button. Primary means ONLY cta, secondary means multiple CTAs
  final buttonSize buttonPriority;

  const IconButtonElement(
      {required this.decorationVariant,
      required this.buttonIcon,
      required this.buttonHint,
      required this.buttonAction,
      required this.buttonPriority});

  @override
  _IconButtonElementState createState() => _IconButtonElementState();
}

class _IconButtonElementState extends State<IconButtonElement> {
  //Switches decoration to active, and then returns it to current variant.

  late decorationPriority buttonPriority;

  @override
  void initState() {
    buttonPriority = widget.decorationVariant;
    sensation.prepare();
    super.initState();
  }

  void createButtonInteraction() {
    //sensation.createSensation(sensationType.press);
  }

  @override
  void dispose() {
    sensation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled =
        widget.decorationVariant == decorationPriority.inactive ? false : true;

    BoxDecoration buttonBacking = ButtonBackingDecoration(
            variant: buttonDecorationVariants.circle,
            decorationVariant: buttonPriority)
        .buildBacking();

    var buttonScale = 0.0;

    switch (widget.buttonPriority) {
      case buttonSize.primary:
        {
          buttonScale = 70.0;
          break;
        }
      case buttonSize.secondary:
        {
          buttonScale = 43.0;
          break;
        }
      case buttonSize.smolBaby:
        {
          buttonScale = 35.0;
          break;
        }
    }

    var iconButtonElementContent = ClipRect(
        child: FloatingContainerElement(
      child: SizedBox(
          width: buttonScale,
          height: buttonScale,
          child: Container(
            decoration: buttonBacking,
            child: Icon(widget.buttonIcon,
                color: coloration.decorationColor(
                    decorationVariant: buttonPriority),
                size: (buttonScale - 15)),
          )),
    ));

    var iconButtonElementInteractor = UniversalGestureDetector(
        onDetect: () {
          if (isButtonEnabled == true) {
            createButtonInteraction();
            widget.buttonAction();
          }
        },
        child: PulseShadowElement(
          pulseWidth: buttonScale,
          isActive: widget.decorationVariant == decorationPriority.important
              ? true
              : false,
          child: iconButtonElementContent,
        ));

    return InteractiveSemanticsWrapper(
      properties: SemanticsWrapper.button(
          isEnabled: isButtonEnabled,
          label: 'Icon Button',
          hint: widget.buttonHint,
          isMutuallyExclusive: false),
      child: iconButtonElementInteractor,
    );
  }
}
