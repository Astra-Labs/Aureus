import 'package:aureus/aureus.dart';

class DetailCarouselCardElement extends StatelessWidget {
  final String cardLabel;
  final IconData cardIcon;

  const DetailCarouselCardElement(
      {required this.cardLabel, required this.cardIcon});

  @override
  Widget build(BuildContext context) {
    Size labelSize = Accessibility.textStringSize(
        textInput: cardLabel,
        textStyle: tag2(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    return Container(
      constraints: BoxConstraints(
          minWidth: labelSize.width * 2,
          maxWidth: size.layoutItemWidth(3, size.logicalScreenSize),
          minHeight: size.heightOf(weight: sizingWeight.w0),
          maxHeight: size.heightOf(weight: sizingWeight.w1)),
      decoration: CardBackingDecoration(priority: decorationPriority.inactive)
          .buildBacking(),
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(cardIcon, color: coloration.contrastColor().withOpacity(0.8)),
          Text(cardLabel.toUpperCase(),
              style: tag2().copyWith(color: coloration.contrastColor()),
              textAlign: TextAlign.right)
        ],
      ),
    );
  }
}
