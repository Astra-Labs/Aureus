import 'package:aureus/aureus.dart';
import 'package:aureus/src/Widgets/Elements/User%20Input/TextFieldComponent.dart';

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
    return SizedBox(
      width: size.layoutItemWidth(1, size.logicalScreenSize),
      height: size.layoutItemHeight(6, size.logicalScreenSize),
      child: Container(
          decoration: InputBackingDecoration().buildBacking(),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: PrimaryTextFieldComponent(
                      decorationVariant: decorationPriority.standard,
                      hintText: 'Write message here.',
                      textFieldController: sendFieldController),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: SecondaryIconButtonElement(
                      buttonIcon: Icons.airplanemode_active,
                      buttonAction: widget.onSend,
                      buttonTooltip: 'Send Button',
                      decorationVariant: decorationPriority.important),
                )
              ])),
    );
  }
}
