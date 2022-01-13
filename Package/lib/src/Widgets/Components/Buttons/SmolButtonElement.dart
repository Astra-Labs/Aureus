import 'package:aureus/aureus.dart';
import 'package:flutter/gestures.dart';

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
        widget.decorationVariant == decorationPriority.inactive ? false : true;

    BoxDecoration buttonDecoration = ButtonBackingDecoration(
            variant: buttonDecorationVariants.roundedPill,
            priority: widget.decorationVariant)
        .buildBacking();

    Size minimumButtonTextSize = Accessibility.textStringSize(
        widthLimit: 300,
        textInput: widget.buttonTitle,
        textStyle: tag1(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    return InkWell(
        onTap: () {
          print('button tapped!');
          if (isButtonEnabled == true) {
            widget.buttonAction();
          }
        },
        child: Container(
            constraints: BoxConstraints(
                minHeight: minimumButtonTextSize.height * 1.4,
                maxHeight: minimumButtonTextSize.height * 1.6,
                maxWidth: minimumButtonTextSize.width * 1.6,
                minWidth: minimumButtonTextSize.width * 1.4),
            decoration: buttonDecoration,
            child: Center(
                child:
                    TagOneText(widget.buttonTitle, widget.decorationVariant))));
  }
}
