import 'package:aureus/aureus.dart';

//A text field and icon button used to send communications to a receipent
//Doc Link:

class TextViewComponent extends StatefulWidget {
  final TextEditingController textFieldController;
  final String hintText;
  final bool isEnabled;
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

    var textView = Container(
      constraints: BoxConstraints(
        minHeight: size.layoutItemHeight(3, screenSize),
        maxWidth: size.layoutItemWidth(1, screenSize),
      ),
      child: TextFormField(
          enabled: widget.isEnabled,
          style: body2().copyWith(
              color: coloration.decorationColor(
                  decorationVariant: decorationPriority.standard)),
          controller: widget.textFieldController,
          decoration: InputDecoration(
              fillColor: coloration.inactiveColor(),
              filled: true,
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: coloration.accentColor(), width: 1.0)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: coloration
                          .decorationColor(
                              decorationVariant: decorationPriority.standard)
                          .withOpacity(0.3),
                      width: 1.0)),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(255, 178, 178, 1.0), width: 1.0)),
              disabledBorder: InputBorder.none,
              hintStyle: body2()
                  .copyWith(color: coloration.contrastColor().withOpacity(0.7)),
              hintText: widget.hintText),
          autocorrect: false,
          textAlign: TextAlign.left,
          keyboardType: TextInputType.text),
    );

    return textView;
  }
}
