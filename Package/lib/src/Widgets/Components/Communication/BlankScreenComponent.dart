import 'package:aureus/aureus.dart';

//Shows a card meant to act as a 'blank' screen placeholder to instruct user on what to do next
//Doc Link:

class BlankScreenComponent extends StatefulWidget {
  final IconData componentIcon;
  final String cardTitle;
  final String cardBody;

  const BlankScreenComponent(
      {required this.componentIcon,
      required this.cardTitle,
      required this.cardBody});

  @override
  _BlankScreenComponentState createState() => _BlankScreenComponentState();
}

class _BlankScreenComponentState extends State<BlankScreenComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        //this will be the rounded card backing
        decoration:
            LayerBackingDecoration(priority: decorationPriority.inactive)
                .buildBacking(),
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconBadge(
                    badgeIcon: widget.componentIcon,
                    badgePriority: decorationPriority.important),
                HeadingTwoText(widget.cardTitle, decorationPriority.standard),
                BodyOneText(widget.cardBody, decorationPriority.standard),
              ]),
        ));
  }
}
