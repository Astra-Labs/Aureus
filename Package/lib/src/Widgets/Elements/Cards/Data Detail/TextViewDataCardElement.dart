import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- TEXT VIEW DATA CARD ----------*/
/// For use with a [DataDetailView], allows the user to read and
/// write a multi-line text view from a storage layer that you implement.

class TextViewDataCardElement extends DataDetailCard {
  final TextEditingController textEditingController;
  TextViewDataCardElement(
      {required dataLabel,
      required onFinishEditing,
      required this.textEditingController})
      : super(dataLabel: dataLabel, onFinishEditing: onFinishEditing);

  var isTextEnabled = false;

  TextViewComponent textViewElement() {
    return TextViewComponent(
        textFieldController: textEditingController,
        hintText: dataLabel,
        isEnabled: isTextEnabled,
        prompt: dataLabel);
  }

  @override
  Widget returnReadDataCard() {
    isTextEnabled = false;

    return BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: dataLabel,
      detailChildren: [
        textViewElement(),
      ],
    );
  }

  @override
  Widget returnEditDataCard() {
    isTextEnabled = true;

    return BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: dataLabel,
      detailChildren: [
        textViewElement(),
      ],
    );
  }
}
