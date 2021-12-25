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
        (widget.decorationVariant == decorationPriority.inactive
            ? true
            : false);

    BoxDecoration buttonDecoration = ButtonBackingDecoration(
            variant: buttonDecorationVariants.roundedPill,
            priority: widget.decorationVariant)
        .buildBacking();

    Size minimumButtonTextSize = Accessibility.textStringSize(
        widthLimit: 300,
        textInput: widget.buttonTitle,
        textStyle: foundation.tag1(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    print('size of smol button element is ${minimumButtonTextSize}');

    return SizedBox(
        width: minimumButtonTextSize.width * 2,
        height: minimumButtonTextSize.height * 2,
        child: Container(
            decoration: buttonDecoration,
            child: Center(
                child:
                    TagOneText(widget.buttonTitle, widget.decorationVariant))));
  }
}
