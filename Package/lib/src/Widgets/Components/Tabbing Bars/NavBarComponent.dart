import 'package:aureus/aureus.dart';
import 'package:flutter/rendering.dart';

//A scaffold that acts as a standardized tab bar
//Doc Link:

class NavBarComponent extends StatefulWidget {
  //tab items input will be checked to be icon only
  final List<TabObject> tabItems;

  const NavBarComponent({required this.tabItems})
      : assert(tabItems.length >= 2);

  @override
  _NavBarComponentState createState() => _NavBarComponentState();
}

class _NavBarComponentState extends State<NavBarComponent> {
  @override
  Widget build(BuildContext context) {
    Container navigatorScreen = Container(
        constraints: BoxConstraints(
            minWidth: size.widthOf(weight: sizingWeight.w10),
            minHeight: size.layoutItemWidth(5, size.logicalScreenSize),
            maxHeight: size.layoutItemWidth(5, size.logicalScreenSize)));

    Container activeIndicator = Container(
        width: 1,
        color: coloration.decorationColor(
            decorationVariant: decorationPriority.important));

    List<Widget> tabObjects = [];

    for (var item in widget.tabItems) {
      tabObjects.add(Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
        child: InkWell(
          onTap: () {},
          child: Icon(item.tabIcon,
              size: size.widthOf(weight: sizingWeight.w0),
              color: coloration.decorationColor(
                  decorationVariant: item.tabPriority)),
        ),
      ));
    }

    return Container(
        //level 1 - full container that holds nav bar and a secondary widget to contain the widget being selected.
        width: size.widthOf(weight: sizingWeight.w10),
        height: size.layoutItemWidth(5, size.logicalScreenSize),
        child: Container(
            decoration:
                LayerBackingDecoration(priority: decorationPriority.standard)
                    .buildBacking(),
            child: Center(
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: size.layoutItemWidth(1, size.logicalScreenSize),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: tabObjects),
                    )))));
  }
}
