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
      child: InkWell(
          highlightColor: coloration.accentColor(),
          splashColor: coloration.contrastColor(),
          onTap: () {
            if (isButtonEnabled == true) {
              widget.buttonAction();
              setState(() {
                animatedBacking =
                    BoxDecoration(color: coloration.accentColor());
              });
            }
          },
          child: FloatingContainerElement(
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.bounceIn,
                constraints: BoxConstraints(
                    minHeight: minimumButtonTextSize.height * 1.8,
                    maxHeight: minimumButtonTextSize.height * 2,
                    maxWidth: minimumButtonTextSize.width * 2,
                    minWidth: minimumButtonTextSize.width * 2),
                decoration: buttonDecoration,
                /*foregroundDecoration: animatedBacking,*/
                child: Center(
                    child: TagOneText(
                        widget.buttonTitle, widget.decorationVariant))),
          )),
    );
  }
}
