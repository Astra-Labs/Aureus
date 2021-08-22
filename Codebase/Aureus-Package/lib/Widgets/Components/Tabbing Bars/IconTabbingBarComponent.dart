import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//A group of icon buttons on a card that acts as a tabbing bar to change data
//Doc Link:

class IconTabbingBarComponent extends StatefulWidget {
  final List<TabObject> tabObjects;

  const IconTabbingBarComponent({required this.tabObjects})
      : assert(tabObjects.length >= 2);

  @override
  _IconTabbingBarComponentState createState() =>
      _IconTabbingBarComponentState();
}

class _IconTabbingBarComponentState extends State<IconTabbingBarComponent> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
