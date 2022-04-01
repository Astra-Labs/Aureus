import 'package:aureus/aureus.dart';

class ComplexSwitchCardElement extends StatelessWidget {
  final String cardLabel;
  final String cardBody;
  final IconData cardIcon;
  final SwitchComponent switchItem = SwitchComponent();

  ComplexSwitchCardElement(
      {required this.cardLabel,
      required this.cardBody,
      required this.cardIcon});

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      child: Container(
          constraints: BoxConstraints(
              minWidth: size.layoutItemWidth(1, screenSize),
              maxWidth: size.layoutItemWidth(1, screenSize),
              maxHeight: size.layoutItemHeight(3, screenSize)),
          decoration:
              CardBackingDecoration(priority: decorationPriority.inactive)
                  .buildBacking(),
          clipBehavior: Clip.antiAlias,
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconBadge(
                              badgeIcon: cardIcon,
                              badgePriority: decorationPriority.standard),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: SwitchComponent())
                      ],
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                    HeadingFourText(cardLabel, decorationPriority.standard),
                    BodyOneText(cardBody, decorationPriority.standard)
                  ]))),
    );
  }
}
