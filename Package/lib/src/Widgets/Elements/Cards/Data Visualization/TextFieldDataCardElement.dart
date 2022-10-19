import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class TextFieldDataCardElement extends DataDetailCard {
  TextFieldDataCardElement() : super(dataLabel: "", detailChildren: []);

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes. Write to dataMap in ActiveCard,
  // and read in SummaryCard.
  var dataMap = [];

  @override
  Widget returnReadDataCard() {
    return BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: "",
      detailChildren: [],
    );
  }

  @override
  Widget returnEditingDataCard() {
    var cardController = TextEditingController();

    return BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: "",
      detailChildren: [],
    );
  }
}
