import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- TEXT FIELD DATA CARD ----------*/
/// For use with a [DataDetailView], allows the user to read and
/// write a single-line text field from a storage layer that you implement.

class TextFieldDataCardElement extends DataDetailCard {
  final TextEditingController textEditingController;
  TextFieldDataCardElement({
    required dataLabel,
    required this.textEditingController,
    required onFinishEditing,
  }) : super(
          dataLabel: dataLabel,
          onFinishEditing: onFinishEditing,
        );

  var isTextEnabled = false;

  StandardTextFieldComponent textFieldElement() {
    return StandardTextFieldComponent(
        hintText: dataLabel,
        isEnabled: isTextEnabled,
        decorationVariant: isTextEnabled
            ? decorationPriority.important
            : decorationPriority.standard,
        textFieldController: textEditingController);
  }

  @override
  Widget returnReadDataCard() {
    isTextEnabled = false;

    return BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: dataLabel,
      detailChildren: [
        textFieldElement(),
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
        textFieldElement(),
      ],
    );
  }
}
