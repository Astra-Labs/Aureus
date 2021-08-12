import 'package:aureus/Elements/Info%20Hiearchy/TabSubheaderElement.dart';
import 'package:flutter/cupertino.dart';
import 'package:aureus/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//
//Doc Link:

class MultipleDataTypeUserInputElement extends StatefulWidget {
  final String dataLabel;
  final String dataPlaceholder;
  final TextInputType dataTextType;

  const MultipleDataTypeUserInputElement(
      {required this.dataLabel,
      required this.dataPlaceholder,
      required this.dataTextType});

  @override
  _MultipleDataTypeUserInputElementState createState() =>
      _MultipleDataTypeUserInputElementState();
}

class _MultipleDataTypeUserInputElementState
    extends State<MultipleDataTypeUserInputElement> {
  var variables = UDSVariables();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.all(5.0),
          child: TabSubheaderElement(title: widget.dataLabel)),
      Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
            width: 250,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: variables.steel(), width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: variables.ice(),
            ),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintStyle: variables.body1(),
                      hintText: widget.dataPlaceholder),
                  autocorrect: false,
                  textAlign: TextAlign.left,
                  keyboardType: widget.dataTextType),
            ))),
      ),
    ]);
  }
}
