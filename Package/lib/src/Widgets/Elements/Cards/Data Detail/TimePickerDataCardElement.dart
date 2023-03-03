import 'package:aureus/aureus.dart';
import 'package:flutter/cupertino.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- TIME PICKER DATA CARD ----------*/
/// For use with a [DataDetailView], allows the user to read and
/// write a date from a storage layer that you implement.

class TimePickerDataCardElement extends DataDetailCard {
  /// The time selected by the user.
  DateTime? time;

  /// The [CupertinoDatePickerMode] that you want to display to the user.
  /// This allows you to use this element for just time, dates, or both.
  CupertinoDatePickerMode mode;

  TimePickerDataCardElement(
      {required dataLabel,
      required onFinishEditing,
      required this.mode,
      this.time})
      : super(dataLabel: dataLabel, onFinishEditing: onFinishEditing);

  @override
  Widget returnReadDataCard() {
    return BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: dataLabel,
      detailChildren: [
        BodyTwoText(
            time == null
                ? "Edit this page to select a date."
                : time!.toString(),
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
          width: size.layoutItemWidth(1, size.logicalScreenSize()),
          height: size.layoutItemHeight(3, size.logicalScreenSize()),
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: time ?? DateTime.now(),
            onDateTimeChanged: (DateTime newDateTime) {
              time = newDateTime;
            },
          ),
        )
      ],
    );
  }
}
