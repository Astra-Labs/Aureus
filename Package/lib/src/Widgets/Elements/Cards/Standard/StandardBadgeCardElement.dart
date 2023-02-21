import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- STANDARD BADGE CARD ----------*/

class StandardBadgeCardElement extends StatelessWidget {
  /// {@macro aureus.decorationPriority}
  final decorationPriority decorationVariant;

  ///
  final String cardLabel;

  ///
  final IconData cardIcon;

  const StandardBadgeCardElement(
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

    return standardBadgeContainer;
  }
}
