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
          minWidth: labelSize.width + 40,
          maxWidth: labelSize.width + 50,
          minHeight: labelSize.height + 30,
          maxHeight: labelSize.height + 30),
      decoration: CardBackingDecoration(priority: decorationPriority.inactive)
          .buildBacking(),
      padding: const EdgeInsets.all(8.0),
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
