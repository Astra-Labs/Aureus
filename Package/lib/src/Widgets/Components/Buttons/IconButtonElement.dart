import 'package:aureus/aureus.dart';

//A small, circular button that uses an icon to communicate its' purpose
//Doc Link:

//big circular icon buttons that are greater than 70x70 and are intended to be the main action of the page (e.g: add, message, etc).
class PrimaryIconButtonElement extends StatefulWidget {
  final decorationPriority currentVariant;
  final Icon buttonIcon;
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
  @override
  Widget build(BuildContext context) {
    //to fully have the custom functionality wanted, buttons needed to be a pressable container that holds a text button instead of a stock button widget.
    Container variantButton;

    //variables that change how the variants are displayed in build time
    bool isButtonEnabled;
    BoxDecoration buttonDecoration;
    Color iconColor;

    switch (widget.currentVariant) {
      case decorationPriority.inactive:

        //inactive primary icon button
        variantButton = Container(
            alignment: Alignment.bottomCenter,
            padding: size.universalPadding(),
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

      case decorationPriority.standard:

        //light active primary icon button
        variantButton = Container(
            alignment: Alignment.bottomCenter,
            padding: size.universalPadding(),
            decoration: BoxDecoration(
                gradient: foundation.mediumGradient(),
                border: foundation.universalBorder(),
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

      case decorationPriority.important:

        //dark active primary icon button
        variantButton = Container(
            alignment: Alignment.bottomCenter,
            padding: size.universalPadding(),
            decoration: BoxDecoration(
                gradient: foundation.darkGradient(),
                border: foundation.universalBorder(),
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
  final decorationPriority currentVariant;
  final Icon buttonIcon;
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
  @override
  Widget build(BuildContext context) {
    //to fully have the custom functionality wanted, buttons needed to be a pressable container that holds a text button instead of a stock button widget.

    //variables that change how the variants are displayed in build time
    bool isButtonEnabled;
    BoxDecoration buttonDecoration;
    Color iconColor;

    switch (widget.currentVariant) {
      case decorationPriority.inactive:

        //variables that define the variant 'inactive' for secondary icon buttons
        isButtonEnabled = false;
        buttonDecoration = BoxDecoration(
            color: foundation.melt().withOpacity(0.5), shape: BoxShape.circle);
        iconColor = foundation.steel();

        break;

      case decorationPriority.standard:

        //variables that define the variant 'light active' for secondary icon buttons
        isButtonEnabled = true;
        buttonDecoration = BoxDecoration(
            color: foundation.ice(),
            border: foundation.universalBorder(),
            shape: BoxShape.circle);
        iconColor = foundation.black();

        break;

      case decorationPriority.important:

        //variables that define the variant 'dark active' for secondary icon buttons
        isButtonEnabled = true;
        buttonDecoration = BoxDecoration(
            color: foundation.carbon(),
            border: foundation.universalBorder(),
            shape: BoxShape.circle);
        iconColor = foundation.white();

        break;
    }

    return Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.all(15),
        decoration: buttonDecoration,
        width: 40.0,
        height: 40.0,
        child: Expanded(
            child: IconButton(
                icon: widget.buttonIcon,
                iconSize: 15,
                color: iconColor,
                tooltip: widget.buttonTooltip,
                onPressed: isButtonEnabled ? widget.buttonAction : null)));
  }
}
