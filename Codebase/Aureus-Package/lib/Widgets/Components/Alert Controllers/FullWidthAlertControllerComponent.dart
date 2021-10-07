import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//A full width centered alert controller that sticks to the bottom of the screen
//Doc Link:

class FullWidthAlertControllerComponent extends StatefulWidget {
  final AlertControllerObject alertData;

  const FullWidthAlertControllerComponent({required this.alertData});

  @override
  _FullWidthAlertControllerComponentState createState() =>
      _FullWidthAlertControllerComponentState();
}

class _FullWidthAlertControllerComponentState
    extends State<FullWidthAlertControllerComponent> {
  @override
  Widget build(BuildContext context) {
    Expanded alertControllerActions =
        Expanded(child: Container(width: 10, height: 10));

    if (widget.alertData.actions.length == 1) {
      //needs a single full width button

      var actionItem = widget.alertData.actions[0];

      alertControllerActions = Expanded(
          child: FullWidthButtonElement(
        buttonAction: actionItem.onSelection,
        buttonTitle: actionItem.actionName,
        currentVariant: buttonVariants.darkActive,
      ));
    } else if (widget.alertData.actions.length >= 2) {
      //needs stacked standards button built to severity
      alertControllerActions = Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: widget.alertData.actions.length,
              itemBuilder: (BuildContext context, int index) {
                AlertControllerAction actionItem =
                    widget.alertData.actions[index];

                return Padding(
                    padding: EdgeInsets.all(10),
                    child: StandardButtonElement(
                      buttonAction: actionItem.onSelection,
                      buttonTitle: actionItem.actionName,
                      currentVariant: buttonVariants.darkActive,
                    ));
              }));
    }

    return Container(
        width: Sizing.widthOf(context: context, weight: sizingWeight.w10),
        height: Sizing.heightOf(context: context, weight: sizingWeight.w10),
        padding: EdgeInsets.all(10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              //acts as the "cover" of to the pre-existing view
              decoration: LayerBackingDecoration(
                  mode: modeVariants.dark,
                  priority: decorationPriority.inactive,
                  variant: layerDecorationVariants.edged) as Decoration),
          Container(
              //this will be the rounded card backing
              height:
                  Sizing.heightOf(context: context, weight: sizingWeight.w3),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                SecondaryIconButtonElement(
                    currentVariant: buttonVariants.lightActive,
                    buttonIcon: Assets.no as Icon,
                    buttonTooltip: 'Exit',
                    buttonAction: widget.alertData.onCancellation),
                BadgeElementDarkIcyBoi(),
                HeadingThreeText(
                    widget.alertData.alertTitle, foundation.black()),
                BodyOneText(widget.alertData.alertBody, foundation.black()),
                alertControllerActions,
              ]))
        ]));
  }
}
