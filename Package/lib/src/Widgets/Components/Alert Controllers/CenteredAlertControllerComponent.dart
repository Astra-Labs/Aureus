import 'package:aureus/aureus.dart';

//A vertically & horizontally centered alert controller
//Doc Link:

class CenteredAlertControllerComponent extends StatefulWidget {
  final AlertControllerObject alertData;

  const CenteredAlertControllerComponent({required this.alertData});

  @override
  _CenteredAlertControllerComponentState createState() =>
      _CenteredAlertControllerComponentState();
}

class _CenteredAlertControllerComponentState
    extends State<CenteredAlertControllerComponent> {
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
        decoration:
            LayerBackingDecoration(priority: decorationPriority.inactive)
                as Decoration,
        child: Center(
            child: Container(
                //this will be the rounded card backing
                width: size.widthOf(),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                    ]))));
  }
}
