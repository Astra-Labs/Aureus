import 'package:aureus/aureus.dart';

/*--------- SMOL BUTTON OWO ----------*/
//A small, rounded tab button

class SmolButtonElement extends StatefulWidget {
  final decorationPriority decorationVariant;
  // The current decoration priority of the button.
  // ------------------------------

  final String buttonTitle;
  // The title of your button
  // ------------------------------

  final String buttonHint;
  // What your button does. Used for tooltips / accessibility information.
  // ------------------------------

  final VoidCallback buttonAction;
  // The action that your button completes.
  // ------------------------------

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
    setState(() {
      sensation.createSensation(sensationType.press);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled =
        widget.decorationVariant == decorationPriority.inactive ? false : true;

    BoxDecoration buttonDecoration = ButtonBackingDecoration(
            variant: buttonDecorationVariants.roundedPill,
            priority: widget.decorationVariant)
        .buildBacking();

    Size minimumButtonTextSize = Accessibility.textStringSize(
        textInput: widget.buttonTitle,
        textStyle: tag1(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    var smolButtonContent = FloatingContainerElement(
      child: Container(
          constraints: BoxConstraints(
              minHeight: minimumButtonTextSize.height + 20,
              maxHeight: minimumButtonTextSize.height + 20,
              maxWidth: minimumButtonTextSize.width + 30,
              minWidth: minimumButtonTextSize.width + 30),
          decoration: buttonDecoration,
          child: Center(
              child: TagOneText(widget.buttonTitle, widget.decorationVariant))),
    );

    var smolButtonInteractor = GestureDetector(
        onTap: () {
          if (isButtonEnabled == true) {
            createButtonInteraction();
            widget.buttonAction();
          }
        },
        child: smolButtonContent);

    return Semantics.fromProperties(
      properties: SemanticsWrapper.button(
          isEnabled: isButtonEnabled,
          label: widget.buttonTitle,
          hint: widget.buttonHint,
          isMutuallyExclusive: false),
      child: smolButtonInteractor,
    );
  }
}
