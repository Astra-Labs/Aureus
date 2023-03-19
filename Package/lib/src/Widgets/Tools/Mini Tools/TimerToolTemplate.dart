import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Tools}
/// {@image <image alt='' src=''>}

/*--------- TIMER TOOL ----------*/
/// A Tool template that gives the user a timer to finish a prompt.

class TimerToolTemplate extends ToolCardTemplate {
  final Duration allotment;
  final VoidCallback onFinish;

  TimerToolTemplate(
      {required this.allotment,
      required this.onFinish,
      required templatePrompt,
      required badgeIcon})
      : super(templatePrompt: templatePrompt, badgeIcon: badgeIcon);

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
          TimerElement(
              timeAllotment: allotment,
              onFinish: () => {
                    onFinish(),
                    toolTemplateMaster.notifyObserverForward(),
                    notificationMaster.sendAlertNotificationRequest(
                        "Timer completed", Assets.time)
                  }),
        ]);
  }

  @override
  Widget returnTemplateSummary() {
    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          BodyTwoText(
              'Completed a Timer for $allotment.', decorationPriority.standard)
        ]);
  }
}
