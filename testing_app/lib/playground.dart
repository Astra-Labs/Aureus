import 'package:aureus/aureus.dart';
import 'package:test_app/interface_items.dart';

//where all sizing items in aureus are initiated for testing

class Playground {
  CardObject standardCardObject = CardObject.standard(
      decorationPriority.standard, fillerTextHeader, fillerAction);

  CardObject standardIconCardObject = CardObject.standardIcon(
      decorationPriority.standard, fillerTextHeader, fillerIcon1, fillerAction);

  CardObject detailCardObject = CardObject.detailed(decorationPriority.standard,
      fillerTextHeader, fillerTextBody, fillerAction);

  CardObject detailIconCardObject = CardObject.detailedIcon(
      decorationPriority.standard,
      fillerTextHeader,
      fillerTextBody,
      fillerIcon1,
      fillerAction);

  CardObject complexCardObject = CardObject.complex(
      decorationPriority.standard,
      fillerTextHeader,
      fillerTextBody,
      {
        'Detail 1': fillerIcon1,
        'Detail 2': fillerIcon2,
        'Detail 3': fillerIcon3,
        'Detail 4': fillerIcon4,
      },
      fillerAction);

  CardObject complexIconCardObject = CardObject.complexIcon(
      decorationPriority.standard,
      fillerTextHeader,
      fillerTextBody,
      fillerIcon1,
      {
        'Detail 1': fillerIcon1,
        'Detail 2': fillerIcon2,
        'Detail 3': fillerIcon3,
        'Detail 4': fillerIcon4,
      },
      fillerAction);

  //Takes a card object & variant and returns filled out card

  Widget filledCardObject(
      {required cardType cardVariant, required CardObject cardData}) {
    switch (cardVariant) {

      //should be card object type of: standard
      case cardType.standardCard:
        {
          return StandardCardElement(
              decorationVariant: cardData.decorationVariant,
              cardLabel: cardData.cardLabel!);
        }

      //should be card object type of: standardIcon
      case cardType.standardBadgeCard:
        {
          return StandardBadgeCardElement(
              decorationVariant: cardData.decorationVariant,
              cardLabel: cardData.cardLabel!,
              cardIcon: cardData.cardIcon!);
        }

      //should be card object type of: detailed
      case cardType.detailCard:
        {
          return DetailCardElement(
              decorationVariant: cardData.decorationVariant,
              cardLabel: cardData.cardLabel!,
              cardBody: cardData.cardBody!);
        }

      //should be card object type of: detailedIcon
      case cardType.detailBadgeCard:
        {
          return DetailBadgeCardElement(
              decorationVariant: cardData.decorationVariant,
              cardLabel: cardData.cardLabel!,
              cardBody: cardData.cardBody!,
              cardIcon: cardData.cardIcon!);
        }

      //should be card object type of: standardIcon
      case cardType.detailCarouselCard:
        {
          return DetailCarouselCardElement(
              cardLabel: cardData.cardLabel!, cardIcon: cardData.cardIcon!);
        }

      //should be card object type of: complex
      case cardType.complexCard:
        {
          return ComplexCardElement(
              decorationVariant: cardData.decorationVariant,
              cardLabel: cardData.cardLabel!,
              cardBody: cardData.cardBody!,
              cardDetailCarousel: cardData.cardDetailCarousel!);
        }

      //should be card object type of: complexIcon
      case cardType.complexBadgeCard:
        {
          return ComplexBadgeCardElement(
              decorationVariant: cardData.decorationVariant,
              cardLabel: cardData.cardLabel!,
              cardBody: cardData.cardBody!,
              cardDetailCarousel: cardData.cardDetailCarousel!,
              cardIcon: cardData.cardIcon!);
        }

      //should be card object type of: complex
      case cardType.categoryIconDetailCard:
        {
          return CategoryIconDetailCardElement(
              decorationVariant: cardData.decorationVariant,
              cardLabel: cardData.cardLabel!,
              cardBody: cardData.cardBody!,
              cardIcon: cardData.cardIcon!);
        }
    }
  }
}
