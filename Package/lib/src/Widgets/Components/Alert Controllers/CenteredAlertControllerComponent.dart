import 'package:aureus/aureus.dart';
import 'package:aureus/src/Objects/Components/Icons.dart';

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
    Widget alertControllerActions = Container();

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
        width: 300,
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

    BoxDecoration alertBacking() {
      var customAlertBacking =
          BaseBackingDecoration(priority: decorationPriority.standard);

      Gradient backingGradient = LinearGradient(colors: []);
      BoxShadow backingHaze = BoxShadow();

      if (foundation.brightness == Brightness.dark) {
        backingGradient = foundation.darkGradient();
        backingHaze = foundation.pastelShadow();
      } else if (foundation.brightness == Brightness.light) {
        backingGradient = foundation.lightGradient();
        backingHaze = foundation.darkShadow();
      }

      customAlertBacking.decorationCornerRadius = BorderRadius.circular(10.0);
      customAlertBacking.decorationGradient = backingGradient;
      customAlertBacking.decorationBorder = foundation.universalBorder();
      customAlertBacking.decorationHaze = backingHaze;

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
                    badgeIcon: widget.alertData.alertIcon,
                    badgePriority: decorationPriority.important),
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
