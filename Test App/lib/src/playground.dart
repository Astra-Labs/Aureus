import 'package:aureus/aureus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/src/interface_items.dart';

//where all sizing items in aureus are initiated for testing

class Playground {
  var testAlertControllerAction = AlertControllerAction(
      actionName: 'Yee the haw',
      actionSeverity: AlertControllerActionSeverity.destruct,
      onSelection: () => {print('yee haw!')});

  late AlertControllerObject testAlertControllerObject;

  Container centeredAlertController() {
    testAlertControllerObject = AlertControllerObject.singleAction(
        onCancellation: () => {print('cancelled')},
        alertTitle: 'Would you like to yee?',
        alertBody: 'Haw. Haw Haw Haw Haw.',
        actions: [testAlertControllerAction]);

    Widget alertControllerActions = Container();

    if (testAlertControllerObject.actions.length == 1) {
      //needs a single full width button

      var actionItem = testAlertControllerObject.actions[0];

      alertControllerActions = FullWidthButtonElement(
        buttonAction: actionItem.onSelection,
        buttonTitle: actionItem.actionName,
        currentVariant: decorationPriority.standard,
      );
    } else if (testAlertControllerObject.actions.length >= 2) {
      //needs stacked standards button built to severity
      alertControllerActions = Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: testAlertControllerObject.actions.length,
              itemBuilder: (BuildContext context, int index) {
                AlertControllerAction actionItem =
                    testAlertControllerObject.actions[index];

                return Padding(
                    padding: size.universalPadding(),
                    child: StandardButtonElement(
                      buttonAction: actionItem.onSelection,
                      buttonTitle: actionItem.actionName,
                      decorationVariant: decorationPriority.standard,
                    ));
              }));
    }

    return Container(
      //this will be the rounded card backing
      width: 150,
      height: 300,
      decoration: LayerBackingDecoration(priority: decorationPriority.standard)
          .buildBacking(),
      /*child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SecondaryIconButtonElement(
                          decorationVariant: decorationPriority.standard,
                          buttonIcon: Icon(Assets.no,
                              color: coloration.contrastColor()),
                          buttonTooltip: 'Exit',
                          buttonAction: fillerAction),
                      IconBadge(
                          badgeIcon: Icons.ac_unit,
                          badgePriority: decorationPriority.important),
                      HeadingThreeText(fillerTextHeader),
                      BodyOneText(fillerTextBody),
                      alertControllerActions,
                    ])*/
    );
  }
}
