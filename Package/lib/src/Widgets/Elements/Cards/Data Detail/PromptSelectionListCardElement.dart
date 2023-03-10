import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- PROMPT SELECTION LIST ----------*/
/// For use with a [DataDetailView], allows the user to read and
/// write a photo from a storage layer that you implement.

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

  // Creates a ledger with true / false values for all options
  Map<String, StandardSelectionCardElement> returnLedger() {
    Map<String, StandardSelectionCardElement> ledger = {};

    for (var element in allOptions) {
      if (selectedOptions != null && selectedOptions!.contains(element)) {
        ledger[element] = StandardSelectionCardElement(
          cardLabel: element,
          isCardSelected: true,
          onSelection: () => {
            if (selectedOptions != null &&
                selectedOptions?.contains(element) == true)
              {
                selectedOptions!.remove(element),
              }
            else if (selectedOptions != null &&
                selectedOptions?.contains(element) == false)
              {
                selectedOptions!.add(element),
              }
          },
        );
      } else {
        ledger[element] = ledger[element] = StandardSelectionCardElement(
          cardLabel: element,
          isCardSelected: false,
          onSelection: () => {
            if (selectedOptions != null &&
                selectedOptions?.contains(element) == true)
              {
                selectedOptions!.remove(element),
              }
            else if (selectedOptions != null &&
                selectedOptions?.contains(element) == false)
              {
                selectedOptions!.add(element),
              }
          },
        );
      }
    }

    return ledger;
  }

  @override
  Widget returnReadDataCard() {
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

      var allCards = returnLedger();

      for (var item in allCards.entries) {
        var itemCard = item.value;
        if (itemCard.isCardSelected == true) {
          itemCard.isEnabled = false;

          var card = Padding(
            padding: const EdgeInsets.all(8.0),
            child: itemCard,
          );

          selectedChildren.add(card);
        }
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

    var allCards = returnLedger();

    for (var item in allCards.entries) {
      var itemCard = item.value;

      var card = Padding(
        padding: const EdgeInsets.all(8.0),
        child: itemCard,
      );

      cards.add(card);
    } // end of for-loop

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
