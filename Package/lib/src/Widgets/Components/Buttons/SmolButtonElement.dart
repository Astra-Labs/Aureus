import 'package:aureus/aureus.dart';

//A small, rounded tab button
//Doc Link:

class SmolButtonElement extends StatefulWidget {
  final decorationPriority decorationVariant;
  final String buttonTitle;
  final VoidCallback buttonAction;

  const SmolButtonElement(
      {required this.decorationVariant,
      required this.buttonTitle,
      required this.buttonAction});

  @override
  _SmolButtonElementState createState() => _SmolButtonElementState();
}

class _SmolButtonElementState extends State<SmolButtonElement> {
  @override
  Widget build(BuildContext context) {
    //variables that change how the variants are displayed in build time
    bool isButtonEnabled =
        widget.decorationVariant == decorationPriority.inactive ? true : false;

    BoxDecoration buttonDecoration = ButtonBackingDecoration(
            variant: buttonDecorationVariants.roundedPill,
            priority: widget.decorationVariant)
        .buildBacking();

    return ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: 60, minHeight: 40, maxWidth: 300, maxHeight: 70),
        child: Container(
            padding: size.universalPadding(),
            decoration: buttonDecoration,
            child: TextButton(
                onPressed: isButtonEnabled ? widget.buttonAction : null,
                child: Text(widget.buttonTitle),
                style: TextButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    tapTargetSize: MaterialTapTargetSize.padded,
                    enableFeedback: true))));
  }
}
