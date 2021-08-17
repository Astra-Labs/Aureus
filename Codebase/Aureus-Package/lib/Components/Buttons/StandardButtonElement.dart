import 'package:flutter/material.dart';
import 'package:aureus/foundation.dart';

//A 80% width button that acts as a standard button for the UDS
//Doc Link:

class StandardButtonElement extends StatefulWidget {
  final buttonVariants currentVariant;
  final String buttonTitle;
  final VoidCallback buttonAction;

  const StandardButtonElement(
      {required this.currentVariant,
      required this.buttonTitle,
      required this.buttonAction});

  @override
  _StandardButtonElementState createState() => _StandardButtonElementState();
}

class _StandardButtonElementState extends State<StandardButtonElement> {

  @override
  Widget build(BuildContext context) {
    ConstrainedBox variableButton;

    //variables that change how the variants are displayed in build time
    BoxDecoration buttonDecoration;
    bool isButtonEnabled;
    Color buttonTextColor;

    switch (widget.currentVariant) {
      case buttonVariants.inactive:

        //variables that define the variant 'inactive' for standard buttons
        isButtonEnabled = false;
        buttonTextColor = foundation.iron();
        buttonDecoration = BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: foundation.carbon().withOpacity(0.4));

        break;

      case buttonVariants.lightActive:

        //variables that define the variant 'light active' for standard buttons
        isButtonEnabled = true;
        buttonTextColor = foundation.carbon();
        buttonDecoration = BoxDecoration(
            color: foundation.white(),
            border: Border.all(color: foundation.steel(), width: 1),
            borderRadius: BorderRadius.circular(10.0));

        break;

      case buttonVariants.darkActive:

        //variables that define the variant 'light active' for standard buttons
        isButtonEnabled = true;
        buttonTextColor = foundation.white();
        buttonDecoration = BoxDecoration(
            color: foundation.carbon(),
            border: Border.all(color: foundation.steel(), width: 1),
            borderRadius: BorderRadius.circular(10.0));

        break;
    }

    return ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: 100, minHeight: 60, maxWidth: 600, maxHeight: 200),
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
