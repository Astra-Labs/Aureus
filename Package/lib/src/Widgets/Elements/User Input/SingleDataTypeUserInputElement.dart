import 'package:aureus/aureus.dart';

class SingleDataTypeUserInputElement extends StatefulWidget {
  final String dataPlaceholder;
  final TextEditingController itemTextEditingController =
      TextEditingController();

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
    return FloatingContainerElement(
      child: StandardTextFieldComponent(
          decorationVariant: decorationPriority.standard,
          hintText: widget.dataPlaceholder,
          textFieldController: widget.itemTextEditingController),
    );
  }
}
