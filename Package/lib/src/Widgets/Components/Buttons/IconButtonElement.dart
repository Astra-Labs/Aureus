import 'package:aureus/aureus.dart';

//A small, circular button that uses an icon to communicate its' purpose
//Doc Link:

//big circular icon buttons that are greater than 70x70 and are intended to be the main action of the page (e.g: add, message, etc).
class PrimaryIconButtonElement extends StatefulWidget {
  final decorationPriority decorationVariant;
  final IconData buttonIcon;
  final String buttonHint;
  final VoidCallback buttonAction;

  const PrimaryIconButtonElement(
      {required this.decorationVariant,
      required this.buttonIcon,
      required this.buttonHint,
      required this.buttonAction});

  @override
  _PrimaryIconButtonElementState createState() =>
      _PrimaryIconButtonElementState();
}

class _PrimaryIconButtonElementState extends State<PrimaryIconButtonElement> {
  //Switches decoration to active, and then returns it to current variant.

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
    BoxDecoration buttonBacking = ButtonBackingDecoration(
            variant: buttonDecorationVariants.circle, priority: buttonPriority)
        .buildBacking();

    return Semantics.fromProperties(
      excludeSemantics: true,
      properties: SemanticsWrapper.button(
          isEnabled: isButtonEnabled,
          label: 'Icon Button',
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
            pulseWidth: 80.0,
            isActive: widget.decorationVariant == decorationPriority.important
                ? true
                : false,
            child: FloatingContainerElement(
              child: SizedBox(
                  width: 80.0,
                  height: 80.0,
                  child: Container(
                    decoration: buttonBacking,
                    child: Icon(widget.buttonIcon,
                        color: coloration.decorationColor(
                            decorationVariant: buttonPriority),
                        size: 65.0),
                  )),
            ),
          )),
    );
  }
}

//tiny babey icon buttons that are 60x60 or less.
// ignore: must_be_immutable
class SecondaryIconButtonElement extends StatefulWidget {
  final decorationPriority decorationVariant;
  final IconData buttonIcon;
  final String buttonHint;
  final VoidCallback buttonAction;
  bool isMutuallyExclusive;

  SecondaryIconButtonElement(
      {Key? key,
      required this.decorationVariant,
      required this.buttonIcon,
      required this.buttonHint,
      required this.buttonAction,
      this.isMutuallyExclusive = false})
      : super(key: key);

  @override
  _SecondaryIconButtonElementState createState() =>
      _SecondaryIconButtonElementState();
}

class _SecondaryIconButtonElementState
    extends State<SecondaryIconButtonElement> {
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

    return Semantics.fromProperties(
      excludeSemantics: true,
      properties: SemanticsWrapper.button(
          isEnabled: isButtonEnabled,
          label: 'Icon Button',
          hint: widget.buttonHint,
          isMutuallyExclusive: widget.isMutuallyExclusive),
      child: GestureDetector(
          onTap: () {
            if (isButtonEnabled == true) {
              widget.buttonAction();
            }
          },
          child: PulseShadowElement(
            pulseWidth: 50.0,
            isActive: widget.decorationVariant == decorationPriority.important
                ? true
                : false,
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: ButtonBackingDecoration(
                      variant: buttonDecorationVariants.circle,
                      priority: buttonPriority)
                  .buildBacking(),
              alignment: Alignment.center,
              child: Icon(widget.buttonIcon,
                  color: coloration.decorationColor(
                      decorationVariant: widget.decorationVariant),
                  size: 40.0),
            ),
          )),
    );
  }
}
