// ignore_for_file: must_be_immutable

import 'dart:ui';
import 'package:aureus/aureus.dart';
import 'package:flutter/semantics.dart';

/// {@category Foundation}

/// A class that builds semantics wrappers for custom UI items.
/// Semantics are important, because they tell assistive technology
/// and SEO crawlers information about the underlying elements.

class SemanticsWrapper extends SemanticsProperties {
  /// Is enabled for user interactions
  bool? isEnabled;

  /// Is able to be interacted with / selected.
  bool? isChecked;

  ///  Is toggled on if it's a switch component
  bool? isToggled;

  ///  Is selected and focused if in a group
  bool? isSelected;

  ///  Is non-interactable and read only
  bool? isReadOnly;

  ///  Is able to have value edited / changed
  bool? isEditable;

  ///  Is able to be uniquely focused on.
  bool? isFocusable;

  ///  Is a mutually exclusive interactable. If one is selected, all of the others are not.
  bool? isMutuallyExclusive;

  ///  Is not shown on the screen.
  bool? isHidden;

  ///  Is obscured on the screen, but can be visible.
  bool? isObscured;

  ///  Is a piece of text that has multiple lines
  bool? isMultiline;

  ///  Is a temporary / time sensitive item that will disappear. Makes
  ///  an annoucement over VoiceReaders
  bool? isLiveRegion;

  /// Wrapper that governs a header that divides a page
  SemanticsWrapper.header({required label})
      : assert(label != ""),
        super(label: label, header: true, readOnly: true);

  /// Wrapper that governs a button
  SemanticsWrapper.button(
      {required this.isEnabled,
      required label,
      required hint,
      required this.isMutuallyExclusive})
      : assert(isEnabled != null &&
            hint != "" &&
            label != "" &&
            isMutuallyExclusive != null),
        super(
            label: label,
            enabled: isEnabled,
            hint: hint,
            inMutuallyExclusiveGroup: isMutuallyExclusive,
            button: true,
            focusable: isEnabled);

  /// Wrapper that governs a toggle
  SemanticsWrapper.toggle(
      {required this.isEnabled,
      required label,
      required hint,
      required this.isToggled,
      required this.isMutuallyExclusive})
      : assert(isEnabled != null &&
            hint != "" &&
            label != "" &&
            isToggled != null &&
            isMutuallyExclusive != null),
        super(
            label: label,
            enabled: isEnabled,
            hint: hint,
            toggled: isToggled,
            focusable: isEnabled,
            inMutuallyExclusiveGroup: isMutuallyExclusive);

  /// Wrapper that governs a progress indicator
  SemanticsWrapper.progressIndicator({required hint, required value})
      : assert(hint != "" && value != null),
        super(
            label: 'Progress Indicator',
            value: 'Progress: $value}',
            hint: hint,
            selected: false,
            focusable: true);

  /// Wrapper that governs a text field with one line
  SemanticsWrapper.textField(
      {required label,
      required hint,
      value = 'Blank text field',
      required this.isEditable,
      required this.isSelected})
      : assert(isEditable != null &&
            hint != "" &&
            label != "" &&
            isSelected != null),
        super(
            multiline: false,
            label: label,
            enabled: isEditable,
            focusable: isEditable,
            selected: isSelected,
            readOnly: isEditable == true ? false : true,
            hint: hint,
            value: value);

  /// Wrapper that governs a text view with multiple lines
  SemanticsWrapper.textView(
      {required label,
      required hint,
      value = 'Blank text view',
      required this.isSelected,
      required this.isEditable})
      : assert(isEditable != null && hint != "" && label != ""),
        super(
            multiline: true,
            label: label,
            enabled: isEditable,
            focusable: isEditable,
            selected: isSelected,
            readOnly: isEditable == true ? false : true,
            hint: hint,
            value: value);

  /// Wrapper that governs a slider
  SemanticsWrapper.slider(
      {required this.isEnabled, required hint, required value})
      : assert(isEnabled != null && hint != "" && value != ""),
        super(
            label: "Slider",
            enabled: isEnabled,
            hint: hint,
            value: value,
            focusable: isEnabled);

  /// Wrapper that governs a custom item
  SemanticsWrapper.customItem(
      {this.isChecked = false,
      this.isToggled = false,
      this.isSelected = false,
      this.isReadOnly = false,
      this.isEditable = false,
      this.isFocusable = false,
      this.isMutuallyExclusive = false,
      this.isHidden = false,
      this.isObscured = false,
      this.isMultiline = false,
      this.isLiveRegion = false,
      value,
      hint,
      required this.isEnabled,
      required label})
      : assert(isEnabled != null && label != ""),
        super(
          label: label,
          checked: isChecked,
          toggled: isToggled,
          selected: isSelected,
          readOnly: isReadOnly,
          inMutuallyExclusiveGroup: isMutuallyExclusive,
          hidden: isHidden,
          obscured: isObscured,
          multiline: isMultiline,
          liveRegion: isLiveRegion,
          value: value,
          hint: hint,
          enabled: isEnabled,
          focusable: isFocusable,
          focused: isSelected,
        );

  /// Wrapper that governs a collection view of items
  SemanticsWrapper.collectionView(
      {required this.isEnabled, required label, required this.isEditable})
      : assert(isEnabled != null && label != ""),
        super(label: label, enabled: isEnabled, focusable: isEnabled);

  /// Wrapper that governs a tab bar
  SemanticsWrapper.tabBar(
      {required this.isEnabled,
      required label,
      required hint,
      required this.isSelected})
      : assert(isEnabled != null &&
            hint != "" &&
            label != "" &&
            isSelected != null),
        super(
            label: label,
            enabled: isEnabled,
            hint: hint,
            selected: isSelected,
            focusable: isEnabled);

  /// Wrapper that governs a view
  SemanticsWrapper.view({required label, required hint})
      : assert(hint != "" && label != ""),
        super(label: label, hint: hint);

  /// Wrapper that declares an item that can be ignored
  SemanticsWrapper.ignorable()
      : super(enabled: false, focusable: false, hidden: true, selected: false);
}

class Accessibility {
  final AccessibilityFeatures accessFeatures =
      WidgetsBinding.instance!.window.accessibilityFeatures;

  /// creates variable that contains MediaQuery information to return proper sizing
  static Size textStringSize(
      {required String textInput,
      required TextStyle textStyle,
      required TextDirection textDirection,
      required MediaQueryData query}) {
    // returns the proper sizing of a string for a given text style with
    //regards to the scale factor to accomodate dynamic text sizing.
    TextPainter textPainter = TextPainter(
        text: TextSpan(text: textInput, style: textStyle),
        textScaleFactor: query.textScaleFactor,
        textDirection: textDirection)
      ..layout(maxWidth: (size.logicalWidth() * 3));

    return textPainter.size;
  }

  /// Creates a text scale factor to adjust for size differences between
  /// mobile, tablet, and web.
  double responsiveTextSize(double base) {
    var screenSize = size.logicalScreenSize();

    double scaleFactor = 0.0;
    double shortSide = screenSize.shortestSide;

    if (shortSide < 550) {
      //needs mobile phone scale
      scaleFactor = 1.1;
    } else if (shortSide >= 550 && shortSide < 900) {
      //needs tablet scale
      scaleFactor = 1.2;
    } else if (shortSide >= 900) {
      //needs web phone scale
      scaleFactor = 1.3;
    }

    return scaleFactor * base;
  }
}
