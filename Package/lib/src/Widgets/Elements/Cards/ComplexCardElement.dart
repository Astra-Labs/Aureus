import 'package:aureus/aureus.dart';

//A card that contains a badge and label to describe what the card represents
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/4%20-%20Elements%20(Materials)/Cards/Badge%20Cards.md

class ComplexCardElement extends StatelessWidget {
  final decorationPriority decorationVariant;
  final String cardLabel;
  final String cardBody;
  final Map<String, IconData> cardDetailCarousel;

  const ComplexCardElement(
      {required this.decorationVariant,
      required this.cardLabel,
      required this.cardBody,
      required this.cardDetailCarousel});

  @override
  Widget build(BuildContext context) {
    Size labelSize = Accessibility.textStringSize(
        widthLimit: size.layoutItemWidth(2, size.logicalScreenSize),
        textInput: cardLabel,
        textStyle: foundation.heading4(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    Size bodySize = Accessibility.textStringSize(
        widthLimit: size.layoutItemWidth(2, size.logicalScreenSize),
        textInput: cardLabel,
        textStyle: foundation.body1(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    return Container(
        decoration:
            CardBackingDecoration(priority: decorationVariant).buildBacking(),
        constraints: BoxConstraints(
            maxWidth: size.layoutItemWidth(1, size.logicalScreenSize),
            maxHeight: size.layoutItemHeight(3, size.logicalScreenSize)),
        clipBehavior: Clip.hardEdge,
        child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                HeadingFourText(cardLabel, decorationVariant),
                BodyOneText(cardBody, decorationVariant),
                DetailCardCarouselComponent(
                    cardDetailCarousel: cardDetailCarousel)
              ],
            )));
  }
}
