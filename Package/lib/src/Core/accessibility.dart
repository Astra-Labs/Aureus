import 'dart:ui';
import 'package:aureus/aureus.dart';
import 'package:flutter/semantics.dart';

/*

A class that contains variables, methods, and other items to ensure full 
accessibility compliance. 

*/

enum widgetSemantics {
  enabledButton,
  // enabled button
  // ------------------------------
  disabledButton,
  // disabled button
  // ------------------------------
  selectedButton,
  // selected button
  // ------------------------------
  untoggledSwitchItem,
  // disabled toggle / switch
  // ------------------------------
  toggledSwitchItem,
  // enabled toggle / switch
  // ------------------------------
  link,
  // link to external item
  // ------------------------------
  header,
  // textual header
  // ------------------------------
  disabledTextField,
  // for disabled single line text fields
  // ------------------------------
  enabledTextField,
  // for editable, enabled single line text fields
  // ------------------------------
  disabledTextView,
  // for disabled multi-line text fields
  // ------------------------------
  enabledTextView,
  // for enabled multi-line text fields
  // ------------------------------
  readOnlyTextView,
  // for read-only multi-line text fields
  // ------------------------------
  disabledSlider,
  // for disabled slider items
  // ------------------------------
  enabledSlider,
  // for enabled slider items
  // ------------------------------
  ignorable,
  // for items that should be ignored by a screen reader
  // ------------------------------
  readableText,
  // for read-only text
  // ------------------------------
  temporaryItem,
  // for widgets that only temporarily show up & stay on screen (e.g: time sensitive notification)
  // ------------------------------
  disabledItem,
  // for items that are disabled
  // ------------------------------
  enabledItem,
  // for items that are enabled
  // ------------------------------
  selectedItem,
  // for items that are selected
  // ------------------------------
  interactableCollectionView,
  // a collection view that has items that are interactable
  // ------------------------------
  readOnlyCollectionView,
  // a collection view that has items that are not interactable
  // ------------------------------
  disabledTabBar,
  // a tab bar that is disabled
  // ------------------------------
  enabledTabBar,
  // a tab bar that is enabled
  // ------------------------------
  view,
  // a full-screen view that holds widgets
  // ------------------------------
}

class SemanticsWrapper extends SemanticsProperties {
  bool? isEnabled;
  bool? isChecked;
  bool? isToggled;
  bool? isSelected;
  bool? isReadOnly;
  bool? isEditable;
  bool? isFocusable;
  bool? isMutuallyExclusive;
  bool? isHidden;
  bool? isObscured;
  bool? isMultiline;
  bool? isLiveRegion;
  String? label;
  String? value;
  String? hint;

  // ------------------------------
  // Wrapper that governs a button
  SemanticsWrapper.button(
      {required this.isEnabled, required this.label, required this.hint})
      : assert(isEnabled != null && hint != "" && label != ""),
        super(
            label: label,
            enabled: isEnabled,
            hint: hint,
            button: true,
            focusable: isEnabled);

  // ------------------------------
  // Wrapper that governs a toggle
  SemanticsWrapper.toggle(
      {required this.isEnabled,
      required this.label,
      required this.hint,
      required this.isToggled})
      : assert(isEnabled != null &&
            hint != "" &&
            label != "" &&
            isToggled != null),
        super(
            label: label,
            enabled: isEnabled,
            hint: hint,
            toggled: isToggled,
            focusable: isEnabled);

  // ------------------------------
  // Wrapper that governs a progress indicator
  SemanticsWrapper.progressIndicator(
      {required this.isEnabled,
      required this.label,
      required this.hint,
      required this.isToggled})
      : assert(isEnabled != null &&
            hint != "" &&
            label != "" &&
            isToggled != null),
        super(
            label: label,
            enabled: isEnabled,
            hint: hint,
            toggled: isToggled,
            focusable: isEnabled);

  // ------------------------------
  // Wrapper that governs a text field with one line
  SemanticsWrapper.textField(
      {required this.label,
      required this.hint,
      this.value = 'Blank text field',
      required this.isEditable})
      : assert(isEditable != null && hint != "" && label != ""),
        super(
            multiline: false,
            label: label,
            enabled: isEditable,
            focusable: isEditable,
            readOnly: isEditable,
            hint: hint,
            value: value);

