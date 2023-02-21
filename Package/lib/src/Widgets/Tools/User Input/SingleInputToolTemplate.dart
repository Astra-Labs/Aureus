import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Tools}
/// {@image <image alt='' src=''>}

/*--------- SINGLE INPUT TOOL ----------*/

class SingleInputToolTemplate extends ToolCardTemplate {
  SingleInputToolTemplate({required templatePrompt, required badgeIcon})
      : super(templatePrompt: templatePrompt, badgeIcon: badgeIcon);

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
          StandardTextFieldComponent(
              hintText: 'Answer here.',
              decorationVariant: decorationPriority.standard,
              textFieldController: cardController,
              isEnabled: true),
          const DividerElement(),
          const SizedBox(height: 20.0),
          Row(
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
                    decorationVariant: decorationPriority.important,
                    buttonTitle: 'Next',
                    buttonHint: 'Goes to the next card.',
                    buttonAction: () =>
                        {dataMap.insert(0, cardController.text), onNextCard()}),
              ]),
        ]);
  }

  @override
  Widget returnTemplateSummary() {
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
