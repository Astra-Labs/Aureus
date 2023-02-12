import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class TextViewDataCardElement extends DataDetailCard {
  final TextEditingController textEditingController;
  TextViewDataCardElement(
      {required dataLabel, required this.textEditingController})
      : super(dataLabel: dataLabel);

  var isTextEnabled = false;

  late var textViewElement = TextViewComponent(
      textFieldController: textEditingController,
      hintText: dataLabel,
      isEnabled: isTextEnabled,
      detailLabel: dataLabel);

  @override
  Widget returnReadDataCard() {
    isTextEnabled = false;

    return BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: dataLabel,
      detailChildren: [textViewElement],
    );
  }

  @override
  Widget returnEditDataCard() {
    isTextEnabled = true;

    return BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: dataLabel,
      detailChildren: [textViewElement],
    );
  }
}