  // ------------------------------
  // Wrapper that governs a text view with multiple lines
  SemanticsWrapper.textView(
      {required this.label,
      required this.hint,
      this.value = 'Blank text view',
      required this.isEditable})
      : assert(isEditable != null && hint != "" && label != ""),
        super(
            multiline: true,
            label: label,
            enabled: isEditable,
            focusable: isEditable,
            readOnly: isEditable,
            hint: hint,
            value: value);

  // ------------------------------
  // Wrapper that governs a slider
  SemanticsWrapper.slider(
      {required this.isEnabled, required this.hint, required this.value})
      : assert(isEnabled != null && hint != "" && value != ""),
        super(
            label: "Slider",
            enabled: isEnabled,
            hint: hint,
            value: value,
            focusable: isEnabled);

  // ------------------------------
  // Wrapper that governs a custom item
  SemanticsWrapper.customItem(
      this.isChecked,
      this.isToggled,
      this.isSelected,
      this.isReadOnly,
      this.isEditable,
      this.isFocusable,
      this.isMutuallyExclusive,
      this.isHidden,
      this.isObscured,
      this.isMultiline,
      this.isLiveRegion,
      this.value,
      this.hint,
      {required this.isEnabled,
      required this.label})
      : assert(isEnabled != null && label != ""),
        super(
          label: label,
          checked: isChecked ?? false,
          toggled: isToggled ?? false,
          selected: isSelected ?? false,
          readOnly: isReadOnly ?? false,
          inMutuallyExclusiveGroup: isMutuallyExclusive ?? false,
          hidden: isHidden ?? false,
          obscured: isObscured ?? false,
          multiline: isMultiline ?? false,
          liveRegion: isLiveRegion ?? false,
          value: value ?? null,
          hint: hint ?? null,
          enabled: isEnabled,
          focusable: isFocusable,
          focused: isSelected,
        );

  // ------------------------------
  // Wrapper that governs a collection view of items
  SemanticsWrapper.collectionView({
    required this.isEnabled,
    required this.label,
    required this.isEditable,
    required this.value,
  })  : assert(isEnabled != null && label != ""),
        super(label: label, enabled: isEnabled, focusable: isEnabled);

  // ------------------------------
  // Wrapper that governs a tab bar
  SemanticsWrapper.tabBar(
      {required this.isEnabled,
      required this.label,
      required this.hint,
      required this.isToggled})
      : assert(isEnabled != null &&
            hint != "" &&
            label != "" &&
            isToggled != null),
        super(
            label: label,
            enabled: isEnabled,
            hint: hint,
            toggled: isToggled,
            focusable: isEnabled);

  // ------------------------------
  // Wrapper that governs a view
  SemanticsWrapper.view(
      {required this.isEnabled,
      required this.label,
      required this.hint,
      required this.isToggled})
      : assert(isEnabled != null &&
            hint != "" &&
            label != "" &&
            isToggled != null),
        super(
            label: label,
            enabled: isEnabled,
            hint: hint,
            toggled: isToggled,
            focusable: isEnabled);

  // ------------------------------
  // Wrapper that declares an item that can be ignored
  SemanticsWrapper.ignorable()
      : super(enabled: false, focusable: false, hidden: true);
}

class Accessibility {
  // returns the proper sizing of a string for a given text style with
  // regards to the scale factor to accomodate dynamic text sizing.

  final AccessibilityFeatures accessFeatures =
      WidgetsBinding.instance!.window.accessibilityFeatures;

  /*Semantics aureusSemanticsObject(widgetSemantics option) {
    var properties = SemanticsProperties();

    switch (option) {
      case widgetSemantics.enabledButton:
        {
          properties = SemanticsProperties();
          break;
        }
      case widgetSemantics.disabledButton:
        {
          properties = SemanticsProperties();
          break;
        }
      case widgetSemantics.selectedButton:
        {
          properties = SemanticsProperties();
          break;
        }
      case widgetSemantics.untoggledSwitchItem:
        {
          properties = SemanticsProperties();
          break;
        }
    }

    return Semantics.fromProperties(properties: properties);
  }*/

  static Size textStringSize(
      {required String textInput,
      required TextStyle textStyle,
      required TextDirection textDirection,
      required MediaQueryData query}) {
    //creates variable that contains MediaQuery information to return proper sizing

    var screenSize = size.logicalScreenSize();

    TextPainter textPainter = TextPainter(
        text: TextSpan(text: textInput, style: textStyle),
        textScaleFactor: query.textScaleFactor,
        textDirection: textDirection)
      ..layout(maxWidth: size.layoutItemWidth(1, screenSize));

    return textPainter.size;
  }

