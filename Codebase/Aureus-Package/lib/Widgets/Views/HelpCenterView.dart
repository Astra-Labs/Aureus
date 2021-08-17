import 'package:flutter/cupertino.dart';
import 'package:aureus/foundation.dart';
import 'package:aureus/Objects/Views/HelpCenterObjects.dart';

//
//Doc Link:

//The main container for the entire Help Center functionality that controls the layout, views, and more.
class HelpCenter extends StatefulWidget {
  final HelpCenterObject helpCenter;

  const HelpCenter({required this.helpCenter});

  @override
  _HelpCenterState createState() => _HelpCenterState();

  //the container that draws the first screen that someone will see when they enter the Help Center.
  Container HelpCenterLandingView() {
    return Container();
  }

  //the container that draws the first screen that someone will see when they enter the Help Center.
  Container HelpCenterGridView() {
    return Container();
  }

  //the container that draws the first screen that someone will see when they enter the Help Center.
  Container HelpCenterListView() {
    return Container();
  }

  //the container that draws the first screen that someone will see when they enter the Help Center.
  Container HelpCenterDetailView() {
    return Container();
  }
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
