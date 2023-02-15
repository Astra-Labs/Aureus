import 'package:aureus/aureus.dart';

/*--------- SEND FIELD ----------*/
//A text field and icon button used to send communications to a receipent

class SendFieldComponent extends StatefulWidget {
  final VoidCallback onSend;
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

    var sendFieldContent = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          SingleDataTypeUserInputElement(
            dataPlaceholder: 'Write message here.',
            itemTextEditingController: widget.textEditController,
            isEnabled: true,
          ),
          IconButtonElement(
            buttonIcon: Assets.paperplane,
            buttonAction: widget.onSend,
            buttonHint: 'Sends the value in the text field.',
            decorationVariant: decorationPriority.important,
            buttonPriority: buttonSize.secondary,
          )
        ]);

    var sendFieldContainer = Container(
      constraints: BoxConstraints(
          minHeight: size.layoutItemHeight(6, screenSize),
          maxHeight: size.layoutItemHeight(5, screenSize),
          maxWidth: size.layoutItemWidth(1, screenSize)),
      child: sendFieldContent,
    );

    return sendFieldContainer;
  }
}
