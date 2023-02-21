import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- CATEGORY ICON DETAIL CARD ----------*/

class CategoryIconDetailCardElement extends StatelessWidget {
  /// {@macro aureus.decorationPriority}
  final decorationPriority decorationVariant;

  ///
  final String cardLabel;

  ///
  final String cardBody;

  ///
  final IconData cardIcon;

  const CategoryIconDetailCardElement(
      {required this.decorationVariant,
      required this.cardLabel,
      required this.cardBody,
      required this.cardIcon});

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    var categoryIconDetailContent = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: size.responsiveSize(30.0)),
          Icon(cardIcon,
              size: size.responsiveSize(60),
              color: coloration.decorationColor(
                  decorationVariant: decorationVariant)),
          SizedBox(height: size.responsiveSize(30.0)),
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

    return categoryIconDetailContainer;
  }
}
