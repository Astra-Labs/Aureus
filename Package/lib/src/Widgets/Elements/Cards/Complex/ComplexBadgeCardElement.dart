import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- COMPLEX BADGE CARD ----------*/
/// An extremely detailed card meant to give the most amount of information about
/// something to a user, with an icon.

class ComplexBadgeCardElement extends StatelessWidget {
  /// {@macro aureus.decorationPriority}
  final decorationPriority decorationVariant;

  /// The text for the main header of the card.
  final String cardLabel;

  /// The text for the body content underneath the header.
  final String cardBody;

  /// A carousel that provides metadata about something.
  final Map<String, IconData> cardDetailCarousel;

  /// An icon that describes the card.
  final IconData cardIcon;

  const ComplexBadgeCardElement(
      {required this.decorationVariant,
      required this.cardLabel,
      required this.cardBody,
      required this.cardDetailCarousel,
      required this.cardIcon});

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    var complexBadgeCardTopContent = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        HeadingFourText(cardLabel, decorationVariant),
        IconBadge(badgeIcon: cardIcon, badgePriority: decorationVariant)
      ],
    );

    var complexBadgeContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        complexBadgeCardTopContent,
        const SizedBox(height: 10),
        BodyOneText(cardBody, decorationVariant),
        DetailCardCarouselComponent(cardDetailCarousel: cardDetailCarousel)
      ],
    );

    var complexBadgeContainer = Container(
        decoration: CardBackingDecoration(decorationVariant: decorationVariant)
            .buildBacking(),
        constraints: BoxConstraints(
            maxWidth: size.layoutItemWidth(1, screenSize),
            maxHeight: size.layoutItemHeight(3, screenSize)),
        clipBehavior: Clip.antiAlias,
        child: Padding(
            padding: const EdgeInsets.all(13.0), child: complexBadgeContent));

    return complexBadgeContainer;
  }
}
