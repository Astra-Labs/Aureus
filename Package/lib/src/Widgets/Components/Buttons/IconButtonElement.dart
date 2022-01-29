import 'package:aureus/aureus.dart';

//A small, circular button that uses an icon to communicate its' purpose
//Doc Link:

//big circular icon buttons that are greater than 70x70 and are intended to be the main action of the page (e.g: add, message, etc).
class PrimaryIconButtonElement extends StatefulWidget {
  final decorationPriority decorationVariant;
  final IconData buttonIcon;
  final String buttonTooltip;
  final VoidCallback buttonAction;

  const PrimaryIconButtonElement(
      {required this.decorationVariant,
      required this.buttonIcon,
      required this.buttonTooltip,
      required this.buttonAction});

  @override
  _PrimaryIconButtonElementState createState() =>
      _PrimaryIconButtonElementState();
}

class _PrimaryIconButtonElementState extends State<PrimaryIconButtonElement> {
  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled =
        widget.decorationVariant == decorationPriority.inactive ? false : true;
    BoxDecoration buttonBacking = ButtonBackingDecoration(
            variant: buttonDecorationVariants.circle,
            priority: widget.decorationVariant)
        .buildBacking();

    return InkWell(
        onTap: () {
          if (isButtonEnabled == true) {
            widget.buttonAction();
          }
        },
        child: FloatingContainerElement(
          child: SizedBox(
              width: 80.0,
              height: 80.0,
              child: Container(
                decoration: buttonBacking,
                child: Icon(widget.buttonIcon,
                    color: coloration.decorationColor(
                        decorationVariant: widget.decorationVariant),
                    semanticLabel: widget.buttonTooltip,
                    size: 65.0),
              )),
        ));
  }
}

//tiny babey icon buttons that are 60x60 or less.
class SecondaryIconButtonElement extends StatefulWidget {
  final decorationPriority decorationVariant;
  final IconData buttonIcon;
  final String buttonTooltip;
  final VoidCallback buttonAction;

  const SecondaryIconButtonElement(
      {required this.decorationVariant,
      required this.buttonIcon,
      required this.buttonTooltip,
      required this.buttonAction});

  @override
  _SecondaryIconButtonElementState createState() =>
      _SecondaryIconButtonElementState();
}

class _SecondaryIconButtonElementState extends State<SecondaryIconButtonElement>
    with AureusResourceObserver {
  final master = AureusResourceMaster();

  @override
  void initState() {
    master.registerObserver(_SecondaryIconButtonElementState());
    super.initState();
  }

  @override
  void dispose() {
    master.unregisterObserver(_SecondaryIconButtonElementState());
    super.dispose();
  }

  @override
  void updateEnvironment() {
    build(context);
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled =
        widget.decorationVariant == decorationPriority.inactive ? false : true;

    var buttonBackingDecoration = ButtonBackingDecoration(
        variant: buttonDecorationVariants.circle,
        priority: widget.decorationVariant);

    return InkWell(
        onTap: () {
          if (isButtonEnabled == true) {
            widget.buttonAction();
          }
        },
        child: SizedBox(
          width: 55.0,
          height: 55.0,
          child: Container(
            decoration: buttonBackingDecoration.buildBacking(),
            child: Icon(widget.buttonIcon,
                color: coloration.decorationColor(
                    decorationVariant: widget.decorationVariant),
                semanticLabel: widget.buttonTooltip,
                size: 35.0),
          ),
        ));
  }
}
