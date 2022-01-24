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
      child: Center(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              FloatingContainerElement(
                child: SizedBox(
                  width: size.layoutItemWidth(1, size.logicalScreenSize) * 0.85,
                  height: size.layoutItemHeight(6, size.logicalScreenSize),
                  child: TextFormField(
                      style: body2().copyWith(
                          color: coloration.decorationColor(
                              decorationVariant: decorationPriority.standard)),
                      controller: sendFieldController,
                      decoration: InputDecoration(
                          fillColor: coloration.inactiveColor(),
                          filled: true,
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: lavender(), width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: coloration
                                      .decorationColor(
                                          decorationVariant:
                                              decorationPriority.standard)
                                      .withOpacity(0.3),
                                  width: 1.0)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(255, 178, 178, 1.0),
                                  width: 1.0)),
                          disabledBorder: InputBorder.none,
                          hintStyle: body2().copyWith(
                              color:
                                  coloration.contrastColor().withOpacity(0.7)),
                          hintText: 'Write message here.'),
                      autocorrect: false,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text),
                ),
              ),
              SecondaryIconButtonElement(
                  buttonIcon: Assets.paperplane,
                  buttonAction: widget.onSend,
                  buttonTooltip: 'Send Button',
                  decorationVariant: decorationPriority.important)
            ]),
      ),
    );
  }
}
