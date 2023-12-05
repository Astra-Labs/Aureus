// ignore_for_file: must_be_immutable
import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}
///

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

  VoidCallback? onTap;

  ComplexCardElement({
    required this.decorationVariant,
    required this.cardLabel,
    required this.cardBody,
    required this.cardDetailCarousel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    var complexCardContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 20),
        HeadingFourText(cardLabel, decorationVariant),
        const SizedBox(height: 20),
        BodyOneText(cardBody, decorationVariant),
        const SizedBox(height: 20),
        DetailCardCarouselComponent(cardDetailCarousel: cardDetailCarousel),
        const SizedBox(height: 20),
      ],
    );

    var complexCardContainer = FloatingContainerElement(
        child: Container(
            decoration:
                CardBackingDecoration(decorationVariant: decorationVariant)
                    .buildBacking(),
            constraints: BoxConstraints(
              maxWidth: size.layoutItemWidth(1, screenSize),
            ),
            clipBehavior: Clip.antiAlias,
            child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: complexCardContent)));

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
              child: complexCardContainer,
            ))
        : complexCardContainer;
  }
}
