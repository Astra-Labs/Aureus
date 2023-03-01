import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- PHOTO DATA CARD ----------*/

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
      detailLabel: "",
      detailChildren: [],
    );
  }

  @override
  Widget returnEditDataCard() {
    // var cardController = TextEditingController();

    return const BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: "",
      detailChildren: [],
    );
  }
}
