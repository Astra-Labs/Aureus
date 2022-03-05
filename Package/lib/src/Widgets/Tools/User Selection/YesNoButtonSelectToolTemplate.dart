import 'package:aureus/aureus.dart';

/*

Takes a simple bool response from user in response 
to the prompt. 

*/

class YesNoButtonSelectToolTemplate extends ToolCardTemplate {
  YesNoButtonSelectToolTemplate()
      : super(templatePrompt: '', badgeIcon: IconData(0));

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes. Write to dataMap in ActiveCard,
  // and read in SummaryCard.
  var dataMap = [];

  @override
  Widget returnActiveToolCard() {
    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          Row(
            children: [
              SecondaryIconButtonElement(
                  decorationVariant: decorationPriority.important,
                  buttonIcon: Assets.yes,
                  buttonTooltip: 'Yes',
                  buttonAction: () => {dataMap.insert(0, true), onNextCard()}),
              Spacer(),
              SecondaryIconButtonElement(
                  decorationVariant: decorationPriority.important,
                  buttonIcon: Assets.no,
                  buttonTooltip: 'No',
                  buttonAction: () => {dataMap.insert(0, false), onNextCard()})
            ],
          )
        ]);
  }

  @override
  Widget returnTemplateSummary() {
    //Returns a badge with yes or no icon depending on answer in user map.
    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          IconBadge(
              badgeIcon: dataMap[0] == true ? Assets.yes : Assets.no,
              badgePriority: decorationPriority.important)
        ]);
  }
}
