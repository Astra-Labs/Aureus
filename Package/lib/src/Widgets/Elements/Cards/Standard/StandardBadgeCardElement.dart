// ignore_for_file: must_be_immutable

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
    var screenSize = MediaQuery.of(context).size;

    var standardBadgeContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconBadge(badgeIcon: cardIcon, badgePriority: decorationVariant),
        const SizedBox(height: 10.0),
        BodyTwoText(cardLabel, decorationVariant),
      ],
    );

    var standardBadgeContainer = FloatingContainerElement(
      child: Container(
          constraints: BoxConstraints(
              minWidth: size.layoutItemWidth(3, screenSize),
              maxWidth: size.layoutItemWidth(3, screenSize),
              minHeight: size.layoutItemHeight(6, screenSize),
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
