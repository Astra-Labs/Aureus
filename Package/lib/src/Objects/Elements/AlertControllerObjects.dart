/// @nodoc
import 'package:flutter/material.dart';

/// {@category Objects}
/// {@image <image alt='' src=''>}

/// Tells the user what kind of severity an action is.
enum AlertControllerActionSeverity { standard, cancel, confirm, destruct }

/// Represents all data in an alert controller.
class AlertControllerObject {
  /// What to do when the alert controller is cancelled
  final VoidCallback onCancellation;

  /// Title of the alert controller
  final String alertTitle;

  /// Description & body of alert controller
  final String alertBody;

  /// Icon for the alert controller badge
  final IconData alertIcon;

  /// The actions someone can take on the alert controller.
  List<AlertControllerAction>? actions;

  /// If using a [TextFieldAlertControllerComponent], this is
  /// the controller that will hold the text value.
  TextEditingController? controller;

  /// If using a [TextFieldAlertControllerComponent], this is
  /// the hint text for the user to know what to type in.
  String? hintText;

  /// If using a [TextFieldAlertControllerComponent], this is
  /// code to run after the user finishes typing.
  VoidCallback? onFinish;

  /// A constructor that takes multiple items through the actions list, and otherwise throws an error
  AlertControllerObject.multipleActions(
      {required this.onCancellation,
      required this.alertTitle,
      required this.alertBody,
      required this.alertIcon,
      required this.actions})
      : assert(actions!.length >= 2);

  /// A constructor that takes one item through the actions list, and otherwise throws an error
  AlertControllerObject.singleAction(
      {required this.onCancellation,
      required this.alertTitle,
      required this.alertBody,
      required this.alertIcon,
      required this.actions})
      : assert(actions!.length == 1);

  AlertControllerObject.textField(
      {required this.onCancellation,
      required this.alertTitle,
      required this.alertBody,
      required this.alertIcon,
      required this.controller,
      required this.hintText,
      required this.onFinish})
      : assert(controller != null && hintText != "");
}

/// An action that someone can take on an [AlertControllerObject].
class AlertControllerAction {
  /// What the name of the action is. E.G: Agree, Send Email, etc
  final String actionName;

  /// What the severity of the action is
  final AlertControllerActionSeverity actionSeverity;

  /// What should happen when the user selects the action
  final VoidCallback onSelection;

  const AlertControllerAction(
      {required this.actionName,
      required this.actionSeverity,
      required this.onSelection})
      : assert(actionName != '');
}
