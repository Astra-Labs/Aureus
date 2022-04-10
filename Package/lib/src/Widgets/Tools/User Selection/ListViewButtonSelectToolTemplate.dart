import 'package:aureus/aureus.dart';

class ListViewButtonSelectToolTemplate extends ToolCardTemplate {
  final Map<String, VoidCallback> listItems;
  //----------------------------------------
  // A map of a string (which describes action to the user),
  // and a corresponding VoidCallback which completes that
  // action if the item is pressed. The user will also be
  // passed to the next card when they push ANY button.

  ListViewButtonSelectToolTemplate(
      {required this.listItems, required templatePrompt, required badgeIcon})
      : assert(listItems.entries.length <= 5,
            "You can't have more than 5 options in a button select card. That would be too overwhelming to the user."),
        super(templatePrompt: templatePrompt, badgeIcon: badgeIcon);

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes. Write to dataMap in ActiveCard,
  // and read in SummaryCard.
  var dataMap = [];

  @override
  Widget returnActiveToolCard() {
    List<Widget> buttonItems = [];

    for (var element in listItems.entries) {
      buttonItems.add(Padding(
        padding: const EdgeInsets.all(12.0),
        child: StandardButtonElement(
            decorationVariant: decorationPriority.standard,
            buttonTitle: element.key,
            buttonHint: 'Selects ${element.key} from the list',
            buttonAction: () => {
                  dataMap.insert(0, element.key),
                  element.value(),
                  onNextCard(),
                }),
      ));
    }

    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: buttonItems,
          )
        ]);
  }

  @override
  Widget returnTemplateSummary() {
    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          BodyOneText(
              dataMap.isNotEmpty ? dataMap[0] : 'List selection skipped.',
              decorationPriority.inactive)
        ]);
  }
}
