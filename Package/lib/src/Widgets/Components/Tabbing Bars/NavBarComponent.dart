import 'package:aureus/aureus.dart';

//A scaffold that acts as a standardized tab bar
//Doc Link:

class NavBarComponent extends StatefulWidget {
  //tab items input will be checked to be icon only
  final List<TabObject> tabItems;
  final modeVariants widgetMode;

  const NavBarComponent({required this.tabItems, required this.widgetMode})
      : assert(tabItems.length >= 2);

  @override
  _NavBarComponentState createState() => _NavBarComponentState();
}

class _NavBarComponentState extends State<NavBarComponent> {
  @override
  Widget build(BuildContext context) {
    Container activeIndicator = Container(
        width: 1,
        color: coloration.decorationColor(
            decorationVariant: decorationPriority.important));

    return Container();
  }
}
