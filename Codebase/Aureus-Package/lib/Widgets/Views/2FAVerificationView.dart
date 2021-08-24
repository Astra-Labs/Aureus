import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//
//Doc Link:

class TFAVerificationView extends StatefulWidget {
  @override
  _TFAVerificationViewState createState() => _TFAVerificationViewState();
}

class _TFAVerificationViewState extends State<TFAVerificationView> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
        width: Sizing.widthOf(context: context, weight: sizingWeight.w10),
        height: Sizing.heightOf(context: context, weight: sizingWeight.w10),
        decoration: BoxDecoration(),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: []));
  }
}
