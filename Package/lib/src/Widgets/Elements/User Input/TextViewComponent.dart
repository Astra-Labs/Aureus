import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- TEXT VIEW COMPONENT ----------*/
/// A standard text view component for inputting user data. Good for
/// 2+ lines of text.

class TextViewComponent extends StatefulWidget {
  /// A [TextEditingController] in to connect to the component.
  final TextEditingController textFieldController;

  /// A hint about what to input into the text field.
  final String hintText;

  /// Whether or not the text view is enabled
  final bool isEnabled;

  /// The 'prompt' of the text view.
  final String prompt;

  const TextViewComponent(
      {required this.textFieldController,
      required this.hintText,
      required this.isEnabled,
      required this.prompt});

  @override
  _TextViewComponentState createState() => _TextViewComponentState();
}

class _TextViewComponentState extends State<TextViewComponent> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    var focusedBorder = OutlineInputBorder(
        borderSide: BorderSide(color: coloration.accentColor(), width: 1.0));

    var enabledBorder = OutlineInputBorder(
        borderSide: BorderSide(
            color: coloration
                .decorationColor(decorationVariant: decorationPriority.standard)
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
        hintText: widget.hintText);

    var textFormField = TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      enabled: widget.isEnabled,
      style: body2().copyWith(
          color: coloration.decorationColor(
              decorationVariant: decorationPriority.standard)),
      controller: widget.textFieldController,
      decoration: inputDecoration,
      autocorrect: false,
      textAlign: TextAlign.left,
    );

    var textView = Container(
      constraints: BoxConstraints(
        maxWidth: size.layoutItemWidth(1, screenSize),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TabSubheaderElement(title: widget.prompt),
          const SizedBox(height: 10),
          FloatingContainerElement(
            child: textFormField,
          ),
        ],
      ),
    );

    return textView;
  }
}
