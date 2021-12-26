import 'package:aureus/aureus.dart';
import 'package:flutter/gestures.dart';

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

    Size minimumButtonTextSize = Accessibility.textStringSize(
        widthLimit: size.widthOf(weight: sizingWeight.w5),
        textInput: widget.buttonTitle,
        textStyle: foundation.button1(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    return InkWell(
        onTap: () {
          print('button tapped!');
          if (isButtonEnabled == true) {
            widget.buttonAction();
          }
        },
        child: SizedBox(
            width: size.widthOf(weight: sizingWeight.w10),
            height: minimumButtonTextSize.height * 5,
            child: Container(
                decoration: buttonDecoration,
                child: Center(
                    child: ButtonOneText(
                        widget.buttonTitle, widget.currentVariant)))));
  }
}
