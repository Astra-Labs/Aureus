import 'package:aureus/aureus.dart';

//A full width button that acts as the main CTA
//Doc Link:

class FullWidthButtonElement extends StatefulWidget {
  final String buttonTitle;
  final decorationPriority currentVariant;
  final VoidCallback buttonAction;

  const FullWidthButtonElement(
      {required this.buttonTitle,
      required this.currentVariant,
      required this.buttonAction});

  @override
  _FullWidthButtonElementState createState() => _FullWidthButtonElementState();
}

class _FullWidthButtonElementState extends State<FullWidthButtonElement> {
  BoxDecoration animatedBacking = BoxDecoration();

  @override
  Widget build(BuildContext context) {
    //variables that change how the variants are displayed in build time
    BoxDecoration buttonDecoration = ButtonBackingDecoration(
            variant: buttonDecorationVariants.edgedRectangle,
            priority: widget.currentVariant)
        .buildBacking();

    var screenWidth = size.logicalWidth();

    bool isButtonEnabled =
        widget.currentVariant == decorationPriority.inactive ? false : true;

    Size minimumButtonTextSize = Accessibility.textStringSize(
        textInput: widget.buttonTitle,
        textStyle: button1(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    return InkWell(
        onTap: () {
          if (isButtonEnabled == true) {
            widget.buttonAction();
            setState(() {
              animatedBacking = BoxDecoration(color: coloration.accentColor());
            });
          }
        },
        child: AnimatedContainer(
            constraints: BoxConstraints(
              minHeight: minimumButtonTextSize.height * 4,
              maxHeight: minimumButtonTextSize.height * 4,
              minWidth: screenWidth,
            ),
            duration: Duration(milliseconds: 200),
            curve: Curves.bounceIn,
            /*foregroundDecoration: animatedBacking,*/
            decoration: buttonDecoration,
            child: Center(
                child:
                    ButtonOneText(widget.buttonTitle, widget.currentVariant))));
  }
}
