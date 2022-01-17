import 'package:aureus/aureus.dart';

//
//Doc Link:

class SingleDataTypeUserInputElement extends StatefulWidget {
  final String dataPlaceholder;
  TextEditingController itemTextEditingController = TextEditingController();

  SingleDataTypeUserInputElement({required this.dataPlaceholder});

  @override
  _SingleDataTypeUserInputElementState createState() =>
      _SingleDataTypeUserInputElementState();
}

class _SingleDataTypeUserInputElementState
    extends State<SingleDataTypeUserInputElement> {
  BoxDecoration userInputBacking = InputBackingDecoration().buildBacking();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.layoutItemWidth(1, size.logicalScreenSize),
      height: size.layoutItemHeight(6, size.logicalScreenSize),
      child: Container(
          decoration: InputBackingDecoration().buildBacking(),
          child: Center(
            child: StandardTextFieldComponent(
                decorationVariant: decorationPriority.standard,
                hintText: widget.dataPlaceholder,
                textFieldController: widget.itemTextEditingController),
          )),
    );
  }
}
