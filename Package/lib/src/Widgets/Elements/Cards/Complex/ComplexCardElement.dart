import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- COMPLEX CARD ----------*/
/// An extremely detailed card meant to give the most amount of information about
/// something to a user, without an icon.

class ComplexCardElement extends StatelessWidget {
  /// {@macro aureus.decorationPriority}
  final decorationPriority decorationVariant;

  /// The text for the main header of the card.
  final String cardLabel;

  /// The text for the body content underneath the header.
  final String cardBody;

  /// A carousel that provides metadata about something.
  final Map<String, IconData> cardDetailCarousel;

  const ComplexCardElement(
      {required this.decorationVariant,
      required this.cardLabel,
      required this.cardBody,
      required this.cardDetailCarousel});

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    var complexCardContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Spacer(),
        HeadingFourText(cardLabel, decorationVariant),
        const SizedBox(height: 20),
        const Spacer(),
        BodyOneText(cardBody, decorationVariant),
        const SizedBox(height: 20),
        DetailCardCarouselComponent(cardDetailCarousel: cardDetailCarousel),
        const Spacer(),
      ],
    );

    var complexCardContainer = Container(
        decoration: CardBackingDecoration(decorationVariant: decorationVariant)
            .buildBacking(),
        constraints: BoxConstraints(
            maxWidth: size.layoutItemWidth(1, screenSize),
            maxHeight: size.layoutItemHeight(3, screenSize)),
        clipBehavior: Clip.antiAlias,
        child: Padding(
            padding: const EdgeInsets.all(13.0), child: complexCardContent));

    return complexCardContainer;
  }
}
