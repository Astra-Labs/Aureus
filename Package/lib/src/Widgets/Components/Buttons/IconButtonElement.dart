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
  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled =
        widget.decorationVariant == decorationPriority.inactive ? false : true;
    BoxDecoration buttonBacking = ButtonBackingDecoration(
            variant: buttonDecorationVariants.circle,
            priority: widget.decorationVariant)
        .buildBacking();

    return Semantics.fromProperties(
      excludeSemantics: true,
      properties: SemanticsWrapper.button(
          isEnabled: isButtonEnabled,
          label: 'Icon Button',
          hint: widget.buttonHint,
          isMutuallyExclusive: false),
      child: InkWell(
          highlightColor: coloration.accentColor(),
          splashColor: coloration.contrastColor(),
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
                      size: 65.0),
                )),
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
  BoxDecoration animatedBacking = const BoxDecoration();

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
      child: InkWell(
          onTap: () {
            if (isButtonEnabled == true) {
              print('Inkwell is working owo');
              widget.buttonAction();

              setState(() {
                animatedBacking = BoxDecoration(
                    color: coloration.accentColor(),
                    borderRadius: BorderRadius.circular(100));
              });
            }
          },
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceIn,
              /*foregroundDecoration: animatedBacking,*/
              decoration: ButtonBackingDecoration(
                      variant: buttonDecorationVariants.circle,
                      priority: widget.decorationVariant)
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
