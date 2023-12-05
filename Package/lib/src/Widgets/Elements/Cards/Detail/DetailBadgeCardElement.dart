// ignore_for_file: must_be_immutable
import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- DETAIL BADGE CARD ----------*/
/// A detailed card with a header, label, and icon.

class DetailBadgeCardElement extends StatelessWidget {
  /// {@macro aureus.decorationPriority}
  final decorationPriority decorationVariant;

  /// The text for the main header of the card.
  final String cardLabel;

  /// The text for the body content underneath the header.
  final String cardBody;

  /// An icon that describes the card.
  final IconData cardIcon;

  VoidCallback? onTap;

  DetailBadgeCardElement({
    required this.decorationVariant,
    required this.cardLabel,
    required this.cardBody,
    required this.cardIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    var detailBadgeContent = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 10),
          IconBadge(badgeIcon: cardIcon, badgePriority: decorationVariant),
          const SizedBox(height: 10),
          HeadingFourText(cardLabel, decorationVariant),
          const SizedBox(height: 10),
          BodyOneText(cardBody, decorationVariant),
          const SizedBox(height: 10),
        ]);

    var detailBadgeContainer = FloatingContainerElement(
      child: Container(
          constraints: BoxConstraints(
              minWidth: size.layoutItemWidth(1, screenSize),
              maxWidth: size.layoutItemWidth(1, screenSize),
              minHeight: size.layoutItemHeight(4, screenSize)),
          decoration:
              CardBackingDecoration(decorationVariant: decorationVariant)
                  .buildBacking(),
          clipBehavior: Clip.hardEdge,
          child: Padding(
              padding: const EdgeInsets.all(13.0), child: detailBadgeContent)),
    );

    return onTap != null
        ? InteractiveSemanticsWrapper(
            properties: SemanticsWrapper.card(
              isEnabled: decorationVariant == decorationPriority.inactive
                  ? false
                  : true,
              label: cardLabel,
            ),
            child: UniversalGestureDetector(
              onDetect: () => {
                onTap!(),
              },
              child: detailBadgeContainer,
            ))
        : detailBadgeContainer;
  }
}
