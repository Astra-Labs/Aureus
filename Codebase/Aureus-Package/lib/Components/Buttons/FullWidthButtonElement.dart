import 'package:flutter/cupertino.dart';
import 'package:aureus/foundation.dart';
import 'package:flutter/material.dart';

//A full width button that acts as the main CTA
//Doc Link:

class FullWidthButtonElement extends StatefulWidget {
  final String buttonTitle;
  final buttonVariants currentVariant;
  final VoidCallback buttonAction;

  const FullWidthButtonElement(
      {required this.buttonTitle,
      required this.currentVariant,
      required this.buttonAction});

  @override
  _FullWidthButtonElementState createState() => _FullWidthButtonElementState();
}

class _FullWidthButtonElementState extends State<FullWidthButtonElement> {
  var foundation = UDSVariables();

  @override
  Widget build(BuildContext context) {
    //to fully have the custom functionality wanted, buttons needed to be a pressable container that holds a text button instead of a stock button widget.

    //the basic "design" of the button background & border
    BoxDecoration buttonDecoration;

    //the variable that checks if the button should be active or not
    bool isButtonEnabled;

    //the text color of the button
    Color buttonTextColor;

    switch (widget.currentVariant) {
      case buttonVariants.inactive:

        //inactive full width button
        isButtonEnabled = false;
        buttonTextColor = foundation.iron();
        buttonDecoration =
            BoxDecoration(color: foundation.melt().withOpacity(0.5));

        break;

      case buttonVariants.lightActive:

        //light active full width button
        isButtonEnabled = true;
        buttonTextColor = foundation.carbon();
        buttonDecoration = BoxDecoration(
            border:
                Border(top: BorderSide(width: 1, color: foundation.steel())),
            gradient: foundation.mediumGradient());

        break;

      case buttonVariants.darkActive:

        //dark active full width button
        isButtonEnabled = true;
        buttonTextColor = foundation.melt();
        buttonDecoration = BoxDecoration(
            border:
                Border(top: BorderSide(width: 1, color: foundation.carbon())),
            gradient: foundation.darkGradient());

        break;
    }

    return Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.all(15),
        decoration: buttonDecoration,
        width: MediaQuery.of(context).size.width,
        height: (MediaQuery.of(context).size.height / 7),
        child: Expanded(
            child: TextButton(
                onPressed: isButtonEnabled ? widget.buttonAction : null,
                child: Text(widget.buttonTitle),
                style: TextButton.styleFrom(
                    textStyle:
                        foundation.button2().copyWith(color: buttonTextColor),
                    padding: EdgeInsets.all(10),
                    enableFeedback: true))));
  }
}
