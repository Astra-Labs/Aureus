import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Tools}
/// {@image <image alt='' src=''>}

/*--------- SINGLE SLIDER INPUT TOOL ----------*/
/// A tool template for picking a value on a slider.

class SingleSliderToolTemplate extends ToolCardTemplate {
  SingleSliderToolTemplate({required templatePrompt, required badgeIcon})
      : super(templatePrompt: templatePrompt, badgeIcon: badgeIcon);

  double? sliderValue;

  @override
  Widget returnActiveToolCard() {
    var slider = SliderElement();

    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          slider,
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                SubheaderText('0', decorationPriority.standard),
                const Spacer(),
                SubheaderText('10', decorationPriority.standard)
              ],
            ),
          ),
          const SizedBox(height: 10.0),
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
                        {sliderValue = slider.slideValue, onNextCard()}),
              ])
        ]);
  }

  @override
  Widget returnTemplateSummary() {
    var skippedText = "Item skipped";
    var completedText = 'Slider: $sliderValue / 10';

    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          BodyOneText(sliderValue == null ? skippedText : completedText,
              decorationPriority.inactive)
        ]);
  }
}
