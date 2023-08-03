import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/*--------- STANDARD ICON BUTTON ----------*/
/// A 80% width button that acts as a standard button for the UDS
/// This version comes with an icon!

class StandardIconButtonElement extends StatefulWidget {
  /// {@macro aureus.decorationPriority}
  final decorationPriority decorationVariant;

  /// The title of your button
  final String buttonTitle;

  /// An icon to visually describe the button
  final IconData buttonIcon;

  /// What your button does. Used for tooltips / accessibility information.
  final String buttonHint;

  /// The action that your button completes.
  final VoidCallback buttonAction;

  const StandardIconButtonElement(
      {required this.decorationVariant,
      required this.buttonTitle,
      required this.buttonIcon,
      required this.buttonHint,
      required this.buttonAction});

  @override
  _StandardIconButtonElementState createState() =>
      _StandardIconButtonElementState();
}

class _StandardIconButtonElementState extends State<StandardIconButtonElement> {
  late decorationPriority buttonPriority;

  @override
  void initState() {
    buttonPriority = widget.decorationVariant;
    sensation.prepare();
    super.initState();
  }

  @override
  void dispose() {
    sensation.dispose();
    super.dispose();
  }

  void createButtonInteraction() {
    sensation.createSensation(sensationType.press);
  }

  @override
  Widget build(BuildContext context) {
    BoxDecoration buttonDecoration = ButtonBackingDecoration(
            variant: buttonDecorationVariants.roundedRectangle,
            decorationVariant: buttonPriority)
        .buildBacking();

    bool isButtonEnabled =
        widget.decorationVariant == decorationPriority.inactive ? false : true;

    Size minimumButtonTextSize = Accessibility.textStringSize(
        textInput: widget.buttonTitle,
        textStyle: button2(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    var screenSize = MediaQuery.of(context).size;

    var standardIconButtonContent = FloatingContainerElement(
      child: SizedBox(
          width: size.layoutItemWidth(1, screenSize),
          height: minimumButtonTextSize.height + 45,
          child: Container(
              decoration: buttonDecoration,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ButtonTwoText(widget.buttonTitle, widget.decorationVariant),
                    Icon(widget.buttonIcon,
                        color: coloration.decorationColor(
                            decorationVariant: widget.decorationVariant),
                        semanticLabel: widget.buttonTitle,
                        size: 30.0)
                  ],
                ),
              )))),
    );

    var standardIconButtonInteractor = GestureDetector(
        onTap: () {
          if (isButtonEnabled == true) {
            createButtonInteraction();
            widget.buttonAction();
          }
        },
        child: PulseShadowElement(
          pulseWidth: size.layoutItemWidth(1, screenSize),
          isActive: widget.decorationVariant == decorationPriority.important
              ? true
              : false,
          child: standardIconButtonContent,
        ));

    return InteractiveSemanticsWrapper(
      properties: SemanticsWrapper.button(
          isEnabled: isButtonEnabled,
          label: widget.buttonTitle,
          hint: widget.buttonHint,
          isMutuallyExclusive: false),
      child: standardIconButtonInteractor,
    );
  }
}
