import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/*--------- BOTTOM ACTION SHEET COMPONENT ----------*/
/// An action sheet on the bottom of the screen. Use when the user
/// can choose more than 2 actions.

class BottomActionSheetComponent extends StatefulWidget {
  /// The [AlertControllerObject] data object that dictates how your alert controller behaves.
  final AlertControllerObject alertData;

  const BottomActionSheetComponent({required this.alertData});

  @override
  _BottomActionSheetComponentState createState() =>
      _BottomActionSheetComponentState();
}

class _BottomActionSheetComponentState
    extends State<BottomActionSheetComponent> {
  @override
  Widget build(BuildContext context) {
    List<Widget> actionButtons = [];

    var screenSize = MediaQuery.of(context).size;
    var actions = widget.alertData.actions;

    for (var element in actions!) {
      actionButtons.add(Padding(
        padding: const EdgeInsets.fromLTRB(0, 5.0, 0.0, 5.0),
        child: StandardButtonElement(
            decorationVariant:
                element.actionSeverity == AlertControllerActionSeverity.confirm
                    ? decorationPriority.important
                    : decorationPriority.standard,
            buttonTitle: element.actionName,
            buttonHint: "Completes the action ${element.actionName}",
            buttonAction: () {
              notificationMaster.resetRequests();
              element.onSelection();
            }),
      ));
    }

    var exitRow = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconBadge(
            badgeIcon: widget.alertData.alertIcon,
            badgePriority: decorationPriority.important),
        const Spacer(),
        IconButtonElement(
            decorationVariant: decorationPriority.standard,
            buttonIcon: Assets.no,
            buttonHint: "Exits action sheet",
            buttonPriority: buttonSize.secondary,
            buttonAction: () => {
                  notificationMaster.resetRequests(),
                })
      ],
    );

    var nonExitRow = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconBadge(
            badgeIcon: widget.alertData.alertIcon,
            badgePriority: decorationPriority.important),
        const Spacer(),
      ],
    );

    var bottomActionSheetContent = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.alertData.canUserExit == true ? exitRow : nonExitRow,
          const SizedBox(height: 20),
          HeadingThreeText(
              widget.alertData.alertTitle, decorationPriority.standard),
          BodyOneText(widget.alertData.alertBody, decorationPriority.standard),
          const SizedBox(height: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: actionButtons,
          ),
        ]);

    var bottomActionSheetContainer = FloatingContainerElement(
      child: Container(
          decoration: CardBackingDecoration(
                  decorationVariant: decorationPriority.inactive)
              .buildBacking(),
          constraints: BoxConstraints(
            maxWidth: size.layoutItemWidth(1, screenSize),
            maxHeight: size.layoutItemHeight(1, screenSize),
          ),
          padding: const EdgeInsets.all(15.0),
          child: bottomActionSheetContent),
    );

    return Semantics.fromProperties(
      properties: SemanticsWrapper.customItem(
          isEnabled: true,
          label: 'Action Sheet - ${widget.alertData.alertTitle}',
          hint: widget.alertData.alertBody,
          isEditable: false,
          isLiveRegion: true),
      child: bottomActionSheetContainer,
    );
  }
}
