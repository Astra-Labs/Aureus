import 'package:aureus/aureus.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- COMPLEX CARD ----------*/

class ComplexCardElement extends StatelessWidget {
  ///
  final decorationPriority decorationVariant;

  ///
  final String cardLabel;

  ///
  final String cardBody;

  ///
  final Map<String, IconData> cardDetailCarousel;

  const ComplexCardElement(
      {required this.decorationVariant,
      required this.cardLabel,
      required this.cardBody,
      required this.cardDetailCarousel});

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    var complexCardContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Spacer(),
        HeadingFourText(cardLabel, decorationVariant),
        const SizedBox(height: 20),
        const Spacer(),
        BodyOneText(cardBody, decorationVariant),
        const SizedBox(height: 20),
        DetailCardCarouselComponent(cardDetailCarousel: cardDetailCarousel),
        const Spacer(),
      ],
    );

    var complexCardContainer = Container(
        decoration:
            CardBackingDecoration(priority: decorationVariant).buildBacking(),
        constraints: BoxConstraints(
            maxWidth: size.layoutItemWidth(1, screenSize),
            maxHeight: size.layoutItemHeight(3, screenSize)),
        clipBehavior: Clip.antiAlias,
        child: Padding(
            padding: const EdgeInsets.all(13.0), child: complexCardContent));

    return complexCardContainer;
  }
}
