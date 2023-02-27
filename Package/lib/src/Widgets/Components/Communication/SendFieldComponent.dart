import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/*--------- SEND FIELD ----------*/
/// A text field and icon button used to send communications to a receipent

class SendFieldComponent extends StatefulWidget {
  /// What to do when the user presses send
  final VoidCallback onSend;

  /// A text editor linked to the send field
  final TextEditingController textEditController;

  const SendFieldComponent(
      {required this.onSend, required this.textEditController});

  @override
  _SendFieldComponentState createState() => _SendFieldComponentState();
}

class _SendFieldComponentState extends State<SendFieldComponent> {
  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    const errorOutlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide:
            BorderSide(color: Color.fromRGBO(255, 178, 178, 1.0), width: 1.0));

    var standardOutlineInputBorder = OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
            color: coloration
                .decorationColor(decorationVariant: decorationPriority.standard)
                .withOpacity(0.3),
            width: 1.0));

    var importantOutlineInputBorder = OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: coloration.accentColor(), width: 1.0));

    var sendFieldIcon = Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButtonElement(
        buttonIcon: Assets.paperplane,
        buttonAction: widget.onSend,
        buttonHint: 'Sends the message you wrote.',
        decorationVariant: decorationPriority.standard,
        buttonPriority: buttonSize.secondary,
      ),
    );

    var inputDecoration = InputDecoration(
        fillColor: coloration.contrastColor().withOpacity(0.15),
        filled: true,
        suffixIcon: sendFieldIcon,
        border: InputBorder.none,
        focusedBorder: importantOutlineInputBorder,
        enabledBorder: standardOutlineInputBorder,
        errorBorder: errorOutlineInputBorder,
        disabledBorder: InputBorder.none,
        hintStyle: body2()
            .copyWith(color: coloration.contrastColor().withOpacity(0.7)),
        hintText: "Send here");

    var sendFieldContainer = SizedBox(
        width: size.layoutItemWidth(1, screenSize),
        height: size.layoutItemHeight(6, screenSize),
        child: FloatingContainerElement(
          child: TextFormField(
              style: body2().copyWith(
                  color: coloration.decorationColor(
                      decorationVariant: decorationPriority.standard)),
              controller: widget.textEditController,
              decoration: inputDecoration,
              autocorrect: false,
              textAlign: TextAlign.left,
              keyboardType: TextInputType.text),
        ));

    return sendFieldContainer;
  }
}
