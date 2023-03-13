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
  /// The data object that dictates how your alert controller behaves. Make
  /// sure to use the .textField constructor, or else you'll experience bugs!
  final AlertControllerObject alertData;

  const TextFieldAlertControllerComponent({
    required this.alertData,
  });

  @override
  _TextFieldAlertControllerComponentComponentState createState() =>
      _TextFieldAlertControllerComponentComponentState();
}

class _TextFieldAlertControllerComponentComponentState
    extends State<TextFieldAlertControllerComponent> {
  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    List<Widget> buttonRow = [
      SmolButtonElement(
        decorationVariant: decorationPriority.important,
        buttonTitle: "Done",
        buttonHint: 'Finishing typing in the text field',
        buttonAction: () {
          notificationMaster.resetRequests();
          widget.alertData.onFinish!();
        },
      ),
      const Spacer(),
      SmolButtonElement(
          decorationVariant: decorationPriority.standard,
          buttonTitle: "Cancel",
          buttonHint: 'Cancels the alert controller',
          buttonAction: () => {
                notificationMaster.resetRequests(),
              }),
    ];

    var centeredAlertControllerChildren = [
      IconBadge(
          badgeIcon: widget.alertData.alertIcon,
          badgePriority: decorationPriority.standard),
      const SizedBox(height: 10),
      HeadingThreeText(
          widget.alertData.alertTitle, decorationPriority.standard),
      const SizedBox(height: 10),
      BodyOneText(widget.alertData.alertBody, decorationPriority.standard),
      const SizedBox(height: 20.0),
      StandardTextFieldComponent(
        hintText: widget.alertData.hintText!,
        isEnabled: true,
        decorationVariant: decorationPriority.standard,
        textFieldController: widget.alertData.controller!,
      ),
      const SizedBox(height: 20.0),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: buttonRow,
      )
    ];

    var centeredAlertControllerContent = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: centeredAlertControllerChildren,
    );

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
