import 'package:aureus/aureus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/src/interface_items.dart';

//where all sizing items in aureus are initiated for testing

class Playground {
  var testAlertControllerAction = AlertControllerAction(
      actionName: 'Yee the haw',
      actionSeverity: AlertControllerActionSeverity.confirm,
      onSelection: () => {print('yee haw!')});

  var testAlertControllerAction2 = AlertControllerAction(
      actionName: 'Haw the yee',
      actionSeverity: AlertControllerActionSeverity.destruct,
      onSelection: () => {print('haw yee!')});

  late AlertControllerObject testAlertControllerObject =
      AlertControllerObject.singleAction(
          onCancellation: () => {print('cancelled')},
          alertTitle: 'Would you like to yee?',
          alertBody: 'Haw. Haw Haw Haw Haw.',
          actions: [testAlertControllerAction],
          alertIcon: Icons.access_alarm);

  Container centeredAlertController() {
    Widget alertControllerActions = Container();

    if (testAlertControllerObject.actions.length == 1) {
      //needs a single standard button

      var actionItem = testAlertControllerObject.actions[0];

      alertControllerActions = StandardButtonElement(
        buttonAction: actionItem.onSelection,
        buttonTitle: actionItem.actionName,
        decorationVariant: decorationPriority.standard,
      );
    } else if (testAlertControllerObject.actions.length <= 2) {
      //needs stacked standards button built to severity
      alertControllerActions = SizedBox(
        width: 300,
        child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) =>
                Divider(height: 6.0, color: Colors.white.withOpacity(0.0)),
            itemCount: testAlertControllerObject.actions.length,
            itemBuilder: (BuildContext context, int index) {
              AlertControllerAction actionItem =
                  testAlertControllerObject.actions[index];

              return StandardButtonElement(
                buttonAction: actionItem.onSelection,
                buttonTitle: actionItem.actionName,
                decorationVariant: decorationPriority.standard,
              );
            }),
      );
    }

    BoxDecoration alertBacking() {
      var customAlertBacking =
          BaseBackingDecoration(priority: decorationPriority.standard);

      Gradient backingGradient = LinearGradient(colors: []);

      if (foundation.brightness == Brightness.dark) {
        backingGradient = foundation.darkGradient();
      } else if (foundation.brightness == Brightness.light) {
        backingGradient = foundation.lightGradient();
      }

      customAlertBacking.decorationCornerRadius = BorderRadius.circular(10.0);
      customAlertBacking.decorationGradient = backingGradient;
      customAlertBacking.decorationBorder = foundation.universalBorder();
      customAlertBacking.decorationHaze = foundation.pastelShadow();

      return customAlertBacking.buildBacking();
    }

    return Container(
        //this will be the rounded card backing
        decoration: alertBacking(),
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Wrap(
              direction: Axis.vertical,
              spacing: 25,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              clipBehavior: Clip.hardEdge,
              children: [
                IconBadge(
                    badgeIcon: Icons.ac_unit,
                    badgePriority: decorationPriority.important),
                HeadingThreeText(testAlertControllerObject.alertTitle,
                    decorationPriority.standard),
                BodyOneText(testAlertControllerObject.alertBody,
                    decorationPriority.standard),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 10),
                  child: alertControllerActions,
                ),
              ]),
        ));
  }
}
