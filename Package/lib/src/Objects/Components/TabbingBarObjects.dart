import 'package:aureus/aureus.dart';

class TabbingBarObject {
  final List<TabObject> tabObjects;

  const TabbingBarObject({required this.tabObjects})
      : assert(tabObjects.length >= 1);
}

class TabObject {
  late IconData tabIcon;
  late Widget childController;
  late String tabTitle;
  late decorationPriority tabPriority;
  late String accessibilityHint;

  TabObject.forIconTabbing(
      {required this.tabIcon,
      required this.childController,
      required this.tabPriority,
      required this.accessibilityHint});

  TabObject.forTextTabbing(
      {required this.tabTitle,
      required this.childController,
      required this.tabPriority,
      required this.accessibilityHint});
}
