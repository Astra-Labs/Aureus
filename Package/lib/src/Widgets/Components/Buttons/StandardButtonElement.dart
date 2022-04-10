import 'package:aureus/aureus.dart';

//A 80% width button that acts as a standard button for the UDS
//Doc Link:

class StandardButtonElement extends StatefulWidget {
  final decorationPriority decorationVariant;
  final String buttonTitle;
  final String buttonHint;
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
    super.initState();
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
            priority: buttonPriority)
        .buildBacking();

    bool isButtonEnabled =
        widget.decorationVariant == decorationPriority.inactive ? false : true;

    Size minimumButtonTextSize = Accessibility.textStringSize(
        textInput: widget.buttonTitle,
        textStyle: button2(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    var screenSize = size.logicalScreenSize();

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
            pulseWidth: size.layoutItemWidth(1, screenSize),
            isActive: widget.decorationVariant == decorationPriority.important
                ? true
                : false,
            child: FloatingContainerElement(
              child: SizedBox(
                  width: size.layoutItemWidth(1, screenSize),
                  height: minimumButtonTextSize.height + 45,
                  child: Container(
                      decoration: buttonDecoration,
                      child: Center(
                          child: ButtonTwoText(
                              widget.buttonTitle, widget.decorationVariant)))),
            ),
          )),
    );
  }
}
