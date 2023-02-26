import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- STANDARD BADGE CARD ----------*/
/// A standard card with an icon.

class StandardBadgeCardElement extends StatelessWidget {
  /// {@macro aureus.decorationPriority}
  decorationPriority decorationVariant;

  /// The text for the main header of the card.
  final String cardLabel;

  /// An icon that describes the card.
  final IconData cardIcon;

  StandardBadgeCardElement(
      {required this.decorationVariant,
      required this.cardLabel,
      required this.cardIcon});

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    var standardBadgeContent = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: IconBadge(
                badgeIcon: cardIcon, badgePriority: decorationVariant)),
        Align(
            alignment: Alignment.bottomLeft,
            child: BodyTwoText(cardLabel, decorationVariant)),
      ],
    );

    var standardBadgeContainer = FloatingContainerElement(
      child: Container(
          constraints: BoxConstraints(
              minWidth: size.layoutItemWidth(4, screenSize),
              maxWidth: size.layoutItemWidth(3, screenSize),
              minHeight: size.layoutItemHeight(4, screenSize),
              maxHeight: size.layoutItemHeight(3, screenSize)),
          decoration:
              CardBackingDecoration(decorationVariant: decorationVariant)
                  .buildBacking(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: standardBadgeContent,
          )),
    );

    var focusContent = Focus(
        onFocusChange: (inFocus) => {
              if (inFocus == true)
                {
                  decorationVariant = decorationPriority.important,
                }
              else
                {
                  decorationVariant = decorationPriority.standard,
                }
            },
        child: standardBadgeContainer);

    return focusContent;
  }
}
