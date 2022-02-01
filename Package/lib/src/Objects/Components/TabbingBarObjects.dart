import 'package:aureus/aureus.dart';

class TabbingBarObject {
  final List<TabObject> tabObjects;

  const TabbingBarObject({required this.tabObjects})
      : assert(tabObjects.length >= 1);
}

class TabObject {
  late IconData tabIcon;
  late String tabTitle;
  late decorationPriority tabPriority;
  late VoidCallback onTabSelection;
  late String accessibilityHint;

  TabObject.forIconTabbing(
      {required this.tabIcon,
      required this.tabPriority,
      required this.onTabSelection,
      required this.accessibilityHint});

  TabObject.forTextTabbing(
      {required this.tabTitle,
      required this.tabPriority,
      required this.onTabSelection,
      required this.accessibilityHint});
}
