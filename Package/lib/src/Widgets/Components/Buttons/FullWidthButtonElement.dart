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
  @override
  Widget build(BuildContext context) {
    //variables that change how the variants are displayed in build time
    BoxDecoration buttonDecoration = ButtonBackingDecoration(
            variant: buttonDecorationVariants.edgedRectangle,
            priority: widget.currentVariant)
        .buildBacking();
    bool isButtonEnabled =
        widget.currentVariant == decorationPriority.inactive ? true : false;

    return Container(
        alignment: Alignment.bottomCenter,
        padding: size.universalPadding(),
        decoration: buttonDecoration,
        width: MediaQuery.of(context).size.width,
        height: (MediaQuery.of(context).size.height / 7),
        child: Expanded(
            child: TextButton(
                onPressed: isButtonEnabled ? widget.buttonAction : null,
                child: Text(widget.buttonTitle),
                style: TextButton.styleFrom(
                    padding: size.universalPadding(), enableFeedback: true))));
  }
}
