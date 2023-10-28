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

  VoidCallback? onTap;

  ComplexBadgeCardElement({
    required this.decorationVariant,
    required this.cardLabel,
    required this.cardBody,
    required this.cardDetailCarousel,
    required this.cardIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

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
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        complexBadgeCardTopContent,
        const SizedBox(height: 10),
        BodyOneText(cardBody, decorationVariant),
        const SizedBox(height: 20),
        DetailCardCarouselComponent(cardDetailCarousel: cardDetailCarousel)
      ],
    );

    var complexBadgeContainer = FloatingContainerElement(
        child: Container(
            width: size.layoutItemWidth(1, screenSize),
            decoration:
                CardBackingDecoration(decorationVariant: decorationVariant)
                    .buildBacking(),
            clipBehavior: Clip.antiAlias,
            child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: complexBadgeContent)));

    return onTap != null
        ? InteractiveSemanticsWrapper(
            properties: SemanticsWrapper.card(
              isEnabled: decorationVariant == decorationPriority.inactive
                  ? false
                  : true,
              label: cardLabel,
            ),
            child: GestureDetector(
              onTap: () => {
                onTap!(),
              },
              child: complexBadgeContainer,
            ))
        : complexBadgeContainer;
  }
}
