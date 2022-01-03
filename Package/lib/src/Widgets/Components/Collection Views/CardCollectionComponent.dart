import 'package:aureus/aureus.dart';

//A carousel that contains an icon and label to describe the details of an object
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/5%20-%20Components%20(Bricks)/Collection%20Views/Detail%20Carousel.md

class CardCollectionComponent extends StatefulWidget {
  final List<CardObject> cardObjects;
  final cardType cardVariant;
  final Axis collectionDirection;

  CardCollectionComponent(
      {required this.cardObjects,
      required this.cardVariant,
      required this.collectionDirection})
      : assert(cardObjects.isNotEmpty == true);

  @override
  _CardCollectionComponentState createState() =>
      _CardCollectionComponentState();
}

class _CardCollectionComponentState extends State<CardCollectionComponent> {
  Widget filledCardObject({required CardObject cardData}) {
    switch (widget.cardVariant) {

      //should be card object type of:
      case cardType.StandardCard:
        {
          return StandardCardElement(
              decorationVariant: cardData.decorationVariant,
              cardLabel: cardData.cardLabel!);
        }

      //should be card object type of:
      case cardType.StandardBadgeCard:
        {
          return StandardBadgeCardElement(
              decorationVariant: cardData.decorationVariant,
              cardLabel: cardData.cardLabel!,
              cardIcon: cardData.cardIcon!);
        }

      //should be card object type of:
      case cardType.DetailCard:
        {
          return DetailCardElement(
              decorationVariant: cardData.decorationVariant,
              cardLabel: cardData.cardLabel!,
              cardBody: cardData.cardBody!);
        }

      //should be card object type of:
      case cardType.DetailBadgeCard:
        {
          return DetailBadgeCardElement(
              decorationVariant: cardData.decorationVariant,
              cardLabel: cardData.cardLabel!,
              cardBody: cardData.cardBody!,
              cardIcon: cardData.cardIcon!);
        }

      //should be card object type of:
      case cardType.DetailCarouselCard:
        {
          return DetailCarouselCardElement(
              cardLabel: cardData.cardLabel!, cardIcon: cardData.cardIcon!);
        }

      //should be card object type of:
      case cardType.ComplexCard:
        {
          return ComplexCardElement(
              decorationVariant: cardData.decorationVariant,
              cardLabel: cardData.cardLabel!,
              cardBody: cardData.cardBody!,
              cardDetailCarousel: cardData.cardDetailCarousel!);
        }

      //should be card object type of:
      case cardType.ComplexBadgeCard:
        {
          return ComplexBadgeCardElement(
              decorationVariant: cardData.decorationVariant,
              cardLabel: cardData.cardLabel!,
              cardBody: cardData.cardBody!,
              cardDetailCarousel: cardData.cardDetailCarousel!,
              cardIcon: cardData.cardIcon!);
        }

      //should be card object type of:
      case cardType.CategoryIconDetailCard:
        {
          return CategoryIconDetailCardElement(
              decorationVariant: cardData.decorationVariant,
              cardLabel: cardData.cardLabel!,
              cardBody: cardData.cardBody!,
              cardIcon: cardData.cardIcon!);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            scrollDirection: widget.collectionDirection,
            itemBuilder: (BuildContext context, int index) {
              var currentItem = widget.cardObjects[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    splashColor: aureusVariables.prodColor,
                    onTap: currentItem.decorationVariant !=
                            decorationPriority.inactive
                        ? currentItem.cardAction
                        : null,
                    child: filledCardObject(cardData: currentItem)),
              );
            }));
  }
}
