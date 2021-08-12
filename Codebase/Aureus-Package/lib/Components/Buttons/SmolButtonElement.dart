import 'package:flutter/cupertino.dart';
import 'package:aureus/foundation.dart';
import 'package:flutter/material.dart';

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
  var foundation = UDSVariables();

  @override
  Widget build(BuildContext context) {
    ConstrainedBox variableButton;

    switch (widget.currentVariant) {
      case buttonVariants.inactive:
        variableButton = ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: 60, minHeight: 40, maxWidth: 300, maxHeight: 70),
            child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: foundation.white().withOpacity(0.4),
                    borderRadius: BorderRadius.circular(40.0)),
                child: Expanded(
                    child: TextButton(
                        onPressed: null,
                        child: Text(widget.buttonTitle),
                        style: TextButton.styleFrom(
                            textStyle: foundation
                                .button1()
                                .copyWith(color: foundation.steel()),
                            padding: EdgeInsets.all(10),
                            tapTargetSize: MaterialTapTargetSize.padded,
                            enableFeedback: true)))));

        break;

      case buttonVariants.lightActive:
        variableButton = ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: 60, minHeight: 40, maxWidth: 300, maxHeight: 70),
            child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: foundation.white(),
                    border: Border.all(color: foundation.steel(), width: 1),
                    borderRadius: BorderRadius.circular(40.0)),
                child: Expanded(
                    child: TextButton(
                        onPressed: widget.buttonAction,
                        child: Text(widget.buttonTitle),
                        style: TextButton.styleFrom(
                            textStyle: foundation
                                .button1()
                                .copyWith(color: foundation.black()),
                            padding: EdgeInsets.all(10),
                            tapTargetSize: MaterialTapTargetSize.padded,
                            enableFeedback: true)))));
        break;

      case buttonVariants.darkActive:
        variableButton = ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: 60, minHeight: 40, maxWidth: 300, maxHeight: 70),
            child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: foundation.carbon(),
                    border: Border.all(color: foundation.steel(), width: 1),
                    borderRadius: BorderRadius.circular(40.0)),
                child: Expanded(
                    child: TextButton(
                        onPressed: widget.buttonAction,
                        child: Text(widget.buttonTitle),
                        style: TextButton.styleFrom(
                            textStyle: foundation
                                .button1()
                                .copyWith(color: foundation.white()),
                            padding: EdgeInsets.all(10),
                            tapTargetSize: MaterialTapTargetSize.padded,
                            enableFeedback: true)))));

        break;
    }

    return variableButton;
  }
}
