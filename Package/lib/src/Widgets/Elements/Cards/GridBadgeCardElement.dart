import 'package:aureus/aureus.dart';

class GridBadgeCardElement extends StatelessWidget {
  final decorationPriority decorationVariant;
  final String cardLabel;
  final IconData cardIcon;

  const GridBadgeCardElement(
      {required this.decorationVariant,
      required this.cardLabel,
      required this.cardIcon});

  @override
  Widget build(BuildContext context) {
    Size labelSize = Accessibility.textStringSize(
        textInput: cardLabel,
        textStyle: body2(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    return FloatingContainerElement(
      child: Container(
          constraints: BoxConstraints(
              minWidth: size.layoutItemWidth(3, size.logicalScreenSize),
              maxWidth: size.layoutItemWidth(3, size.logicalScreenSize),
              minHeight: size.layoutItemWidth(3, size.logicalScreenSize),
              maxHeight: size.layoutItemWidth(3, size.logicalScreenSize)),
          decoration:
              CardBackingDecoration(priority: decorationVariant).buildBacking(),
          clipBehavior: Clip.hardEdge,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: IconBadge(
                        badgeIcon: cardIcon, badgePriority: decorationVariant)),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                        width: labelSize.width,
                        height: labelSize.height,
                        child: BodyTwoText(cardLabel, decorationVariant))),
              ],
            ),
          )),
    );
  }
}
