import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//
//Doc Link:

class SignUpView extends StatefulWidget {
  final modeVariants viewMode;
  final deviceVariants deviceType;

  const SignUpView({required this.viewMode, required this.deviceType});

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(
            Sizing.widthOf(context: context, weight: sizingWeight.w0),
            Sizing.heightOf(context: context, weight: sizingWeight.w1),
            Sizing.widthOf(context: context, weight: sizingWeight.w0),
            Sizing.heightOf(context: context, weight: sizingWeight.w0)),
        width: Sizing.widthOf(context: context, weight: sizingWeight.w10),
        height: Sizing.heightOf(context: context, weight: sizingWeight.w10),
        decoration: LayerBackingDecoration(
            mode: widget.viewMode,
            priority: decorationPriority.standard,
            variant: layerDecorationVariants.edged) as Decoration,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: []));
  }
}
