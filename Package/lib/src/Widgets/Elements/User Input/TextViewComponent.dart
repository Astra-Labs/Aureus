import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- TEXT VIEW COMPONENT ----------*/

class TextViewComponent extends StatefulWidget {
  ///
  final TextEditingController textFieldController;

  ///
  final String hintText;

  ///
  final bool isEnabled;

  ///
  final String detailLabel;

  const TextViewComponent(
      {required this.textFieldController,
      required this.hintText,
      required this.isEnabled,
      required this.detailLabel});

  @override
  _TextViewComponentState createState() => _TextViewComponentState();
}

class _TextViewComponentState extends State<TextViewComponent> {
  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

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
        enabled: widget.isEnabled,
        style: body2().copyWith(
            color: coloration.decorationColor(
                decorationVariant: decorationPriority.standard)),
        controller: widget.textFieldController,
        decoration: inputDecoration,
        autocorrect: false,
        textAlign: TextAlign.left,
        keyboardType: TextInputType.text);

    var textView = Container(
      constraints: BoxConstraints(
        minHeight: size.layoutItemHeight(3, screenSize),
        maxWidth: size.layoutItemWidth(1, screenSize),
      ),
      child: textFormField,
    );

    return textView;
  }
}
