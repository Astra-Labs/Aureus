import 'package:aureus/aureus.dart';

//A small, rounded tab button

class SmolButtonElement extends StatefulWidget {
  final decorationPriority decorationVariant;
  final String buttonTitle;
  final String buttonHint;
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

    return Semantics.fromProperties(
      properties: SemanticsWrapper.button(
          isEnabled: isButtonEnabled,
          label: widget.buttonTitle,
          hint: widget.buttonHint,
          isMutuallyExclusive: false),
      child: GestureDetector(
          onTap: () {
            if (isButtonEnabled == true) {
              createButtonInteraction();
              widget.buttonAction();
            }
          },
          child: PulseShadowElement(
            pulseWidth: minimumButtonTextSize.width + 50,
            isActive: widget.decorationVariant == decorationPriority.important
                ? true
                : false,
            child: FloatingContainerElement(
              child: Container(
                  constraints: BoxConstraints(
                      minHeight: minimumButtonTextSize.height + 20,
                      maxHeight: minimumButtonTextSize.height + 20,
                      maxWidth: minimumButtonTextSize.width + 30,
                      minWidth: minimumButtonTextSize.width + 30),
                  decoration: buttonDecoration,
                  child: Center(
                      child: TagOneText(
                          widget.buttonTitle, widget.decorationVariant))),
            ),
          )),
    );
  }
}
