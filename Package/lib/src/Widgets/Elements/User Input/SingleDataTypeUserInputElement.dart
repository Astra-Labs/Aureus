import 'package:aureus/aureus.dart';

class SingleDataTypeUserInputElement extends StatefulWidget {
  final String dataPlaceholder;
  final TextEditingController itemTextEditingController;
  final bool isEnabled;

  const SingleDataTypeUserInputElement(
      {required this.dataPlaceholder,
      required this.itemTextEditingController,
      required this.isEnabled});

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
          textFieldController: widget.itemTextEditingController,
          isEnabled: widget.isEnabled),
    );
  }
}
