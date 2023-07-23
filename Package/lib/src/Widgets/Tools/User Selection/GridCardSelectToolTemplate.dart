import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Tools}
/// {@image <image alt='' src=''>}

/*--------- GRID CARD SELECT TOOL ----------*/
/// A tool template for selecting a grid card.

class GridCardSelectToolTemplate extends ToolCardTemplate {
  final List<String> cardItems;

  GridCardSelectToolTemplate(
      {required templatePrompt, required badgeIcon, required this.cardItems})
      : super(templatePrompt: templatePrompt, badgeIcon: badgeIcon);

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes. Write to dataMap in ActiveCard,
  // and read in SummaryCard.
  List<String> selectedItems = [];

  @override
  Widget returnActiveToolCard() {
    List<Widget> gridItems = [];

    for (var element in cardItems) {
      var cardItem = StandardSelectionCardElement(cardLabel: element);

      gridItems.add(GestureDetector(
          onTap: () => {
                if (cardItem.isCardSelected == true)
                  {
                    selectedItems.add(element),
                  }
                else if (cardItem.isCardSelected == false)
                  {
                    selectedItems.remove(element),
                  }
              },
          child: cardItem));
    }

    var row = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmolButtonElement(
              decorationVariant: decorationPriority.standard,
              buttonTitle: 'Skip',
              buttonHint: 'Skips the current card.',
              buttonAction: () => {
                    onNextCard(),
                  }),
          const Spacer(),
          SmolButtonElement(
              decorationVariant: gridItems.isEmpty
                  ? decorationPriority.inactive
                  : decorationPriority.important,
              buttonTitle: 'Next',
              buttonHint: 'Goes to the next card.',
              buttonAction: () => {
                    onNextCard(),
                  }),
        ]);

    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              runAlignment: WrapAlignment.spaceEvenly,
              runSpacing: 10,
              spacing: 10,
              children: gridItems,
            ),
          ),
          const SizedBox(height: 10.0),
          const DividerElement(),
          const SizedBox(height: 20.0),
          row
        ]);
  }

  @override
  Widget returnTemplateSummary() {
    var noItems =
        BodyOneText("No items selected.", decorationPriority.standard);

    List<Widget> items = [];

    if (selectedItems.isEmpty == false) {
      for (var item in selectedItems) {
        var card = Padding(
            padding: const EdgeInsets.all(3.0),
            child: StandardCardElement(
                decorationVariant: decorationPriority.inactive,
                cardLabel: item));

        items.add(card);
      }
    }

    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: selectedItems.isEmpty ? [noItems] : items);
  }
}
