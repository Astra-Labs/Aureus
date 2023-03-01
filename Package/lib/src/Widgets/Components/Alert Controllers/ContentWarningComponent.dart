import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/*--------- CONTENT WARNING COMPONENT ----------*/
/// Shows a content warning with a blur over the content behind the item.

class ContentWarningComponent extends StatelessWidget {
  /// The description about the content (e.g: why a warning is being shown)
  final String warningDescription;

  /// A function that determines what to do if the user wants to
  /// continue and see the content.
  final VoidCallback onContinue;

  const ContentWarningComponent(
      {required this.warningDescription, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    var buttonRow = Row(
      children: [
        SmolButtonElement(
            decorationVariant: decorationPriority.standard,
            buttonTitle: 'Continue',
            buttonHint: "Clears the content warning, and continues.",
            buttonAction: () => {onContinue()}),
        const Spacer(),
        SmolButtonElement(
            decorationVariant: decorationPriority.standard,
            buttonTitle: 'Go back',
            buttonHint: "Takes you to the previous screen.",
            buttonAction: () =>
                {Navigator.pop(context), notificationMaster.resetRequests()})
      ],
    );

    var warningLayerContent = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10.0),
        const IconBadge(
            badgeIcon: Assets.alertmessage,
            badgePriority: decorationPriority.important),
        const SizedBox(height: 10.0),
        HeadingThreeText("Content Warning", decorationPriority.standard),
        const SizedBox(height: 10.0),
        BodyOneText(warningDescription, decorationPriority.standard),
        const SizedBox(height: 20.0),
        buttonRow,
        const SizedBox(height: 20.0),
      ],
    );

    var warningLayoutContainer = Container(
        constraints: BoxConstraints(
            minWidth: size.layoutItemWidth(1, screenSize),
            maxWidth: size.layoutItemWidth(1, screenSize)),
        decoration: CardBackingDecoration(
                decorationVariant: decorationPriority.inverted)
            .buildBacking(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: warningLayerContent,
        ));

    return warningLayoutContainer;
  }
}
