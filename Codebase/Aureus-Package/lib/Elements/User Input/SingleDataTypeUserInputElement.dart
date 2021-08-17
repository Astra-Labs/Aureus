import 'package:flutter/cupertino.dart';
import 'package:aureus/foundation.dart';
import 'package:flutter/material.dart';

//
//Doc Link:

class SingleDataTypeUserInputElement extends StatefulWidget {
  final String dataPlaceholder;
  final TextInputType dataTextType;

  const SingleDataTypeUserInputElement(
      {required this.dataPlaceholder, required this.dataTextType});

  @override
  _SingleDataTypeUserInputElementState createState() =>
      _SingleDataTypeUserInputElementState();
}

class _SingleDataTypeUserInputElementState
    extends State<SingleDataTypeUserInputElement> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
          width: 250,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: foundation.steel(), width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: foundation.ice(),
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
                    hintStyle: foundation.body1(),
                    hintText: widget.dataPlaceholder),
                autocorrect: false,
                textAlign: TextAlign.left,
                keyboardType: widget.dataTextType),
          ))),
    );
  }
}
