import 'package:aureus/aureus.dart';

class TabbingBarObject {
  final List<TabObject> tabObjects;

  const TabbingBarObject({required this.tabObjects})
      : assert(tabObjects.length >= 1);
}

class TabObject {
  late IconData tabIcon;
  late String tabTitle;
  late VoidCallback onTabSelection;
  late String accessibilityHint;
  decorationPriority? tabPriority;

  TabObject.forBasicTabbing(
      {required this.tabIcon,
      required this.tabTitle,
      required this.accessibilityHint,
      this.tabPriority});

  TabObject.forIconTabbing(
      {required this.tabIcon,
      required this.onTabSelection,
      required this.accessibilityHint,
      this.tabPriority});

  TabObject.forTextTabbing(
      {required this.tabTitle,
      required this.onTabSelection,
      required this.accessibilityHint,
      this.tabPriority});
}

class ControllerTabObject extends TabObject {
  final Widget tabController;

  ControllerTabObject(
      {required this.tabController,
      required tabTitle,
      required accessibilityHint,
      required tabIcon})
      : super.forBasicTabbing(
            tabTitle: tabTitle,
            tabIcon: tabIcon,
            accessibilityHint: accessibilityHint);
}
