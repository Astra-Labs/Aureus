import 'package:aureus/aureus.dart';

//A vertically & horizontally centered alert controller

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
    Widget alertControllerActions = Container();

    var screenSize = size.logicalScreenSize();

    if (widget.alertData.actions.length == 1) {
      //needs a single standard button

      var actionItem = widget.alertData.actions[0];

      alertControllerActions = StandardButtonElement(
        buttonAction: actionItem.onSelection,
        buttonTitle: actionItem.actionName,
        decorationVariant: decorationPriority.standard,
      );
    } else if (widget.alertData.actions.length <= 2) {
      //needs stacked standards button built to severity
      alertControllerActions = SizedBox(
        width: size.layoutItemWidth(1, screenSize),
        child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) =>
                Divider(height: 6.0, color: Colors.white.withOpacity(0.0)),
            itemCount: widget.alertData.actions.length,
            itemBuilder: (BuildContext context, int index) {
              AlertControllerAction actionItem =
                  widget.alertData.actions[index];

              return StandardButtonElement(
                buttonAction: actionItem.onSelection,
                buttonTitle: actionItem.actionName,
                decorationVariant: decorationPriority.standard,
              );
            }),
      );
    }

    //Creates a custom backing to establish high importance.
    BoxDecoration alertBacking() {
      var customAlertBacking =
          BaseBackingDecoration(priority: decorationPriority.standard);

      Gradient backingGradient = LinearGradient(colors: []);
      BoxShadow backingHaze = BoxShadow();

      if (brightness() == Brightness.dark) {
        backingGradient = darkGradient();
        backingHaze = pastelShadow();
      } else if (brightness() == Brightness.light) {
        backingGradient = lightGradient();
        backingHaze = darkShadow();
      }

      customAlertBacking.decorationCornerRadius = BorderRadius.circular(10.0);
      customAlertBacking.decorationGradient = backingGradient;
      customAlertBacking.decorationBorder = universalBorder();
      customAlertBacking.decorationHaze = backingHaze;

      return customAlertBacking.buildBacking();
    }

    return Container(
        decoration: alertBacking(),
        constraints: BoxConstraints(
            minWidth: size.layoutItemWidth(1, screenSize),
            minHeight: size.layoutItemHeight(3, screenSize),
            maxHeight: size.layoutItemHeight(1, screenSize)),
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconBadge(
                    badgeIcon: widget.alertData.alertIcon,
                    badgePriority: decorationPriority.standard),
                SizedBox(height: 20),
                HeadingThreeText(
                    widget.alertData.alertTitle, decorationPriority.standard),
                BodyOneText(
                    widget.alertData.alertBody, decorationPriority.standard),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 10),
                  child: alertControllerActions,
                ),
              ]),
        ));
  }
}
