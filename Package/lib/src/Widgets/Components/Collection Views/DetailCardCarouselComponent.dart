import 'package:aureus/aureus.dart';

//A card that contains a badge and label to describe what the card represents
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/4%20-%20Elements%20(Materials)/Cards/Badge%20Cards.md

class DetailCardCarouselComponent extends StatelessWidget {
  final Map<String, IconData> cardDetailCarousel;

  const DetailCardCarouselComponent({required this.cardDetailCarousel});

  @override
  Widget build(BuildContext context) {
    // Due to Flutter's list view taking entire screen height
    // (which doesn't have fixes compatiable with current accessibility needs)
    // this carousel is written as dynamically generated cards grouped into a row.

    List<Widget> cardItems = [];

    for (var item in cardDetailCarousel.entries) {
      cardItems.add(Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
        child: DetailCarouselCardElement(
            cardIcon: item.value, cardLabel: item.key),
      ));
    }

    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: cardItems));
  }
}
