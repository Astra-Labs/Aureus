import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/*--------- CENTERED ACTION SHEET COMPONENT ----------*/
/// A vertically & horizontally centered alert controller
/// Use when there is only 1-2 actions, otherwise use Bottom Action Sheet

class TextFieldAlertControllerComponent extends StatefulWidget {
  /// The data object that dictates how your alert controller behaves.
  final AlertControllerObject alertData;

  /// Text that 'hints' to the user what you want them to type in.
  final String hintText;

  /// The text field controller that owns the text field
  final TextEditingController textFieldController;

  /// An action to run when the user is finished typing.
  final VoidCallback? onFinish;

  const TextFieldAlertControllerComponent({
    required this.alertData,
    required this.hintText,
    required this.textFieldController,
    this.onFinish,
  });

  @override
  _TextFieldAlertControllerComponentComponentState createState() =>
      _TextFieldAlertControllerComponentComponentState();
}

class _TextFieldAlertControllerComponentComponentState
    extends State<TextFieldAlertControllerComponent> {
  @override
  Widget build(BuildContext context) {
    List<Widget> actionButtons = [];

    var screenSize = size.logicalScreenSize();

    var actions = [
      AlertControllerAction(
        actionName: "Done",
        actionSeverity: AlertControllerActionSeverity.confirm,
        onSelection: () => {},
      ),
      AlertControllerAction(
        actionName: "Cancel",
        actionSeverity: AlertControllerActionSeverity.cancel,
        onSelection: widget.onFinish ?? () => {},
      ),
    ];

    for (var element in actions) {
      actionButtons.add(Padding(
        padding: const EdgeInsets.fromLTRB(0, 5.0, 0.0, 5.0),
        child: StandardButtonElement(
            decorationVariant:
                element.actionSeverity == AlertControllerActionSeverity.confirm
                    ? decorationPriority.important
                    : decorationPriority.standard,
            buttonTitle: element.actionName,
            buttonHint: 'Completes ${element.actionName}',
            buttonAction: element.onSelection),
      ));
    }

    var centeredAlertControllerContent = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconBadge(
              badgeIcon: widget.alertData.alertIcon,
              badgePriority: decorationPriority.standard),
          const SizedBox(height: 10),
          HeadingThreeText(
              widget.alertData.alertTitle, decorationPriority.standard),
          const SizedBox(height: 10),
          BodyOneText(widget.alertData.alertBody, decorationPriority.standard),
          const SizedBox(height: 10.0),
          StandardTextFieldComponent(
            hintText: widget.hintText,
            isEnabled: true,
            decorationVariant: decorationPriority.standard,
            textFieldController: widget.textFieldController,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: actionButtons,
          )
        ]);

    var centeredAlertControllerContainer = Container(
        decoration: CardBackingDecoration(
                decorationVariant: decorationPriority.inverted)
            .buildBacking(),
        constraints: BoxConstraints(
            minWidth: size.layoutItemWidth(1, screenSize),
            maxWidth: size.layoutItemWidth(1, screenSize),
            minHeight: size.layoutItemHeight(3, screenSize),
            maxHeight: size.layoutItemHeight(1, screenSize)),
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: centeredAlertControllerContent,
        ));

    return Semantics.fromProperties(
      properties: SemanticsWrapper.customItem(
          isEnabled: true,
          label: 'Text Field Alert Controller',
          hint: widget.alertData.alertBody,
          isEditable: true,
          isLiveRegion: true),
      child: centeredAlertControllerContainer,
    );
  }
}
