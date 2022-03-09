import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class SingleSliderToolTemplate extends ToolCardTemplate {
  SingleSliderToolTemplate()
      : super(templatePrompt: 'Single Slider', badgeIcon: Assets.alert);

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes. Write to dataMap in ActiveCard,
  // and read in SummaryCard.
  var dataMap = [5.0];

  @override
  Widget returnActiveToolCard() {
    var slider = SliderElement();

    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          slider,
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                SubheaderText('0', decorationPriority.standard),
                Spacer(),
                SubheaderText('10', decorationPriority.standard)
              ],
            ),
          ),
          SizedBox(height: 10.0),
          DividerElement(),
          SizedBox(height: 20.0),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmolButtonElement(
                    decorationVariant: decorationPriority.standard,
                    buttonTitle: 'Skip',
                    buttonAction: () => {onNextCard()}),
                Spacer(),
                SmolButtonElement(
                    decorationVariant: decorationPriority.important,
                    buttonTitle: 'Next',
                    buttonAction: () =>
                        {dataMap.insert(0, slider.slideValue), onNextCard()}),
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
              'Slider: ${dataMap[0] / 10} / 10', decorationPriority.inactive)
        ]);
  }
}
