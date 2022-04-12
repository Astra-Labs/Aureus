import 'package:aureus/aureus.dart';

enum AlertControllerActionSeverity { standard, cancel, confirm, destruct }

class AlertControllerObject {
  final VoidCallback onCancellation;
  // What to do when the alert controller is cancelled
  // ------------------------------
  final String alertTitle;
  // Title of the alert controller
  // ------------------------------
  final String alertBody;
  // Description & body of alert controller
  // ------------------------------
  final IconData alertIcon;
  // Icon for the alert controller badge
  // ------------------------------
  final List<AlertControllerAction> actions;
  // The actions someone can take on the alert controller.
  // ------------------------------

  //takes multiple items through the actions list, and otherwise throws an error
  const AlertControllerObject.multipleActions(
      {required this.onCancellation,
      required this.alertTitle,
      required this.alertBody,
      required this.alertIcon,
      required this.actions})
      : assert(actions.length >= 2);

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
