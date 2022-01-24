import 'package:aureus/aureus.dart';

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
    return Container(
        constraints: BoxConstraints(
            minWidth: size.layoutItemWidth(1, size.logicalScreenSize),
            maxWidth: size.layoutItemWidth(1, size.logicalScreenSize),
            maxHeight: size.layoutItemHeight(3, size.logicalScreenSize)),
        decoration:
            CardBackingDecoration(priority: decorationVariant).buildBacking(),
        clipBehavior: Clip.hardEdge,
        child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconBadge(
                      badgeIcon: cardIcon, badgePriority: decorationVariant),
                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                  HeadingFourText(cardLabel, decorationVariant),
                  BodyOneText(cardBody, decorationVariant)
                ])));
  }
}
