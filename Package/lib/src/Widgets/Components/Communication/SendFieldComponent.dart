import 'package:aureus/aureus.dart';

//A text field and icon button used to send communications to a receipent
//Doc Link:

class SendFieldComponent extends StatefulWidget {
  final VoidCallback onSend;
  final TextEditingController textEditController;

  const SendFieldComponent(
      {required this.onSend, required this.textEditController});

  @override
  _SendFieldComponentState createState() => _SendFieldComponentState();
}

class _SendFieldComponentState extends State<SendFieldComponent> {
  TextEditingController sendFieldController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    return Container(
      constraints: BoxConstraints(
          minHeight: size.layoutItemHeight(6, screenSize),
          maxHeight: size.layoutItemHeight(5, screenSize),
          maxWidth: size.layoutItemWidth(1, screenSize)),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleDataTypeUserInputElement(
              dataPlaceholder: 'Write message here.',
              itemTextEditingController: widget.textEditController,
              isEnabled: true,
            ),
            SecondaryIconButtonElement(
                buttonIcon: Assets.paperplane,
                buttonAction: widget.onSend,
                buttonHint: 'Sends the value in the text field.',
                decorationVariant: decorationPriority.important)
          ]),
    );
  }
}
