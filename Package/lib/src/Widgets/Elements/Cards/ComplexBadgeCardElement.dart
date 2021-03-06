import 'package:aureus/aureus.dart';

class ComplexBadgeCardElement extends StatelessWidget {
  final decorationPriority decorationVariant;
  final String cardLabel;
  final String cardBody;
  final Map<String, IconData> cardDetailCarousel;
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

    return Container(
        decoration:
            CardBackingDecoration(priority: decorationVariant).buildBacking(),
        constraints: BoxConstraints(
            maxWidth: size.layoutItemWidth(1, screenSize),
            maxHeight: size.layoutItemHeight(3, screenSize)),
        clipBehavior: Clip.hardEdge,
        child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    HeadingFourText(cardLabel, decorationVariant),
                    IconBadge(
                        badgeIcon: cardIcon, badgePriority: decorationVariant)
                  ],
                ),
                SizedBox(height: 10),
                BodyOneText(cardBody, decorationVariant),
                DetailCardCarouselComponent(
                    cardDetailCarousel: cardDetailCarousel)
              ],
            )));
  }
}
