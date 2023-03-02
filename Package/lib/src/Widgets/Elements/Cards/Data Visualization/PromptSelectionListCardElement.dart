import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- TEXT FIELD DATA CARD ----------*/

class PromptSelectionCardList extends DataDetailCard {
  // A list that represents all options a user can enable.
  final List<String> allOptions;

  // Whether a user can select one option in the list, or as many as they want.
  final bool isMutuallyExclusive;

  // What options the user currently has selected.
  List<String>? selectedOptions;

  PromptSelectionCardList({
    required dataLabel,
    required this.isMutuallyExclusive,
    required onFinishEditing,
    required this.allOptions,
    this.selectedOptions,
  }) : super(
          dataLabel: dataLabel,
          onFinishEditing: onFinishEditing,
        );

  var isTextEnabled = false;

  @override
  Widget returnReadDataCard() {
    isTextEnabled = false;

    List<Widget> children = [];

    // Checks if the user has selected any options.
    if (selectedOptions == null) {
      var blankItem = const BlankScreenComponent(
          cardTitle: "No options selected.",
          cardBody: "Press the details button to add options.");

      children.add(blankItem);
    } else {
      // If they do, build a scrolling row with the cards that contain
      // their selection.
      List<Widget> selectedChildren = [];

      for (var element in selectedOptions!) {
        var card = Padding(
          padding: const EdgeInsets.all(8.0),
          child: StandardCardElement(
            decorationVariant: decorationPriority.inactive,
            cardLabel: element,
          ),
        );

        selectedChildren.add(card);
      } // end of for-loop

      var scrollWrapper = SizedBox(
        width: size.layoutItemWidth(1, size.logicalScreenSize()),
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: selectedChildren,
            )),
      );

      children = [
        scrollWrapper,
      ];
    }

    return BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: dataLabel,
      detailChildren: children,
    );
  }

  @override
  Widget returnEditDataCard() {
    List<Widget> cards = [];

    // Iterates through all of the options to create a selection card for them.
    for (var element in allOptions) {
      var isCardSelected = false;

      if (selectedOptions?.contains(element) == true) {
        isCardSelected = true;
      }

      var card = StandardSelectionCardElement(
        cardLabel: element,
        isCardSelected: isCardSelected,
      );

      cards.add(card);
    }

    var builder = SizedBox(
      child: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.spaceEvenly,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,
          runSpacing: 15,
          children: cards,
        ),
      ),
    );

    return BaseDataDetailCard(
      isBeingEdited: true,
      detailLabel: dataLabel,
      detailChildren: [
        builder,
      ],
    );
  }
}
