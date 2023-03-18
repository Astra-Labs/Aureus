import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/*--------- STANDARD BUTTON ----------*/
/// A 80% width button that acts as a standard button

class StandardButtonElement extends StatefulWidget {
  /// {@macro aureus.decorationPriority}
  final decorationPriority decorationVariant;

  /// The title of your button
  final String buttonTitle;

  /// What your button does. Used for tooltips / accessibility information.
  final String buttonHint;

  /// The action that your button completes.
  final VoidCallback buttonAction;

  const StandardButtonElement(
      {required this.decorationVariant,
      required this.buttonTitle,
      required this.buttonHint,
      required this.buttonAction});

  @override
  _StandardButtonElementState createState() => _StandardButtonElementState();
}

class _StandardButtonElementState extends State<StandardButtonElement> {
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
    setState(() {
      buttonPriority = decorationPriority.active;
      sensation.createSensation(sensationType.press);
    });
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

    var screenSize = size.logicalScreenSize();

    var standardButtonContent = ClipRect(
      child: FloatingContainerElement(
        child: SizedBox(
          width: size.layoutItemWidth(1, screenSize),
          height: minimumButtonTextSize.height + 45,
          child: Container(
            decoration: buttonDecoration,
            child: Center(
              child:
                  ButtonTwoText(widget.buttonTitle, widget.decorationVariant),
            ),
          ),
        ),
      ),
    );

    var standardButtonInteractor = GestureDetector(
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
          child: standardButtonContent,
        ));

    return Semantics.fromProperties(
      properties: SemanticsWrapper.button(
          isEnabled: isButtonEnabled,
          label: widget.buttonTitle,
          hint: widget.buttonHint,
          isMutuallyExclusive: false),
      child: standardButtonInteractor,
    );
  }
}
