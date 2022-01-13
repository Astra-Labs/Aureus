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

  List<Widget> tabObjects = [];

  @override
  void setState(VoidCallback fn) {
    widget.tabItems.forEach((element) {
      tabObjects.add(Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 20.0),
        child: InkWell(
          onTap: () {
            setState(() {
              element.tabPriority = decorationPriority.important;
              tabChild = element.childController;
            });
          },
          child: Icon(element.tabIcon,
              size: size.widthOf(weight: sizingWeight.w1),
              color: coloration.decorationColor(
                  decorationVariant: element.tabPriority)),
        ),
      ));
    });
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

    setState(() {});

    return Column(
      children: [
        navigatorScreen,
        navigatorBar,
      ],
    );
  }
}
