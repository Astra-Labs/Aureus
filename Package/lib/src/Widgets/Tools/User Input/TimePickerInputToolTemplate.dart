import 'package:aureus/aureus.dart';
import 'package:flutter/cupertino.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class TimePickerInputToolTemplate extends ToolCardTemplate {
  TimePickerInputToolTemplate({required templatePrompt, required badgeIcon})
      : super(templatePrompt: templatePrompt, badgeIcon: badgeIcon);

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes. Write to dataMap in ActiveCard,
  // and read in SummaryCard.
  var dataMap = [];

  @override
  Widget returnActiveToolCard() {
    var timerDuration = const Duration(seconds: 1);

    var timerPicker = CupertinoTimerPicker(
        mode: CupertinoTimerPickerMode.hm,
        onTimerDurationChanged: (duration) {
          timerDuration = duration;
        });

    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          SizedBox(
              height: size.responsiveSize(100.0),
              width: size.responsiveSize(250.0),
              child: timerPicker),
          const SizedBox(height: 10.0),
          const DividerElement(),
          const SizedBox(height: 20.0),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                SmolButtonElement(
                    decorationVariant: decorationPriority.important,
                    buttonTitle: 'Next',
                    buttonHint: 'Goes to the next card.',
                    buttonAction: () =>
                        {dataMap.insert(0, timerDuration), onNextCard()}),
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
          BodyOneText(
              'Duration chosen: ${dataMap[0]}', decorationPriority.inactive)
        ]);
  }
}
