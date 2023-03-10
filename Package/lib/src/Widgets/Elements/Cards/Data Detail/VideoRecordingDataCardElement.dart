import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- VIDEO RECORDING DATA CARD ----------*/
/// For use with a [DataDetailView], allows the user to read and
/// write a video asset from a storage layer that you implement.

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
