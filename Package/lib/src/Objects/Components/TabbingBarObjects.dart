import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Objects}
/// {@image <image alt='' src=''>}

/// A wrapper class for a tab bar, with all of the children tab objects
class TabbingBarObject {
  /// The child tab bar objects that will be the "tabs"
  final List<TabObject> tabObjects;

  const TabbingBarObject({required this.tabObjects})
      : assert(tabObjects.length >= 1);
}

/// A class representing a 'tab' in a tab bar.
class TabObject {
  /// The tab's icon
  late IconData tabIcon;

  /// The tab's title
  late String tabTitle;

  /// What should happen when the tab is selected
  late VoidCallback onTabSelection;

  /// An accessibility hint for what happens when something is selected.
  late String accessibilityHint;

  /// What tab priority should be (inactive, standard, etc)
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

/// A class representing a 'tab' in a tab bar that owns a widget.
/// This would be used when you want to link tabs to a view.
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
