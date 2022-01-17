import 'package:aureus/aureus.dart';

class PrimaryTextFieldComponent extends StatelessWidget {
  final String hintText;
  final decorationPriority decorationVariant;
  final TextEditingController textFieldController;

  const PrimaryTextFieldComponent(
      {required this.hintText,
      required this.decorationVariant,
      required this.textFieldController});

  void dispose() {
    textFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: size.layoutItemWidth(1, size.logicalScreenSize) * 0.6,
        maxHeight: size.layoutItemHeight(6, size.logicalScreenSize) * 0.9,
      ),
      child: TextFormField(
          style: body1().copyWith(
              color: coloration.decorationColor(
                  decorationVariant: decorationVariant)),
          controller: textFieldController,
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: coloration
                          .decorationColor(decorationVariant: decorationVariant)
                          .withOpacity(0.5),
                      width: 1.0)),
              enabledBorder: InputBorder.none,
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                      color: Color.fromRGBO(255, 178, 178, 1.0), width: 1.0)),
              disabledBorder: InputBorder.none,
              hintStyle: subheading()
                  .copyWith(color: coloration.contrastColor().withOpacity(0.7)),
              hintText: hintText),
          autocorrect: false,
          textAlign: TextAlign.left,
          keyboardType: TextInputType.text),
    );
  }
}

class StandardTextFieldComponent extends StatelessWidget {
  final String hintText;
  final decorationPriority decorationVariant;
  final TextEditingController textFieldController;

  const StandardTextFieldComponent(
      {required this.hintText,
      required this.decorationVariant,
      required this.textFieldController});

  @override
  void dispose() {
    textFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: size.layoutItemWidth(1, size.logicalScreenSize) * 0.8,
        maxHeight: size.layoutItemHeight(6, size.logicalScreenSize) * 0.9,
      ),
      child: TextFormField(
          style: body2().copyWith(
              color: coloration.decorationColor(
                  decorationVariant: decorationVariant)),
          controller: textFieldController,
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: coloration
                          .decorationColor(decorationVariant: decorationVariant)
                          .withOpacity(0.5),
                      width: 1.0)),
              enabledBorder: InputBorder.none,
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                      color: Color.fromRGBO(255, 178, 178, 1.0), width: 1.0)),
              disabledBorder: InputBorder.none,
              hintStyle: subheading()
                  .copyWith(color: coloration.contrastColor().withOpacity(0.7)),
              hintText: hintText),
          autocorrect: false,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.text),
    );
  }
}
