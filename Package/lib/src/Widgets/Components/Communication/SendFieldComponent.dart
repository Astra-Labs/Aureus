import 'package:aureus/aureus.dart';

//A text field and icon button used to send communications to a receipent
//Doc Link:

class SendFieldComponent extends StatefulWidget {
  final VoidCallback onSend;

  const SendFieldComponent({required this.onSend});

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
          minWidth: size.layoutItemWidth(1, screenSize),
          maxWidth: size.layoutItemWidth(1, screenSize)),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleDataTypeUserInputElement(
                dataPlaceholder: 'Write message here.'),
            SecondaryIconButtonElement(
                buttonIcon: Assets.paperplane,
                buttonAction: widget.onSend,
                buttonTooltip: 'Send Button',
                decorationVariant: decorationPriority.important)
          ]),
    );
  }
}
