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
  var foundation = UDSVariables();

  @override
  Widget build(BuildContext context) {
    ConstrainedBox variableButton;

    switch (widget.currentVariant) {
      case buttonVariants.inactive:
        variableButton = ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: 100, minHeight: 60, maxWidth: 600, maxHeight: 200),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: foundation.white().withOpacity(0.4)),
                child: Center(
                    child: TextButton(
                        onPressed: null,
                        child: Text(widget.buttonTitle),
                        style: TextButton.styleFrom(
                            textStyle: foundation
                                .button1()
                                .copyWith(color: foundation.iron()),
                            padding: EdgeInsets.all(10),
                            tapTargetSize: MaterialTapTargetSize.padded,
                            enableFeedback: true)))));

        break;

      case buttonVariants.lightActive:
        variableButton = ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: 100, minHeight: 60, maxWidth: 600, maxHeight: 200),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: foundation.iron(), width: 1),
                    borderRadius: BorderRadius.circular(10.0)),
                color: foundation.white(),
                child: Center(
                    child: TextButton(
                        onPressed: widget.buttonAction,
                        child: Text(widget.buttonTitle),
                        style: TextButton.styleFrom(
                            textStyle: foundation
                                .button1()
                                .copyWith(color: foundation.carbon()),
                            padding: EdgeInsets.all(10),
                            tapTargetSize: MaterialTapTargetSize.padded,
                            enableFeedback: true)))));

        break;

      case buttonVariants.darkActive:
        variableButton = ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: 100, minHeight: 60, maxWidth: 600, maxHeight: 200),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: foundation.iron(), width: 1),
                    borderRadius: BorderRadius.circular(10.0)),
                color: foundation.carbon(),
                child: Center(
                    child: TextButton(
                        onPressed: null,
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
