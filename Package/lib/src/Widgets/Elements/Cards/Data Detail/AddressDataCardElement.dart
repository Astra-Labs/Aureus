import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- ADDRESS DATA CARD ----------*/

/// For use with a [DataDetailView], allows the user to read and
/// write a photo from a storage layer that you implement.

class AddressDataCardElement extends DataDetailCard {
  AddressDataCardElement({
    required dataLabel,
    required onFinishEditing,
  }) : super(
          dataLabel: dataLabel,
          onFinishEditing: onFinishEditing,
        );

  var isTextEnabled = true;

  var address1TextController = TextEditingController();
  var address2TextController = TextEditingController();
  var cityTextController = TextEditingController();
  var stateTextController = TextEditingController();
  var zipcodeTextController = TextEditingController();
  var countryTextController = TextEditingController();

  StandardTextFieldComponent address1TextField() {
    return StandardTextFieldComponent(
      isEnabled: isTextEnabled,
      decorationVariant: decorationPriority.standard,
      hintText: 'Street Address 1',
      textFieldController: address1TextController,
    );
  }

  StandardTextFieldComponent address2TextField() {
    return StandardTextFieldComponent(
      isEnabled: isTextEnabled,
      decorationVariant: decorationPriority.standard,
      hintText: 'Address 2',
      textFieldController: address2TextController,
    );
  }

  StandardTextFieldComponent cityTextField() {
    return StandardTextFieldComponent(
      isEnabled: isTextEnabled,
      decorationVariant: decorationPriority.standard,
      hintText: 'City',
      textFieldController: cityTextController,
    );
  }

  StandardTextFieldComponent stateTextField() {
    return StandardTextFieldComponent(
      isEnabled: isTextEnabled,
      decorationVariant: decorationPriority.standard,
      hintText: 'State',
      textFieldController: stateTextController,
    );
  }

  StandardTextFieldComponent zipcodeTextField() {
    return StandardTextFieldComponent(
      isEnabled: isTextEnabled,
      decorationVariant: decorationPriority.standard,
      hintText: 'Zipcode',
      textFieldController: zipcodeTextController,
    );
  }

  StandardTextFieldComponent countryTextField() {
    return StandardTextFieldComponent(
      isEnabled: isTextEnabled,
      decorationVariant: decorationPriority.standard,
      hintText: 'Country',
      textFieldController: countryTextController,
    );
  }

  late var textControllers = [
    address1TextController,
    address2TextController,
    cityTextController,
    stateTextController,
    zipcodeTextController,
    countryTextController
  ];

  List<StandardTextFieldComponent> textFields() {
    return [
      address1TextField(),
      address2TextField(),
      cityTextField(),
      stateTextField(),
      zipcodeTextField(),
      countryTextField()
    ];
  }

  @override
  Widget returnReadDataCard() {
    isTextEnabled = false;

    return BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: dataLabel,
      detailChildren: [
        Column(
          children: textFields(),
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
          children: textFields(),
        )
      ],
    );
  }
}
