import 'package:aureus/foundation.dart';
import 'package:flutter/material.dart';

//A small, circular button that uses an icon to communicate its' purpose
//Doc Link:

//big circular icon buttons that are greater than 70x70 and are intended to be the main action of the page (e.g: add, message, etc).
class PrimaryIconButtonElement extends StatefulWidget {
  final buttonVariants currentVariant;
  final Image buttonIcon;
  final String buttonTooltip;
  final VoidCallback buttonAction;

  const PrimaryIconButtonElement(
      {required this.currentVariant,
      required this.buttonIcon,
      required this.buttonTooltip,
      required this.buttonAction});

  @override
  _PrimaryIconButtonElementState createState() =>
      _PrimaryIconButtonElementState();
}

class _PrimaryIconButtonElementState extends State<PrimaryIconButtonElement> {
  var foundation = UDSVariables();

  @override
  Widget build(BuildContext context) {
    //to fully have the custom functionality wanted, buttons needed to be a pressable container that holds a text button instead of a stock button widget.
    Container variantButton;

    switch (widget.currentVariant) {
      case buttonVariants.inactive:

        //inactive primary icon button
        variantButton = Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: foundation.melt().withOpacity(0.5),
                shape: BoxShape.circle),
            width: 80.0,
            height: 80.0,
            child: Expanded(
                child: IconButton(
                    icon: widget.buttonIcon,
                    iconSize: 30,
                    color: foundation.steel(),
                    tooltip: widget.buttonTooltip,
                    onPressed: null)));

        break;

      case buttonVariants.lightActive:

        //light active primary icon button
        variantButton = Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                gradient: foundation.mediumGradient(),
                border: Border.all(color: foundation.steel(), width: 1),
                shape: BoxShape.circle),
            width: 80.0,
            height: 80.0,
            child: Expanded(
                child: IconButton(
                    icon: widget.buttonIcon,
                    iconSize: 30,
                    color: foundation.carbon(),
                    tooltip: widget.buttonTooltip,
                    onPressed: widget.buttonAction)));

        break;

      case buttonVariants.darkActive:

        //dark active primary icon button
        variantButton = Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                gradient: foundation.darkGradient(),
                border: Border.all(color: foundation.steel(), width: 1),
                shape: BoxShape.circle),
            width: 80.0,
            height: 80.0,
            child: Expanded(
                child: IconButton(
                    icon: widget.buttonIcon,
                    iconSize: 30,
                    color: foundation.melt(),
                    tooltip: widget.buttonTooltip,
                    onPressed: widget.buttonAction)));

        break;
    }

    return variantButton;
  }
}

//tiny babey icon buttons that are 60x60 or less.
class SecondaryIconButtonElement extends StatefulWidget {
  final buttonVariants currentVariant;
  final Image buttonIcon;
  final String buttonTooltip;
  final VoidCallback buttonAction;

  const SecondaryIconButtonElement(
      {required this.currentVariant,
      required this.buttonIcon,
      required this.buttonTooltip,
      required this.buttonAction});

  @override
  _SecondaryIconButtonElementState createState() =>
      _SecondaryIconButtonElementState();
}

class _SecondaryIconButtonElementState
    extends State<SecondaryIconButtonElement> {
  var foundation = UDSVariables();

  @override
  Widget build(BuildContext context) {
    //to fully have the custom functionality wanted, buttons needed to be a pressable container that holds a text button instead of a stock button widget.
    Container variantButton;

    switch (widget.currentVariant) {
      case buttonVariants.inactive:

        //inactive secondary icon button
        variantButton = Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: foundation.melt().withOpacity(0.5),
                shape: BoxShape.circle),
            width: 40.0,
            height: 40.0,
            child: Expanded(
                child: IconButton(
                    icon: widget.buttonIcon,
                    iconSize: 15,
                    color: foundation.steel(),
                    tooltip: widget.buttonTooltip,
                    onPressed: null)));

        break;

      case buttonVariants.lightActive:

        //light active secondary icon button
        variantButton = Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: foundation.ice(),
                border: Border.all(color: foundation.steel(), width: 1),
                shape: BoxShape.circle),
            width: 40.0,
            height: 40.0,
            child: Expanded(
                child: IconButton(
                    icon: widget.buttonIcon,
                    iconSize: 15,
                    color: foundation.black(),
                    tooltip: widget.buttonTooltip,
                    onPressed: widget.buttonAction)));

        break;

      case buttonVariants.darkActive:

        //dark active secondary icon button
        variantButton = Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: foundation.carbon(),
                border: Border.all(color: foundation.steel(), width: 1),
                shape: BoxShape.circle),
            width: 40.0,
            height: 40.0,
            child: Expanded(
                child: IconButton(
                    icon: widget.buttonIcon,
                    iconSize: 15,
                    color: foundation.white(),
                    tooltip: widget.buttonTooltip,
                    onPressed: widget.buttonAction)));

        break;
    }

    return variantButton;
  }
}
