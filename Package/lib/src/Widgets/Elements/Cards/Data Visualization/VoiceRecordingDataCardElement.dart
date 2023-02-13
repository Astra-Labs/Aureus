import 'package:aureus/aureus.dart';

/*--------- VOICE RECORDING DATA CARD ----------*/

class VoiceRecordingDataCardElement extends DataDetailCard {
  VoiceRecordingDataCardElement({required dataLabel})
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
    var cardController = TextEditingController();

    return BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: "",
      detailChildren: const [],
    );
  }
}
