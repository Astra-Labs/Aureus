import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/cupertino.dart';

/// {@category Widgets}
/// {@subCategory Tools}
/// {@image <image alt='' src=''>}

/*--------- TIME PICKER INPUT TOOL ----------*/
/// A tool template for selecting a time allotment.

class TimePickerInputToolTemplate extends ToolCardTemplate {
  TimePickerInputToolTemplate({required templatePrompt, required badgeIcon})
      : super(templatePrompt: templatePrompt, badgeIcon: badgeIcon);

  Duration? selectedTimerDuration;

  @override
  Widget returnActiveToolCard() {
    var timerDuration = const Duration(seconds: 1);

    var timerPicker = CupertinoTheme(
        data: CupertinoThemeData(
          brightness: palette.brightness(),
        ),
        child: CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.hm,
            onTimerDurationChanged: (duration) {
              timerDuration = duration;
            }));

    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          SizedBox(height: 100.0, width: 250.0, child: timerPicker),
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
                    buttonAction: () => {
                          selectedTimerDuration = timerDuration,
                          onNextCard(),
                        }),
              ])
        ]);
  }

  @override
  Widget returnTemplateSummary() {
    var skippedText = 'Item skipped';
    var completedText = 'Duration chosen: $selectedTimerDuration';

    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          BodyOneText(
              selectedTimerDuration == null ? skippedText : completedText,
              decorationPriority.inactive)
        ]);
  }
}
