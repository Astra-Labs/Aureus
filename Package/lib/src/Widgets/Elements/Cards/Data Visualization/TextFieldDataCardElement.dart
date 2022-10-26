import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class TextFieldDataCardElement extends DataDetailCard {
  TextFieldDataCardElement({required dataLabel})
      : super(dataLabel: dataLabel, detailChildren: []);

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes.
  var dataMap = [];

  @override
  Widget returnReadDataCard() {
    return const BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: "",
      detailChildren: [
        TextField(),
      ],
    );
  }

  @override
  Widget returnEditingDataCard() {
    return const BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: "",
      detailChildren: [
        TextField(),
      ],
    );
  }
}
