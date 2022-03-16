import 'package:aureus/aureus.dart';

//A full width button that acts as the main CTA
//Doc Link:

class FullWidthButtonElement extends StatefulWidget {
  final String buttonTitle;
  final String buttonHint;
  final decorationPriority currentVariant;
  final VoidCallback buttonAction;

  const FullWidthButtonElement(
      {required this.buttonTitle,
      required this.buttonHint,
      required this.currentVariant,
      required this.buttonAction});

  @override
  _FullWidthButtonElementState createState() => _FullWidthButtonElementState();
}

class _FullWidthButtonElementState extends State<FullWidthButtonElement> {
  BoxDecoration animatedBacking = const BoxDecoration();

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled =
        widget.currentVariant == decorationPriority.inactive ? false : true;
    //variables that change how the variants are displayed in build time
    BoxDecoration buttonDecoration = ButtonBackingDecoration(
            variant: buttonDecorationVariants.edgedRectangle,
            priority: widget.currentVariant)
        .buildBacking();

    var screenWidth = size.logicalWidth();

    Size minimumButtonTextSize = Accessibility.textStringSize(
        textInput: widget.buttonTitle,
        textStyle: button1(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    return Semantics.fromProperties(
      properties: SemanticsWrapper.button(
          isEnabled: isButtonEnabled,
          label: widget.buttonTitle,
          hint: widget.buttonHint,
          isMutuallyExclusive: false),
      child: InkWell(
          onTap: () {
            if (isButtonEnabled == true) {
              widget.buttonAction();
              setState(() {
                animatedBacking =
                    BoxDecoration(color: coloration.accentColor());
              });
            }
          },
          child: AnimatedContainer(
              constraints: BoxConstraints(
                minHeight: minimumButtonTextSize.height * 4,
                maxHeight: minimumButtonTextSize.height * 4,
                minWidth: screenWidth,
              ),
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceIn,
              /*foregroundDecoration: animatedBacking,*/
              decoration: buttonDecoration,
              child: Center(
                  child: ButtonOneText(
                      widget.buttonTitle, widget.currentVariant)))),
    );
  }
}
