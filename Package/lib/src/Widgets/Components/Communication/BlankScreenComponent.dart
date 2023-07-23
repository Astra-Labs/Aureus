import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/*--------- BLANK SCREEN COMPONENT ----------*/
/// Shows a card meant to act as a 'blank' screen placeholder to instruct
/// user on what to do next

class BlankScreenComponent extends StatelessWidget {
  /// The title of the blank screen component
  final String cardTitle;

  /// The body description of the blank screen component.
  final String cardBody;

  const BlankScreenComponent({required this.cardTitle, required this.cardBody});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    var blankScreenContent = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(),
          const IconBadge(
              badgeIcon: Assets.alertmessage,
              badgePriority: decorationPriority.important),
          const SizedBox(height: 8.0),
          HeadingThreeText(cardTitle, decorationPriority.standard),
          const SizedBox(height: 8.0),
          BodyOneText(cardBody, decorationPriority.standard),
          const Spacer(),
        ]);

    var blankScreenContainer = FloatingContainerElement(
      child: Container(
          //this will be the rounded card backing
          constraints: BoxConstraints(
              minHeight: size.layoutItemHeight(2, screenSize),
              maxHeight: size.layoutItemHeight(2, screenSize),
              minWidth: size.layoutItemWidth(1, screenSize),
              maxWidth: size.layoutItemWidth(1, screenSize)),
          decoration: LayerBackingDecoration(
                  decorationVariant: decorationPriority.inactive)
              .buildBacking(),
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: blankScreenContent,
          )),
    );

    return blankScreenContainer;
  }
}
