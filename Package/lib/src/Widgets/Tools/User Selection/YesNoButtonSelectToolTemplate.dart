import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Tools}
/// {@image <image alt='' src=''>}

/*--------- YES NO BUTTON SELECT TOOL ----------*/
/// A tool template that takes a simple bool response from user in response
/// to the prompt.

class YesNoButtonSelectToolTemplate extends ToolCardTemplate {
  YesNoButtonSelectToolTemplate({required templatePrompt, required badgeIcon})
      : super(templatePrompt: templatePrompt, badgeIcon: badgeIcon);

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes. Write to dataMap in ActiveCard,
  // and read in SummaryCard.
  bool? userChoice;

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
                  userChoice = false,
                  onNextCard(),
                },
                buttonPriority: buttonSize.secondary,
              ),
              const Spacer(),
              IconButtonElement(
                decorationVariant: decorationPriority.important,
                buttonIcon: Assets.yes,
                buttonHint: 'Responds yes to the prompt.',
                buttonAction: () => {
                  userChoice = true,
                  onNextCard(),
                },
                buttonPriority: buttonSize.secondary,
              ),
            ],
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
          Align(
            alignment: Alignment.centerRight,
            child: IconBadge(
                badgeIcon: userChoice == true ? Assets.yes : Assets.no,
                badgePriority: decorationPriority.important),
          )
        ]);
  }
}
