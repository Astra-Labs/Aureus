import 'package:aureus/aureus.dart';

//Shows a card meant to act as a 'blank' screen placeholder to instruct user on what to do next
//Doc Link:

class BlankScreenComponent extends StatefulWidget {
  final String cardTitle;
  final String cardBody;

  const BlankScreenComponent({required this.cardTitle, required this.cardBody});

  @override
  _BlankScreenComponentState createState() => _BlankScreenComponentState();
}

class _BlankScreenComponentState extends State<BlankScreenComponent> {
  @override
  Widget build(BuildContext context) {
    return FloatingContainerElement(
      child: Container(
          //this will be the rounded card backing
          constraints: BoxConstraints(
              minHeight: size.layoutItemHeight(3, size.logicalScreenSize),
              maxHeight: size.layoutItemHeight(2, size.logicalScreenSize),
              minWidth: size.layoutItemWidth(1, size.logicalScreenSize),
              maxWidth: size.layoutItemWidth(1, size.logicalScreenSize)),
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
                  IconBadge(
                      badgeIcon: Assets.alertmessage,
                      badgePriority: decorationPriority.important),
                  HeadingThreeText(
                      widget.cardTitle, decorationPriority.standard),
                  BodyOneText(widget.cardBody, decorationPriority.standard),
                ]),
          )),
    );
  }
}
