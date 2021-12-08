import 'package:aureus/aureus.dart';

//A card that contains a badge and label to describe what the card represents
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/4%20-%20Elements%20(Materials)/Cards/Badge%20Cards.md

class BadgeCardElement extends StatelessWidget {
  final String cardLabel;
  final IconData cardIcon;

  const BadgeCardElement({required this.cardLabel, required this.cardIcon});

  @override
  Widget build(BuildContext context) {
    String titleCaseLabel = TitleCase.convertToTitleCase(cardLabel);

    return Container(
      height: 164,
      width: 144.12,
      child: Container(
        decoration: BoxDecoration(
          gradient: foundation.lightGradient(),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: foundation.universalBorder(),
        ),
        child: Padding(
          padding: size.universalPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: foundation.melt(),
                  border: foundation.universalBorder(),
                ),
                width: 39,
                height: 39,
                child: Icon(cardIcon),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 13),
                  child: BodyOneText(titleCaseLabel, modeVariants.light)),
            ],
          ),
        ),
      ),
    );
  }
}
