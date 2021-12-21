import 'package:aureus/aureus.dart';

//A 80% width button that acts as a standard button for the UDS
//Doc Link:

class StandardButtonElement extends StatefulWidget {
  final decorationPriority decorationVariant;
  final String buttonTitle;
  final VoidCallback buttonAction;

  const StandardButtonElement(
      {required this.decorationVariant,
      required this.buttonTitle,
      required this.buttonAction});

  @override
  _StandardButtonElementState createState() => _StandardButtonElementState();
}

class _StandardButtonElementState extends State<StandardButtonElement> {
  @override
  Widget build(BuildContext context) {
    //variables that change how the variants are displayed in build time
    BoxDecoration buttonDecoration = ButtonBackingDecoration(
            variant: buttonDecorationVariants.roundedRectangle,
            priority: widget.decorationVariant)
        .buildBacking();
    bool isButtonEnabled =
        widget.decorationVariant == decorationPriority.inactive ? true : false;

    return ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: 100, minHeight: 60, maxWidth: 600, maxHeight: 200),
        child: Container(
            padding: size.universalPadding(),
            decoration: buttonDecoration,
            child: Expanded(
                child: TextButton(
                    onPressed: isButtonEnabled ? widget.buttonAction : null,
                    child: Text(widget.buttonTitle),
                    style: TextButton.styleFrom(
                        padding: size.universalPadding(),
                        tapTargetSize: MaterialTapTargetSize.padded,
                        enableFeedback: true)))));
  }
}
