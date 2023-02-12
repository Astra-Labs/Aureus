import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class VideoRecordingDataCardElement extends DataDetailCard {
  VideoRecordingDataCardElement({required dataLabel})
      : super(dataLabel: dataLabel);

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes.
  var dataMap = [];

  @override
  Widget returnReadDataCard() {
    return BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: "",
      detailChildren: const [],
    );
  }

  @override
  Widget returnEditDataCard() {
    return BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: "",
      detailChildren: const [],
    );
  }
}
