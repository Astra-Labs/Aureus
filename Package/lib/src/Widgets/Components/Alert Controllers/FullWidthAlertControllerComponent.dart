import 'package:aureus/aureus.dart';

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
        currentVariant: decorationPriority.standard,
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
                    padding: size.universalPadding(),
                    child: StandardButtonElement(
                      buttonAction: actionItem.onSelection,
                      buttonTitle: actionItem.actionName,
                      decorationVariant: decorationPriority.standard,
                    ));
              }));
    }

    return Container(
        width: size.widthOf(weight: sizingWeight.w10),
        height: size.heightOf(weight: sizingWeight.w10),
        padding: EdgeInsets.all(10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              //acts as the "cover" of to the pre-existing view
              decoration:
                  LayerBackingDecoration(priority: decorationPriority.inactive)
                      as Decoration),
          Container(
              //this will be the rounded card backing
              height: size.heightOf(weight: sizingWeight.w3),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                SecondaryIconButtonElement(
                    decorationVariant: decorationPriority.standard,
                    buttonIcon: Assets.no as Icon,
                    buttonTooltip: 'Exit',
                    buttonAction: widget.alertData.onCancellation),
                IconBadge(
                    badgeIcon: Icons.ac_unit,
                    badgePriority: decorationPriority.important),
                HeadingThreeText(widget.alertData.alertTitle),
                BodyOneText(widget.alertData.alertBody),
                alertControllerActions,
              ]))
        ]));
  }
}
