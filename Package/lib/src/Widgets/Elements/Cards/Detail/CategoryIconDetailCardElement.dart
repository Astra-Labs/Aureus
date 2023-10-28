import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- CATEGORY ICON DETAIL CARD ----------*/
/// A card that's meant to act as a major CTA, or to denote a category.

class CategoryIconDetailCardElement extends StatelessWidget {
  /// {@macro aureus.decorationPriority}
  final decorationPriority decorationVariant;

  /// The text for the main header of the card.
  final String cardLabel;

  /// The text for the body content underneath the header.
  final String cardBody;

  /// An icon that describes the card.
  final IconData cardIcon;

  VoidCallback? onTap;

  CategoryIconDetailCardElement({
    required this.decorationVariant,
    required this.cardLabel,
    required this.cardBody,
    required this.cardIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    var categoryIconDetailContent = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
              height: size.responsiveSize(30.0, MediaQuery.of(context).size)),
          Icon(cardIcon,
              size: size.responsiveSize(60, MediaQuery.of(context).size),
              color: coloration.decorationColor(
                  decorationVariant: decorationVariant)),
          SizedBox(
              height: size.responsiveSize(30.0, MediaQuery.of(context).size)),
          Text(cardLabel.toUpperCase(),
              textAlign: TextAlign.center,
              style: heading4().copyWith(
                color: coloration.decorationColor(
                    decorationVariant: decorationVariant),
              )),
          const SizedBox(height: 5.0),
          Text(cardBody,
              textAlign: TextAlign.center,
              style: body1().copyWith(
                color: coloration.decorationColor(
                    decorationVariant: decorationVariant),
              )),
          const SizedBox(height: 10.0),
        ]);

    var categoryIconDetailContainer = FloatingContainerElement(
      child: Container(
          //this will be the rounded card backing
          constraints: BoxConstraints(
              maxWidth: size.layoutItemWidth(2, screenSize) * 0.9),
          decoration:
              CardBackingDecoration(decorationVariant: decorationVariant)
                  .buildBacking(),
          alignment: Alignment.center,
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: categoryIconDetailContent,
          )),
    );

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
              child: categoryIconDetailContainer,
            ))
        : categoryIconDetailContainer;
  }
}
