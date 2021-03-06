import 'package:aureus/aureus.dart';

enum AlertControllerActionSeverity { standard, cancel, confirm, destruct }

class AlertControllerObject {
  final VoidCallback onCancellation;
  final String alertTitle;
  final String alertBody;
  final IconData alertIcon;
  final List<AlertControllerAction> actions;

  //takes multiple items through the actions list, and otherwise throws an error
  const AlertControllerObject.multipleActions(
      {required this.onCancellation,
      required this.alertTitle,
      required this.alertBody,
      required this.alertIcon,
      required this.actions})
      : assert(actions.length >= 2),
        assert(actions.length <= 3);

  //takes one item through the actions list, and otherwise throws an error
  const AlertControllerObject.singleAction(
      {required this.onCancellation,
      required this.alertTitle,
      required this.alertBody,
      required this.alertIcon,
      required this.actions})
      : assert(actions.length == 1);
}

class AlertControllerAction {
  final String actionName;
  final AlertControllerActionSeverity actionSeverity;
  final VoidCallback onSelection;

  const AlertControllerAction(
      {required this.actionName,
      required this.actionSeverity,
      required this.onSelection})
      : assert(actionName != '');
}
