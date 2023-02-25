import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- DETAIL CARD ----------*/
/// A detailed card with a header, and label.

class DetailCardElement extends StatelessWidget {
  /// {@macro aureus.decorationPriority}
  final decorationPriority decorationVariant;

  /// The text for the main header of the card.
  final String cardLabel;

  /// The text for the body content underneath the header.
  final String cardBody;

  const DetailCardElement(
      {required this.decorationVariant,
      required this.cardLabel,
      required this.cardBody});

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    var detailCardContent = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HeadingFourText(cardLabel, decorationVariant),
          const Padding(padding: EdgeInsets.fromLTRB(0, 4.0, 0.0, 4.0)),
          BodyOneText(cardBody, decorationVariant),
        ]);

    var detailCardContainer = FloatingContainerElement(
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
              padding: const EdgeInsets.all(13.0), child: detailCardContent)),
    );

    return detailCardContainer;
  }
}
