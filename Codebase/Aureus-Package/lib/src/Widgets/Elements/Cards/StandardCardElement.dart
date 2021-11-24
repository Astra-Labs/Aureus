import 'package:aureus/aureus.dart';

//A standardized card element that can be glass, pastel, or white that contains a header that describes the card.
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/4%20-%20Elements%20(Materials)/Cards/Standard%20Cards.md

class StandardCardElement extends StatelessWidget {
  final String _cardLabel;

  StandardCardElement(this._cardLabel);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 164,
      width: 144.12,
      decoration: BoxDecoration(
        gradient: foundation.lightGradient(),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        border: foundation.universalBorder(),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 14, top: 20),
        child: BodyOneText(_cardLabel, modeVariants.light),
      ),
    );
  }
}
