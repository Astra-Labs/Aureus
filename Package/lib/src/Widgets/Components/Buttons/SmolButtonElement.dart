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
  BoxDecoration animatedBacking = const BoxDecoration();

  var scale = 1.0;
  var duration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
  }

  void createButtonInteraction() {
    setState(() {
      scale = 1.5;
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
            pulseWidth: minimumButtonTextSize.width * 2,
            isActive: widget.decorationVariant == decorationPriority.important
                ? true
                : false,
            child: FloatingContainerElement(
              child: AnimatedScale(
                scale: scale,
                duration: duration,
                child: Container(
                    constraints: BoxConstraints(
                        minHeight: minimumButtonTextSize.height + 10,
                        maxHeight: minimumButtonTextSize.height + 10,
                        maxWidth: minimumButtonTextSize.width + 20,
                        minWidth: minimumButtonTextSize.width + 20),
                    decoration: buttonDecoration,
                    child: Center(
                        child: TagOneText(
                            widget.buttonTitle, widget.decorationVariant))),
              ),
            ),
          )),
    );
  }
}
