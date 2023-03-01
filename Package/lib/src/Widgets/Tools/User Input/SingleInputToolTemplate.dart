import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Tools}
/// {@image <image alt='' src=''>}

/*--------- SINGLE INPUT TOOL ----------*/
/// A tool template for a user to input into a single text field.

class SingleInputToolTemplate extends ToolCardTemplate {
  SingleInputToolTemplate({required templatePrompt, required badgeIcon})
      : super(templatePrompt: templatePrompt, badgeIcon: badgeIcon);

  String? answer;

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
                    buttonAction: () => {
                          answer = cardController.text,
                          onNextCard(),
                        }),
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
        BodyOneText(answer ?? 'Tool Skipped', decorationPriority.inactive)
      ],
    );
  }
}
