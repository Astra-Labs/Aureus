import 'package:aureus/aureus.dart';

/*--------- YES NO BUTTON SELECT TOOL ----------*/
/*

Takes a simple bool response from user in response 
to the prompt. 

*/

class YesNoButtonSelectToolTemplate extends ToolCardTemplate {
  YesNoButtonSelectToolTemplate({required templatePrompt, required badgeIcon})
      : super(templatePrompt: templatePrompt, badgeIcon: badgeIcon);

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes. Write to dataMap in ActiveCard,
  // and read in SummaryCard.
  var dataMap = [false];

  @override
  Widget returnActiveToolCard() {
    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButtonElement(
                decorationVariant: decorationPriority.important,
                buttonIcon: Assets.no,
                buttonHint: 'Responds no to the prompt.',
                buttonAction: () => {
                  print('Pressed no!'),
                  dataMap.insert(0, false),
                  onNextCard()
                },
                buttonPriority: buttonSize.secondary,
              ),
              const Spacer(),
              IconButtonElement(
                decorationVariant: decorationPriority.important,
                buttonIcon: Assets.yes,
                buttonHint: 'Responds yes to the prompt.',
                buttonAction: () => {
                  print('Pressed yes!'),
                  dataMap.insert(0, true),
                  onNextCard()
                },
                buttonPriority: buttonSize.secondary,
              ),
            ],
          )
        ]);
  }

  @override
  Widget returnTemplateSummary() {
    //Returns a badge with yes or no icon depending on answer in user map.

    if (dataMap.isEmpty == true) {
      throw ('You cannot show a template summary of a tool template without populating dataMap.');
    }

    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          Align(
            alignment: Alignment.centerRight,
            child: IconBadge(
                badgeIcon: dataMap[0] == true ? Assets.yes : Assets.no,
                badgePriority: decorationPriority.important),
          )
        ]);
  }
}
