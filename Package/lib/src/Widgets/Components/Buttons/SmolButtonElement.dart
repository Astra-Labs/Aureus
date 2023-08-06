import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/*--------- SMOL BUTTON OWO ----------*/
/// A small, rounded tab button

class SmolButtonElement extends StatefulWidget {
  /// {@macro aureus.decorationPriority}
  final decorationPriority decorationVariant;

  /// The title of your button
  final String buttonTitle;

  /// What your button does. Used for tooltips / accessibility information.
  final String buttonHint;

  /// The action that your button completes.
  final VoidCallback buttonAction;

  const SmolButtonElement(
      {Key? key,
      required this.decorationVariant,
      required this.buttonTitle,
      required this.buttonHint,
      required this.buttonAction})
      : super(key: key);

  @override
  _SmolButtonElementState createState() => _SmolButtonElementState();
}

class _SmolButtonElementState extends State<SmolButtonElement> {
  @override
  void initState() {
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
    bool isButtonEnabled =
        widget.decorationVariant == decorationPriority.inactive ? false : true;

    BoxDecoration buttonDecoration = ButtonBackingDecoration(
            variant: buttonDecorationVariants.roundedPill,
            decorationVariant: widget.decorationVariant)
        .buildBacking();

    Size minimumButtonTextSize = Accessibility.textStringSize(
        textInput: widget.buttonTitle,
        textStyle: tag1(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    var smolButtonContent = ClipRect(
        child: FloatingContainerElement(
      child: Container(
          constraints: BoxConstraints(
              maxHeight: minimumButtonTextSize.height * 1.7,
              minWidth: minimumButtonTextSize.width * 1.5),
          decoration: buttonDecoration,
          child: Center(
              child: TagOneText(widget.buttonTitle, widget.decorationVariant))),
    ));

    var smolButtonInteractor = UniversalGestureDetector(
        node: FocusNode(),
        onDetect: () {
          if (isButtonEnabled == true) {
            createButtonInteraction();
            widget.buttonAction();
          }
        },
        child: smolButtonContent);

    return InteractiveSemanticsWrapper(
      properties: SemanticsWrapper.button(
          isEnabled: isButtonEnabled,
          label: widget.buttonTitle,
          hint: widget.buttonHint,
          isMutuallyExclusive: false),
      child: smolButtonInteractor,
    );
  }
}
