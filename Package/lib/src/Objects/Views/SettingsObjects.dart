import 'package:aureus/aureus.dart';

/// {@category Objects}
/// {@image <image alt='' src=''>}

/// The class that makes up a settings section, which is a grouping of similar
/// settings together.
/// A minimum of 1 setting sections are required to build a [SettingsView] object.

class SettingSection {
  /// The title of this section. E.G: Accessibility, Payments, etc.
  final String sectionTitle;

  /// A list of setting items for this section.
  final List<SettingItem> sectionItems;
  const SettingSection({required this.sectionTitle, required this.sectionItems})
      : assert(sectionTitle != '' && sectionItems.length >= 1);
}

enum SettingItemType { standardSwitchCard, standardButton, standardIconButton }

/// An item that's linked to a button, or a switch. This makes up the content of
/// a [SettingSection]

class SettingItem {
  // An internal enum to determine what 'type' of SettingItem it is.
  // This is set automatically in the constructors, so you don't need to set it.
  SettingItemType itemType;

  /// The switch card to enable / disable an option.
  StandardSwitchCardElement? standardSwitchCard;

  /// A standard button to act on.
  StandardButtonElement? standardButton;

  /// A standard icon button to act on.
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
