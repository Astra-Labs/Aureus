import 'package:aureus/aureus.dart';

//Shows a card meant to act as a 'blank' screen placeholder to instruct user on what to do next
//Doc Link:

class BlankScreenComponent extends StatelessWidget {
  final String cardTitle;
  final String cardBody;

  const BlankScreenComponent({required this.cardTitle, required this.cardBody});

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    return FloatingContainerElement(
      child: Container(
          //this will be the rounded card backing
          constraints: BoxConstraints(
              minHeight: size.layoutItemHeight(2, screenSize),
              maxHeight: size.layoutItemHeight(2, screenSize),
              minWidth: size.layoutItemWidth(1, screenSize),
              maxWidth: size.layoutItemWidth(1, screenSize)),
          decoration:
              LayerBackingDecoration(priority: decorationPriority.inactive)
                  .buildBacking(),
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(),
                  IconBadge(
                      badgeIcon: Assets.alertmessage,
                      badgePriority: decorationPriority.important),
                  const SizedBox(height: 8.0),
                  HeadingThreeText(cardTitle, decorationPriority.standard),
                  const SizedBox(height: 8.0),
                  BodyOneText(cardBody, decorationPriority.standard),
                  const Spacer(),
                ]),
          )),
    );
  }
}