  //Creates a text scale factor to adjust for size differences between
  //mobile, tablet, and web.
  double responsiveTextSize(double base) {
    var screenSize = size.logicalScreenSize();

    double scaleFactor = 0.0;
    double shortSide = screenSize.shortestSide;

    if (shortSide < 550) {
      //needs mobile phone scale
      scaleFactor = 1.1;
    } else if (shortSide >= 550 && shortSide < 900) {
      //needs tablet scale
      scaleFactor = 1.18;
    } else if (shortSide >= 900) {
      //needs web phone scale
      scaleFactor = 1.35;
    }

    return scaleFactor * base;
  }
}

/*

Description: 
A class that takes variables into consideration to properly color the text of different items to match contrast standards
*/

// 🛑
class Coloration {
  //Returns logo for the proper mode.
  Image resourceLogo() {
    if (brightness() == Brightness.light) {
      return resourceValues.lightMode.logo!;
    } else if (brightness() == Brightness.dark) {
      return resourceValues.darkMode.logo!;
    }

    //throws an error because there are only two mode options, so if the function falls through, something has gone wrong.
    throw ("Brightness is returning a mode that doesn't exist");
  }

  //Returns primary image for the proper mode.
  Image primaryImage() {
    if (brightness() == Brightness.light) {
      return resourceValues.lightMode.primaryImage!;
    } else if (brightness() == Brightness.dark) {
      return resourceValues.darkMode.primaryImage!;
    }

    //throws an error because there are only two mode options, so if the function falls through, something has gone wrong.
    throw ("Brightness is returning a mode that doesn't exist");
  }

  //Returns secondary image for the proper mode.
  Image secondaryImage() {
    if (brightness() == Brightness.light) {
      return resourceValues.lightMode.secondaryImage!;
    } else if (brightness() == Brightness.dark) {
      return resourceValues.darkMode.secondaryImage!;
    }

    //throws an error because there are only two mode options, so if the function falls through, something has gone wrong.
    throw ("Brightness is returning a mode that doesn't exist");
  }

  //Coloration for dynamically changing items that use all of the priority variants.
  Color decorationColor({required decorationPriority decorationVariant}) {
    switch (decorationVariant) {
      case decorationPriority.important:
        return sameColor();

      case decorationPriority.inactive:
        return contrastColor().withOpacity(0.6);

      case decorationPriority.standard:
        return contrastColor();

      case decorationPriority.inverted:
        return sameColor();
    }
  }

  //Accent color for the given mode.
  Color accentColor() {
    if (brightness() == Brightness.light) {
      return resourceValues.lightMode.accentColor;
    } else if (brightness() == Brightness.dark) {
      return resourceValues.darkMode.accentColor;
    }

    //throws an error because there are only two mode options, so if the function falls through, something has gone wrong.
    throw ("Brightness is returning a mode that doesn't exist");
  }

  //Returns alternate color to the mode.
  Color contrastColor() {
    if (brightness() == Brightness.light) {
      return black();
    } else if (brightness() == Brightness.dark) {
      return white();
    }

    //throws an error because there are only two mode options, so if the function falls through, something has gone wrong.
    throw ("Brightness is returning a mode that doesn't exist");
  }

  //Returns same color as the mode.
  Color sameColor() {
    if (brightness() == Brightness.light) {
      return white();
    } else if (brightness() == Brightness.dark) {
      return black();
    }

    throw ("Brightness is returning a mode that doesn't exist");
  }

  //Returns inactive color for the mode.
  Color inactiveColor() {
    if (brightness() == Brightness.light) {
      return iron().withOpacity(0.2);
    } else if (brightness() == Brightness.dark) {
      return melt().withOpacity(0.3);
    }

    throw ("Brightness is returning a mode that doesn't exist");
  }

  //returns a decoration priority dynamically based on if the item is active or not.
  decorationPriority itemPriority(bool isActive) {
    if (isActive == true) {
      return decorationPriority.important;
    } else if (isActive == false) {
      return decorationPriority.standard;
    }
    return decorationPriority.inactive;
  }
}
