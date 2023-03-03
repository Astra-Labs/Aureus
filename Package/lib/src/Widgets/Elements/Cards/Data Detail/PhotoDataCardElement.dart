import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- PHOTO DATA CARD ----------*/

/// For use with a [DataDetailView], allows the user to read and
/// write a photo asset from a storage layer that you implement.

class PhotoDataCardElement extends DataDetailCard {
  Image? photo;

  PhotoDataCardElement(
    this.photo, {
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
      detailLabel: "Photo",
      detailChildren: [],
    );
  }

  @override
  Widget returnEditDataCard() {
    // var cardController = TextEditingController();

    return const BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: "Photo",
      detailChildren: [],
    );
  }
}
