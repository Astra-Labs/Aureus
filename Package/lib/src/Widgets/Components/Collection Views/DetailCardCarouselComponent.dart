import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/*--------- DETAIL CARD CAROUSEL COMPONENT ----------*/
/// A card that contains a badge and label to describe what the card represents

class DetailCardCarouselComponent extends StatelessWidget {
  final Map<String, IconData> cardDetailCarousel;

  const DetailCardCarouselComponent({required this.cardDetailCarousel});

  @override
  Widget build(BuildContext context) {
    // Due to Flutter's list view taking entire screen height
    // (which doesn't have fixes compatible with current accessibility needs)
    // this carousel is written as dynamically generated cards grouped into a row.

    List<Widget> cardItems = [];

    for (var item in cardDetailCarousel.entries) {
      cardItems.add(Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
        child: DetailCarouselCardElement(
            cardIcon: item.value, cardLabel: item.key),
      ));
    }

    var detailCardCarouselContent = SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: cardItems));

    return Semantics.fromProperties(
      explicitChildNodes: true,
      properties: SemanticsWrapper.collectionView(
          isEnabled: true, label: 'Detail Information', isEditable: false),
      child: detailCardCarouselContent,
    );
  }
}
