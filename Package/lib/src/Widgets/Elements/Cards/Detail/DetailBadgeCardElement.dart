import 'package:aureus/aureus.dart';

/*--------- DETAIL BADGE CARD ----------*/

class DetailBadgeCardElement extends StatelessWidget {
  final decorationPriority decorationVariant;
  final String cardLabel;
  final String cardBody;
  final IconData cardIcon;

  const DetailBadgeCardElement(
      {required this.decorationVariant,
      required this.cardLabel,
      required this.cardBody,
      required this.cardIcon});

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    return Container(
        constraints: BoxConstraints(
            minWidth: size.layoutItemWidth(1, screenSize),
            maxWidth: size.layoutItemWidth(1, screenSize),
            minHeight: size.layoutItemHeight(4, screenSize)),
        decoration:
            CardBackingDecoration(priority: decorationVariant).buildBacking(),
        clipBehavior: Clip.hardEdge,
        child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 10),
                  IconBadge(
                      badgeIcon: cardIcon, badgePriority: decorationVariant),
                  const SizedBox(height: 10),
                  HeadingFourText(cardLabel, decorationVariant),
                  const SizedBox(height: 10),
                  BodyOneText(cardBody, decorationVariant),
                  const SizedBox(height: 10),
                ])));
  }
}
