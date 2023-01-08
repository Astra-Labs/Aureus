import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class TextFieldDataCardElement extends DataDetailCard {
  final TextEditingController textEditingController;
  TextFieldDataCardElement(
      {required dataLabel, required this.textEditingController})
      : super(dataLabel: dataLabel, detailChildren: []);

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes.
  var dataMap = [];

  var isTextEnabled = false;

  late var textFieldElement = SingleDataTypeUserInputElement(
    dataPlaceholder: dataLabel,
    itemTextEditingController: textEditingController,
    isEnabled: isTextEnabled,
  );

  @override
  Widget returnReadDataCard() {
    isTextEnabled = false;

    return BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: dataLabel,
      detailChildren: [textFieldElement],
    );
  }

  @override
  Widget returnEditDataCard() {
    isTextEnabled = true;

    return BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: dataLabel,
      detailChildren: [textFieldElement],
    );
  }
}
