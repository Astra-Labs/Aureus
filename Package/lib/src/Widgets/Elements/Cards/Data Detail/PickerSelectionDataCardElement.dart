import 'package:aureus/aureus.dart';
import 'package:flutter/cupertino.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- PICKER SELECTION DATA CARD ----------*/
/// For use with a [DataDetailView], allows the user to read and
/// write a single selection from a picker of multiple selections.

class TimePickerDataCardElement extends DataDetailCard {
  /// All options available to a user.
  List<String> allOptions;

  /// The string that the user has selected as their choice.
  String? userSelectedOption;

  TimePickerDataCardElement({
    required dataLabel,
    required onFinishEditing,
    required this.allOptions,
    this.userSelectedOption,
  }) : super(dataLabel: dataLabel, onFinishEditing: onFinishEditing);

  @override
  Widget returnReadDataCard() {
    return BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: dataLabel,
      detailChildren: [
        BodyTwoText(
            userSelectedOption == null
                ? "Edit this page to select an item."
                : userSelectedOption!.toString(),
            decorationPriority.standard)
      ],
    );
  }

  @override
  Widget returnEditDataCard() {
    return BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: dataLabel,
      detailChildren: [
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}
