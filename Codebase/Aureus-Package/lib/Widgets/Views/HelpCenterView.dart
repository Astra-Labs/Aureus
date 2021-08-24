import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//
//Doc Link:

//The main container for the entire Help Center functionality that controls the layout, views, and more.
class HelpCenterView extends StatefulWidget {
  final HelpCenterObject helpCenter;

  const HelpCenterView({required this.helpCenter});

  @override
  _HelpCenterViewState createState() => _HelpCenterViewState();
}

class _HelpCenterViewState extends State<HelpCenterView> {
  //the container that draws the first screen that someone will see when they enter the Help Center.
  Expanded helpCenterLandingView() {
    return Expanded(child: Container());
  }

  //the container that draws the first screen that someone will see when they enter the Help Center.
  Expanded helpCenterGridView() {
    return Expanded(child: Container());
  }

  //the container that draws the first screen that someone will see when they enter the Help Center.
  Expanded helpCenterListView() {
    return Expanded(child: Container());
  }

  //the container that draws the first screen that someone will see when they enter the Help Center.
  Expanded helpCenterDetailView() {
    return Expanded(child: Container());
  }

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
