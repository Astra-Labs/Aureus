import 'package:aureus/aureus.dart';

//A small, rounded tab button
//Doc Link:

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

  late decorationPriority buttonPriority;

  @override
  void initState() {
    buttonPriority = widget.decorationVariant;
    super.initState();
  }

  void createButtonInteraction() {
    setState(() {
      buttonPriority = decorationPriority.active;
      sensation.createSensation(sensationType.press);
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        buttonPriority = widget.decorationVariant;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled =
        widget.decorationVariant == decorationPriority.inactive ? false : true;

    BoxDecoration buttonDecoration = ButtonBackingDecoration(
            variant: buttonDecorationVariants.roundedPill,
            priority: buttonPriority)
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
              child: Container(
                  constraints: BoxConstraints(
                      minHeight: minimumButtonTextSize.height * 1.8,
                      maxHeight: minimumButtonTextSize.height * 2,
                      maxWidth: minimumButtonTextSize.width * 2,
                      minWidth: minimumButtonTextSize.width * 2),
                  decoration: buttonDecoration,
                  child: Center(
                      child: TagOneText(
                          widget.buttonTitle, widget.decorationVariant))),
            ),
          )),
    );
  }
}
