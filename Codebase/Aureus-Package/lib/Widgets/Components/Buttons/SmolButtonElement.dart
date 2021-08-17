import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//A small, rounded tab button
//Doc Link:

class SmolButtonElement extends StatefulWidget {
  final buttonVariants currentVariant;
  final String buttonTitle;
  final VoidCallback buttonAction;

  const SmolButtonElement(
      {required this.currentVariant,
      required this.buttonTitle,
      required this.buttonAction});

  @override
  _SmolButtonElementState createState() => _SmolButtonElementState();
}

class _SmolButtonElementState extends State<SmolButtonElement> {
  @override
  Widget build(BuildContext context) {
    //variables that change how the variants are displayed in build time
    BoxDecoration buttonDecoration;
    bool isButtonEnabled;
    Color buttonTextColor;

    switch (widget.currentVariant) {
      case buttonVariants.inactive:

        //variables that define the variant 'inactive' for smol buttons
        isButtonEnabled = false;
        buttonTextColor = foundation.iron();
        buttonDecoration = BoxDecoration(
            color: foundation.white().withOpacity(0.4),
            borderRadius: BorderRadius.circular(40.0));

        break;

      case buttonVariants.lightActive:

        //variables that define the variant 'light active' for smol buttons
        isButtonEnabled = true;
        buttonTextColor = foundation.black();
        buttonDecoration = BoxDecoration(
            color: foundation.white(),
            border: Border.all(color: foundation.steel(), width: 1),
            borderRadius: BorderRadius.circular(40.0));

        break;

      case buttonVariants.darkActive:

        //variables that define the variant 'dark active' for smol buttons
        isButtonEnabled = true;
        buttonTextColor = foundation.white();
        buttonDecoration = BoxDecoration(
            color: foundation.carbon(),
            border: Border.all(color: foundation.steel(), width: 1),
            borderRadius: BorderRadius.circular(40.0));

        break;
    }

    return ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: 60, minHeight: 40, maxWidth: 300, maxHeight: 70),
        child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: buttonDecoration,
            child: Expanded(
                child: TextButton(
                    onPressed: isButtonEnabled ? widget.buttonAction : null,
                    child: Text(widget.buttonTitle),
                    style: TextButton.styleFrom(
                        textStyle: foundation
                            .button1()
                            .copyWith(color: buttonTextColor),
                        padding: EdgeInsets.all(10),
                        tapTargetSize: MaterialTapTargetSize.padded,
                        enableFeedback: true)))));
  }
}
