import 'package:aureus/aureus.dart';
import 'package:aureus/src/Widgets/Components/Input%20Forms/TextFieldComponent.dart';

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
    return Container(
        constraints: BoxConstraints(
            minWidth: size.widthOf(weight: sizingWeight.w3),
            maxWidth: size.widthOf(weight: sizingWeight.w7),
            minHeight: size.heightOf(weight: sizingWeight.w0),
            maxHeight: size.widthOf(weight: sizingWeight.w3)),
        decoration: InputBackingDecoration().buildBacking(),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: PrimaryTextFieldComponent(
                    decorationVariant: decorationPriority.standard,
                    hintText: 'Write message here.',
                    textFieldController: sendFieldController),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SecondaryIconButtonElement(
                    buttonIcon: Icons.airplanemode_active,
                    buttonAction: widget.onSend,
                    buttonTooltip: 'Send Button',
                    decorationVariant: decorationPriority.important),
              )
            ]));
  }
}
