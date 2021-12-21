import 'package:aureus/aureus.dart';

//A horizontally scrolling card carousel
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/5%20-%20Components%20(Bricks)/Collection%20Views/Horizontal%20Card%20Carousel.md

class HorizontalCardCarouselComponent extends StatefulWidget {
  final String heading;
  final List<String> cardLabels;
  final List<IconData>? cardIcons;
  final CardType cardType;

  HorizontalCardCarouselComponent(this.heading, this.cardType, this.cardLabels,
      [this.cardIcons]);

  @override
  _HorizontalCardCarouselComponentState createState() =>
      _HorizontalCardCarouselComponentState();
}

class _HorizontalCardCarouselComponentState
    extends State<HorizontalCardCarouselComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingThreeText(widget.heading),
        SizedBox(
          height: 29,
        ),
        Container(
          height: 164,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.cardLabels.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: widget.cardType == CardType.standard
                    ? StandardCardElement(widget.cardLabels[index])
                    : BadgeCardElement(
                        cardLabel: widget.cardLabels[index],
                        cardIcon: widget.cardIcons![index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
