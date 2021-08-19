import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//
//Doc Link:

//The main container for the entire Help Center functionality that controls the layout, views, and more.
class HelpCenter extends StatefulWidget {
  final HelpCenterObject helpCenter;

  const HelpCenter({required this.helpCenter});

  @override
  _HelpCenterState createState() => _HelpCenterState();

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
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
