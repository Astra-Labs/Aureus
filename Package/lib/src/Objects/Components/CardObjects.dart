import 'package:aureus/aureus.dart';

class AureusCards {
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

class CardObject {
  decorationPriority decorationVariant;
  String? cardLabel;
  String? cardBody;
  Map<String, IconData>? cardDetailCarousel;
  IconData? cardIcon;
  VoidCallback? cardAction;

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

  //standard card with header and action
  CardObject.standard(this.decorationVariant, this.cardLabel, this.cardAction)
      : assert(cardLabel != '', cardAction != null);

  //standard card with header and action that includes an icon
  CardObject.standardIcon(
      this.decorationVariant, this.cardLabel, this.cardIcon, this.cardAction)
      : assert(cardLabel != '' && cardIcon != null && cardAction != null);

  //detailed card with header, subheader / body text, and action
  CardObject.detailed(
      this.decorationVariant, this.cardLabel, this.cardBody, this.cardAction)
      : assert(cardLabel != '' && cardBody != '' && cardAction != null);

  //detailed card with header, subheader / body text, icon, and action
  CardObject.detailedIcon(this.decorationVariant, this.cardLabel, this.cardBody,
      this.cardIcon, this.cardAction)
      : assert(cardLabel != '' &&
            cardBody != '' &&
            cardIcon != null &&
            cardAction != null);

  //complex card with header, subheader / body text, detail carousel, and action
  CardObject.complex(this.decorationVariant, this.cardLabel, this.cardBody,
      this.cardDetailCarousel, this.cardAction)
      : assert(cardLabel != '' &&
            cardBody != '' &&
            cardDetailCarousel != null &&
            cardAction != null);

  //complex card with header, subheader / body text, detail carousel, icon, and action
  CardObject.complexIcon(this.decorationVariant, this.cardLabel, this.cardBody,
      this.cardIcon, this.cardDetailCarousel, this.cardAction)
      : assert(cardLabel != '' &&
            cardBody != '' &&
            cardIcon != null &&
            cardDetailCarousel != null &&
            cardAction != null);
}
