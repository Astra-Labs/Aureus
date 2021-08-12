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
    Container variantButton;

    switch (widget.currentVariant) {
      case buttonVariants.inactive:

        //inactive full width button
        variantButton = Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(15),
            decoration:
                BoxDecoration(color: foundation.melt().withOpacity(0.5)),
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height / 7),
            child: Expanded(
                child: TextButton(
                    onPressed: widget.buttonAction,
                    child: Text(widget.buttonTitle),
                    style: TextButton.styleFrom(
                        textStyle: foundation
                            .button2()
                            .copyWith(color: foundation.iron()),
                        padding: EdgeInsets.all(10),
                        enableFeedback: true))));

        break;

      case buttonVariants.lightActive:

        //light active full width button
        variantButton = Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 1, color: foundation.steel())),
                gradient: foundation.mediumGradient()),
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height / 7),
            child: Expanded(
                child: TextButton(
                    onPressed: widget.buttonAction,
                    child: Text(widget.buttonTitle),
                    style: TextButton.styleFrom(
                        textStyle: foundation
                            .button2()
                            .copyWith(color: foundation.carbon()),
                        padding: EdgeInsets.all(10),
                        enableFeedback: true))));

        break;

      case buttonVariants.darkActive:

        //dark active full width button
        variantButton = Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 1, color: foundation.carbon())),
                gradient: foundation.darkGradient()),
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height / 7),
            child: Expanded(
                child: TextButton(
                    onPressed: widget.buttonAction,
                    child: Text(widget.buttonTitle),
                    style: TextButton.styleFrom(
                        textStyle: foundation
                            .button2()
                            .copyWith(color: foundation.melt()),
                        padding: EdgeInsets.all(10),
                        enableFeedback: true))));

        break;
    }

    return variantButton;
  }
}
