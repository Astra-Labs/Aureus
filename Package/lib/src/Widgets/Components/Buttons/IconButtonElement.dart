import 'package:aureus/aureus.dart';

/*--------- ICON BUTTON ----------*/
//A small, circular button that uses an icon to communicate its' purpose
//big circular icon buttons that are greater than 70x70 and are intended
//to be the main action of the page (e.g: add, message, etc).

class IconButtonElement extends StatefulWidget {
  final decorationPriority decorationVariant;
  // The current decoration priority of the button.
  // ------------------------------

  final IconData buttonIcon;
  // An icon to visually describe the button
  // ------------------------------

  final String buttonHint;
  // What your button does. Used for tooltips / accessibility information.
  // ------------------------------

  final VoidCallback buttonAction;
  // The action that your button completes.
  // ------------------------------

  final buttonSize buttonPriority;
  // The size of your button. Primary means ONLY cta, secondary means multiple CTAs
  // ------------------------------

  const IconButtonElement(
      {required this.decorationVariant,
      required this.buttonIcon,
      required this.buttonHint,
      required this.buttonAction,
      required this.buttonPriority});

  @override
  _IconButtonElementState createState() => _IconButtonElementState();
}

class _IconButtonElementState extends State<IconButtonElement> {
  //Switches decoration to active, and then returns it to current variant.

  late decorationPriority buttonPriority;

  @override
  void initState() {
    buttonPriority = widget.decorationVariant;
    sensation.prepare();
    super.initState();
  }

  void createButtonInteraction() {
    setState(() {
      buttonPriority = decorationPriority.active;
      sensation.createSensation(sensationType.press);
    });
  }

  @override
  void dispose() {
    sensation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled =
        widget.decorationVariant == decorationPriority.inactive ? false : true;

    BoxDecoration buttonBacking = ButtonBackingDecoration(
            variant: buttonDecorationVariants.circle, priority: buttonPriority)
        .buildBacking();

    var buttonScale =
        (widget.buttonPriority == buttonSize.primary ? 80.0 : 45.0);

    var iconButtonElementContent = FloatingContainerElement(
      child: SizedBox(
          width: buttonScale,
          height: buttonScale,
          child: Container(
            decoration: buttonBacking,
            child: Icon(widget.buttonIcon,
                color: coloration.decorationColor(
                    decorationVariant: buttonPriority),
                size: (buttonScale - 15)),
          )),
    );

    var iconButtonElementInteractor = GestureDetector(
        onTap: () {
          if (isButtonEnabled == true) {
            createButtonInteraction();
            widget.buttonAction();
          }
        },
        child: PulseShadowElement(
          pulseWidth: buttonScale,
          isActive: widget.decorationVariant == decorationPriority.important
              ? true
              : false,
          child: iconButtonElementContent,
        ));

    return Semantics.fromProperties(
      excludeSemantics: true,
      properties: SemanticsWrapper.button(
          isEnabled: isButtonEnabled,
          label: 'Icon Button',
          hint: widget.buttonHint,
          isMutuallyExclusive: false),
      child: iconButtonElementInteractor,
    );
  }
}
