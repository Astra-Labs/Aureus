import 'package:aureus/aureus.dart';

/// {@category Widgets}
/// {@subCategory Tools}
/// {@image <image alt='' src=''>}

/*--------- GRID CARD SELECT TOOL ----------*/

class GridCardSelectToolTemplate extends ToolCardTemplate {
  final List<String> cardItems;

  GridCardSelectToolTemplate(
      {required templatePrompt, required badgeIcon, required this.cardItems})
      : super(templatePrompt: templatePrompt, badgeIcon: badgeIcon);

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes. Write to dataMap in ActiveCard,
  // and read in SummaryCard.
  var dataMap = [];

  @override
  Widget returnActiveToolCard() {
    List<Widget> gridItems = [];

    for (var element in cardItems) {
      var cardItem = StandardSelectionCardElement(cardName: element);

      gridItems.add(InkWell(
          onTap: () => {
                if (cardItem.isCardSelected == true)
                  {dataMap.add(element)}
                else if (cardItem.isCardSelected == false)
                  {dataMap.remove(element)}
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
              buttonAction: () => {onNextCard()}),
          const Spacer(),
          SmolButtonElement(
              decorationVariant: dataMap.isEmpty
                  ? decorationPriority.inactive
                  : decorationPriority.important,
              buttonTitle: 'Next',
              buttonHint: 'Goes to the next card.',
              buttonAction: () => {onNextCard()}),
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
    if (dataMap.isEmpty == true) {
      throw ('You cannot show a template summary of a tool template without populating dataMap.');
    }

    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: const []);
  }
}
