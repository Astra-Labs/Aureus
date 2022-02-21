import 'package:aureus/aureus.dart';

// The base class for a card tool template.
// A CARD is a tool template that doesn't take up a full page, and
// is accessed within a card carousel only. It's used in conjunction with
// other cards, not as a stand alone item.

class BaseCardToolTemplate extends StatefulWidget {
  final bool isActive;
  final IconData cardIcon;
  final String toolPrompt;
  final List<Widget> toolChildren;

  const BaseCardToolTemplate(
      {required this.isActive,
      required this.cardIcon,
      required this.toolPrompt,
      required this.toolChildren});

  @override
  _BaseCardToolTemplateState createState() => _BaseCardToolTemplateState();
}

class _BaseCardToolTemplateState extends State<BaseCardToolTemplate> {
  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    var activeLayout = Container(
        constraints: BoxConstraints(
            maxHeight: size.layoutItemHeight(1, screenSize),
            maxWidth: size.layoutItemWidth(1, screenSize),
            minWidth: size.layoutItemWidth(1, screenSize)),
        decoration:
            CardBackingDecoration(priority: decorationPriority.important)
                .buildBacking(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconBadge(
                  badgeIcon: widget.cardIcon,
                  badgePriority: decorationPriority.standard),
              SizedBox(height: 20.0),
              SubheaderText(widget.toolPrompt, decorationPriority.important),
              SizedBox(height: 20.0),
              Column(children: widget.toolChildren)
            ],
          ),
        ));

    var inactiveLayout = Container();

    //checks if widget is actively engaged, and returns proper layout.
    return widget.isActive ? activeLayout : inactiveLayout;
  }
}
