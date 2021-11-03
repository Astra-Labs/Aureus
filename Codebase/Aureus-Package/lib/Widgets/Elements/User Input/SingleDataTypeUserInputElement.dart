import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
  final foundation = new UDSVariables();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
          width: Sizing.widthOf(
              context: MediaQuery.of(context), weight: sizingWeight.w8),
          height: MediaQuery.of(context).size.height * 0.06,
          decoration: BoxDecoration(
            border: foundation.universalBorder(),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: foundation.ice(),
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: TextFormField(
                style:
                    foundation.heading2().copyWith(color: foundation.black()),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintStyle: foundation.body1(),
                    hintText: widget.dataPlaceholder),
                autocorrect: false,
                textAlign: TextAlign.center,
                keyboardType: widget.dataTextType),
          ))),
    );
  }
}
