import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- TEXT VIEW DATA CARD ----------*/

class TextViewDataCardElement extends DataDetailCard {
  final TextEditingController textEditingController;
  TextViewDataCardElement(
      {required dataLabel,
      required onFinishEditing,
      required this.textEditingController})
      : super(dataLabel: dataLabel, onFinishEditing: onFinishEditing);

  var isTextEnabled = false;

  late var textViewElement = TextViewComponent(
      textFieldController: textEditingController,
      hintText: dataLabel,
      isEnabled: isTextEnabled,
      prompt: dataLabel);

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
