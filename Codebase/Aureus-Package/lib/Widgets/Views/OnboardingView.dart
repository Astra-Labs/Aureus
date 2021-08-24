import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//
//Doc Link:

class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
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
