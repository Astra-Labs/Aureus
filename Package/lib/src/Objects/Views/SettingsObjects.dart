import 'package:aureus/aureus.dart';

/// {@category Objects}
/// {@image <image alt='' src=''>}

/// Description:
/// The class that makes up a settings section, which is a grouping of similar
/// settings together.
///
/// Details:
/// -A minimum of 1 setting sections are required to build a [SettingsView] object.
///

class SettingSection {
  /// The title of this section. E.G: Accessibility, Payments, etc.
  final String sectionTitle;

  /// A list of setting items for this section.
  final List<SettingItem> sectionItems;
  const SettingSection({required this.sectionTitle, required this.sectionItems})
      : assert(sectionTitle != '' && sectionItems.length > 2);
}

enum SettingItemType { switchComponent, standardButton, standardIconButton }

class SettingItem {
  SettingItemType itemType;
  SwitchComponent? switchComponent;
  StandardButtonElement? standardButton;
  StandardIconButtonElement? standardIconButton;

  SettingItem.switchComponent(
      {required this.switchComponent,
      this.itemType = SettingItemType.switchComponent})
      : assert(switchComponent != null);

  SettingItem.standardButton(
      {required this.standardButton,
      this.itemType = SettingItemType.standardButton})
      : assert(standardButton != null);

  SettingItem.standardIconButton(
      {required this.standardIconButton,
      this.itemType = SettingItemType.standardIconButton})
      : assert(standardIconButton != null);
}
