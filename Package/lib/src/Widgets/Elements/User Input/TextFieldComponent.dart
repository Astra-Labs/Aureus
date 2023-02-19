import 'package:aureus/aureus.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- TEXT FIELD COMPONENT ----------*/

class StandardTextFieldComponent extends StatelessWidget {
  ///
  final String hintText;

  ///
  final decorationPriority decorationVariant;

  ///
  final TextEditingController textFieldController;

  ///
  final bool isEnabled;

  const StandardTextFieldComponent({
    required this.hintText,
    required this.isEnabled,
    required this.decorationVariant,
    required this.textFieldController,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    var focusedBorder = OutlineInputBorder(
        borderSide: BorderSide(color: coloration.accentColor(), width: 1.0));

    var enabledBorder = OutlineInputBorder(
        borderSide: BorderSide(
            color: coloration
                .decorationColor(decorationVariant: decorationVariant)
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
        hintText: hintText);

    var textFormField = TextFormField(
        enabled: isEnabled,
        style: body2().copyWith(
            color: coloration.decorationColor(
                decorationVariant: decorationVariant)),
        controller: textFieldController,
        decoration: inputDecoration,
        autocorrect: false,
        textAlign: TextAlign.left,
        keyboardType: TextInputType.text);

    var container = Container(
      constraints: BoxConstraints(
        minWidth: size.layoutItemWidth(2, screenSize),
        minHeight: size.layoutItemHeight(6, screenSize),
        maxWidth: size.layoutItemWidth(1, screenSize),
      ),
      child: textFormField,
    );

    return container;
  }
}
