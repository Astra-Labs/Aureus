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
  Widget tabChild = Container(color: Colors.white);

  Container activeIndicator = Container(
    height: 2,
    width: 2,
    decoration: BoxDecoration(
        color: coloration.decorationColor(
            decorationVariant: decorationPriority.important),
        shape: BoxShape.circle),
  );

  List<Widget> tabObjects = [];

  for (item in widget) {
      tabObjects.add(Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 20.0),
        child: InkWell(
          onTap: () {
            setState(() {
              item.tabPriority = decorationPriority.important;
              tabChild = item.childController;
            });
          },
          child: Icon(item.tabIcon,
              size: size.widthOf(weight: sizingWeight.w1),
              color: coloration.decorationColor(
                  decorationVariant: item.tabPriority)),
        ),
      ));
    }

  @override
  Widget build(BuildContext context) {


    Expanded navigatorScreen = Expanded(
        child: Container(
            constraints: BoxConstraints(
                minWidth: size.widthOf(weight: sizingWeight.w10),
                minHeight: size.layoutItemWidth(5, size.logicalScreenSize)),
            child: tabChild));

    var navigatorBar = Container(
        //level 1 - full container that holds nav bar and a secondary widget to contain the widget being selected.
        width: size.widthOf(weight: sizingWeight.w10),
        height: size.layoutItemWidth(4, size.logicalScreenSize),
        child: Container(
            alignment: Alignment.bottomCenter,
            decoration: ButtonBackingDecoration(
                    variant: buttonDecorationVariants.edgedRectangle,
                    priority: decorationPriority.inactive)
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

    return Column(
      children: [
        navigatorScreen,
        navigatorBar,
      ],
    );
  }
}
