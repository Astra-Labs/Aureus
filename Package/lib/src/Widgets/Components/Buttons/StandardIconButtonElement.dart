import 'package:aureus/aureus.dart';

//A 80% width button that acts as a standard button for the UDS
//Doc Link:

class StandardIconButtonElement extends StatefulWidget {
  final decorationPriority decorationVariant;
  final String buttonTitle;
  final IconData buttonIcon;
  final VoidCallback buttonAction;

  const StandardIconButtonElement(
      {required this.decorationVariant,
      required this.buttonTitle,
      required this.buttonIcon,
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

    return InkWell(
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
                height: minimumButtonTextSize.height * 4,
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
                          ButtonTwoText(
                              widget.buttonTitle, widget.decorationVariant),
                          Icon(widget.buttonIcon,
                              color: coloration.decorationColor(
                                  decorationVariant: widget.decorationVariant),
                              semanticLabel: widget.buttonTitle,
                              size: 30.0)
                        ],
                      ),
                    )))),
          ),
        ));
  }
}
