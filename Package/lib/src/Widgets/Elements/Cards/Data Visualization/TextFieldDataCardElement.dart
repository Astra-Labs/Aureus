import 'package:aureus/aureus.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- TEXT FIELD DATA CARD ----------*/

class TextFieldDataCardElement extends DataDetailCard {
  final TextEditingController textEditingController;
  TextFieldDataCardElement(
      {required dataLabel, required this.textEditingController})
      : super(dataLabel: dataLabel);

  var isTextEnabled = false;

  late var textFieldElement = StandardTextFieldComponent(
      hintText: dataLabel,
      isEnabled: isTextEnabled,
      decorationVariant: isTextEnabled
          ? decorationPriority.important
          : decorationPriority.standard,
      textFieldController: textEditingController);

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
