import 'package:aureus/aureus.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

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

  late var address1TextField = StandardTextFieldComponent(
    isEnabled: isTextEnabled,
    decorationVariant: decorationPriority.standard,
    hintText: '',
    textFieldController: address1TextController,
  );

  late var address2TextField = StandardTextFieldComponent(
    isEnabled: isTextEnabled,
    decorationVariant: decorationPriority.standard,
    hintText: '',
    textFieldController: address2TextController,
  );

  late var cityTextField = StandardTextFieldComponent(
    isEnabled: isTextEnabled,
    decorationVariant: decorationPriority.standard,
    hintText: '',
    textFieldController: cityTextController,
  );

  late var stateTextField = StandardTextFieldComponent(
    isEnabled: isTextEnabled,
    decorationVariant: decorationPriority.standard,
    hintText: '',
    textFieldController: stateTextController,
  );

  late var zipcodeTextField = StandardTextFieldComponent(
    isEnabled: isTextEnabled,
    decorationVariant: decorationPriority.standard,
    hintText: '',
    textFieldController: zipcodeTextController,
  );

  late var countryTextField = StandardTextFieldComponent(
    isEnabled: isTextEnabled,
    decorationVariant: decorationPriority.standard,
    hintText: '',
    textFieldController: countryTextController,
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
