import 'package:aureus/aureus.dart';

class MultipleDataTypeUserInputElement extends StatefulWidget {
  final String dataLabel;
  final String dataPlaceholder;
  final TextEditingController itemTextEditingController =
      TextEditingController();

  MultipleDataTypeUserInputElement(
      {required this.dataLabel, required this.dataPlaceholder});

  @override
  _MultipleDataTypeUserInputElementState createState() =>
      _MultipleDataTypeUserInputElementState();
}

class _MultipleDataTypeUserInputElementState
    extends State<MultipleDataTypeUserInputElement> {
  BoxDecoration userInputBacking = InputBackingDecoration().buildBacking();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TabSubheaderElement(title: widget.dataLabel),
      Padding(padding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0)),
      FloatingContainerElement(
        child: StandardTextFieldComponent(
            decorationVariant: decorationPriority.standard,
            hintText: widget.dataPlaceholder,
            textFieldController: widget.itemTextEditingController),
      ),
    ]);
  }
}
