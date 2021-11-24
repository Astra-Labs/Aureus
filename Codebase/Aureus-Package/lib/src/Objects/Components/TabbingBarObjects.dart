import 'package:aureus/aureus.dart';

class TabbingBarObject {
  final List<TabObject> tabObjects;

  const TabbingBarObject({required this.tabObjects})
      : assert(tabObjects.length >= 1);
}

class TabObject {
  late Icon tabIcon;
  late VoidCallback onTabSelection;
  late String tabTitle;
  late String accessibilityHint;

  TabObject.forIconTabbing(
      {required this.tabIcon,
      required this.onTabSelection,
      required this.accessibilityHint});

  TabObject.forTextTabbing(
      {required this.tabTitle,
      required this.onTabSelection,
      required this.accessibilityHint});
}
