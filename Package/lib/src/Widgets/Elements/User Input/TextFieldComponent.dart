import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- TEXT FIELD COMPONENT ----------*/
/// A standard text field component for inputting user data. Good for
/// 1-2 lines of text.

class StandardTextFieldComponent extends StatelessWidget {
  /// A hint to give to the user about what they should type.
  final String hintText;

  /// {@macro aureus.decorationPriority}
  final decorationPriority decorationVariant;

  /// A text editing controller that owns the text field
  final TextEditingController textFieldController;

  /// Whether or not the text field should show the contents of the text field.
  final TextInputFormatter? textInputFormatter;

  /// Whether or not the text field should be enabled for user interaction.
  final bool isEnabled;

  /// Whether or not the text field should show the contents of the text field.
  final bool? isSecureEntry;

  const StandardTextFieldComponent({
    required this.hintText,
    required this.isEnabled,
    required this.decorationVariant,
    required this.textFieldController,
    this.textInputFormatter,
    this.isSecureEntry,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    var focusedBorder = OutlineInputBorder(
        borderSide: BorderSide(color: coloration.accentColor(), width: 1.0));

    var enabledBorder = OutlineInputBorder(
        borderSide: BorderSide(
            color: coloration
                .decorationColor(decorationVariant: decorationVariant)
                .withOpacity(0.3),
            width: 1.0));

    var errorBorder = const OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromRGBO(255, 178, 178, 1.0), width: 1.0));

    var inputDecoration = InputDecoration(
        fillColor: coloration.inactiveColor(),
        filled: true,
        border: InputBorder.none,
        focusedBorder: focusedBorder,
        enabledBorder: enabledBorder,
        errorBorder: errorBorder,
        disabledBorder: InputBorder.none,
        hintStyle: body2()
            .copyWith(color: coloration.contrastColor().withOpacity(0.7)),
        hintText: hintText);

    var textFormField = TextFormField(
        enabled: isEnabled,
        obscureText: isSecureEntry ?? false,
        style: body2().copyWith(
            color: coloration.decorationColor(
                decorationVariant: decorationVariant)),
        controller: textFieldController,
        decoration: inputDecoration,
        autocorrect: false,
        textAlign: TextAlign.left,
        keyboardType: TextInputType.text);

    var container = FloatingContainerElement(
      child: Container(
        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
        constraints: BoxConstraints(
          minWidth: size.layoutItemWidth(2, screenSize),
          maxWidth: size.layoutItemWidth(1, screenSize),
        ),
        child: textFormField,
      ),
    );

    return container;
  }
}
