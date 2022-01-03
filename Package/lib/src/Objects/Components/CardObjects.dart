import 'package:aureus/aureus.dart';

class CardObject {
  decorationPriority decorationVariant;
  String? cardLabel;
  String? cardBody;
  Map<String, IconData>? cardDetailCarousel;
  IconData? cardIcon;
  VoidCallback? cardAction;

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
