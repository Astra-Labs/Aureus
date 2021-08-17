import 'package:aureus/Widgets/Elements/Cards/BadgeCardElement.dart';
import 'package:aureus/Widgets/Elements/Cards/StandardCardElement.dart';
import 'package:flutter/cupertino.dart';
import 'package:aureus/foundation.dart';

//A grid collection view that scrolls vertically
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/5%20-%20Components%20(Bricks)/Collection%20Views/Grid%20Cards.md

class GridCardComponent extends StatefulWidget {
  final List<String> cardLabels;
  final List<IconData>? cardIcons;
  final CardType cardType;

  GridCardComponent(this.cardLabels, this.cardType, [this.cardIcons]);

  @override
  _State createState() => _State();
}

class _State extends State<GridCardComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24.25),
          child: Container(
            height: 139.75,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 21.66),
                    child: widget.cardType == CardType.standard
                        ? StandardCardElement(
                            widget.cardLabels[index],
                          )
                        : BadgeCardElement(
                            widget.cardLabels[index],
                            widget.cardIcons![index],
                          ),
                  );
                }),
          ),
        );
      },
      itemCount: 3,
    );
  }
}
