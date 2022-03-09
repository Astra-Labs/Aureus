import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class SingleInputToolTemplate extends ToolCardTemplate {
  SingleInputToolTemplate()
      : super(templatePrompt: 'Single Input', badgeIcon: IconData(0));

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes. Write to dataMap in ActiveCard,
  // and read in SummaryCard.
  var dataMap = [];

  @override
  Widget returnActiveToolCard() {
    var cardController = TextEditingController();

    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          FloatingContainerElement(
              child: Container(
                  decoration: InputBackingDecoration().buildBacking(),
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(controller: cardController))),
          DividerElement(),
          Row(children: [
            SmolButtonElement(
                decorationVariant: decorationPriority.important,
                buttonTitle: 'Next',
                buttonAction: () =>
                    {dataMap.insert(0, cardController.text), onNextCard()}),
            SmolButtonElement(
                decorationVariant: decorationPriority.standard,
                buttonTitle: 'Skip',
                buttonAction: () => {onNextCard()})
          ])
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
        toolChildren: [
          BodyOneText(dataMap.isNotEmpty ? dataMap[0] : 'Tool Skipped',
              decorationPriority.inactive)
        ]);
  }
}
