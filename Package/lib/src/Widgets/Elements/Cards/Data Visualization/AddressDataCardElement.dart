import 'package:aureus/aureus.dart';

/*--------- ADDRESS DATA CARD ----------*/

class AddressDataCardElement extends DataDetailCard {
  AddressDataCardElement({required dataLabel}) : super(dataLabel: dataLabel);

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes.
  var dataMap = [];

  var isTextEnabled = true;

  var address1TextController = TextEditingController();
  var address2TextController = TextEditingController();
  var cityTextController = TextEditingController();
  var stateTextController = TextEditingController();
  var zipcodeTextController = TextEditingController();
  var countryTextController = TextEditingController();

  late var address1TextField = SingleDataTypeUserInputElement(
    dataPlaceholder: "Street Address 1",
    itemTextEditingController: address1TextController,
    isEnabled: isTextEnabled,
  );

  late var address2TextField = SingleDataTypeUserInputElement(
    dataPlaceholder: "Street Address 2",
    itemTextEditingController: address2TextController,
    isEnabled: isTextEnabled,
  );

  late var cityTextField = SingleDataTypeUserInputElement(
    dataPlaceholder: "City",
    itemTextEditingController: cityTextController,
    isEnabled: isTextEnabled,
  );

  late var stateTextField = SingleDataTypeUserInputElement(
    dataPlaceholder: "State",
    itemTextEditingController: stateTextController,
    isEnabled: isTextEnabled,
  );

  late var zipcodeTextField = SingleDataTypeUserInputElement(
    dataPlaceholder: "Zipcode",
    itemTextEditingController: zipcodeTextController,
    isEnabled: isTextEnabled,
  );

  late var countryTextField = SingleDataTypeUserInputElement(
    dataPlaceholder: "Country",
    itemTextEditingController: countryTextController,
    isEnabled: isTextEnabled,
  );

  late var textControllers = [
    address1TextController,
    address2TextController,
    cityTextController,
    stateTextController,
    zipcodeTextController,
    countryTextController
  ];

  late var textFields = [
    address1TextField,
    address2TextField,
    cityTextField,
    stateTextField,
    zipcodeTextField,
    countryTextField,
  ];

  @override
  Widget returnReadDataCard() {
    isTextEnabled = false;

    return BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: dataLabel,
      detailChildren: [
        Column(
          children: textFields,
        )
      ],
    );
  }

  @override
  Widget returnEditDataCard() {
    isTextEnabled = true;

    return BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: dataLabel,
      detailChildren: [
        Column(
          children: textFields,
        )
      ],
    );
  }
}
