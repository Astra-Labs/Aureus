import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- VIDEO RECORDING DATA CARD ----------*/

class VideoRecordingDataCardElement extends DataDetailCard {
  VideoRecordingDataCardElement({
    required dataLabel,
    required onFinishEditing,
  }) : super(
          dataLabel: dataLabel,
          onFinishEditing: onFinishEditing,
        );

  @override
  Widget returnReadDataCard() {
    return const BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: "Video",
      detailChildren: [],
    );
  }

  @override
  Widget returnEditDataCard() {
    return const BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: "Video",
      detailChildren: [],
    );
  }
}
