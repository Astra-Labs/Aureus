import 'package:aureus/aureus.dart';
/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class ColorSpectrumInputToolTemplate extends ToolCardTemplate {
  ColorSpectrumInputToolTemplate({required templatePrompt, required badgeIcon})
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
                    buttonHint: 'Goes to the next card',
                    buttonAction: () => {onNextCard()}),
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
          BodyTwoText('Selected a color with Color Spectrum tool',
              decorationPriority.standard)
        ]);
  }
}

class _ColorSpectrumInputCard extends StatefulWidget {
  const _ColorSpectrumInputCard();

  @override
  _ColorSpectrumInputCardState createState() => _ColorSpectrumInputCardState();
}

class _ColorSpectrumInputCardState extends State<_ColorSpectrumInputCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
