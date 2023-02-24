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
      : assert(sectionTitle != '' && sectionItems.length >= 1);
}

enum SettingItemType { standardSwitchCard, standardButton, standardIconButton }

class SettingItem {
  SettingItemType itemType;
  StandardSwitchCardElement? standardSwitchCard;
  StandardButtonElement? standardButton;
  StandardIconButtonElement? standardIconButton;

  SettingItem.standardSwitchCard(
      {required this.standardSwitchCard,
      this.itemType = SettingItemType.standardSwitchCard})
      : assert(standardSwitchCard != null);

  SettingItem.standardButton(
      {required this.standardButton,
      this.itemType = SettingItemType.standardButton})
      : assert(standardButton != null);

  SettingItem.standardIconButton(
      {required this.standardIconButton,
      this.itemType = SettingItemType.standardIconButton})
      : assert(standardIconButton != null);
}
