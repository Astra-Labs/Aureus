import 'package:aureus/aureus.dart';
import 'package:flutter/cupertino.dart';

/*--------- LIST VIEW PICKER SELECT TOOL ----------*/

class ListViewPickerSelectToolTemplate extends ToolCardTemplate {
  final List<String> pickerOptions;
  //-------------------------------
  // A list that holds the different options you want to be shown
  // in the picker wheel.

  ListViewPickerSelectToolTemplate(
      {required this.pickerOptions,
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
    List<Widget> pickerList = [];
    String selectedItem = '';

    for (var element in pickerOptions) {
      pickerList.add(
          Center(child: BodyOneText(element, decorationPriority.standard)));
    }

    return BaseCardToolTemplate(
      isActive: true,
      cardIcon: badgeIcon,
      toolPrompt: templatePrompt,
      toolChildren: [
        Container(
            height: 100,
            decoration: InputBackingDecoration().buildBacking(),
            padding: const EdgeInsets.all(12.0),
            child: CupertinoTheme(
              data: CupertinoThemeData(
                brightness: palette.brightness(),
              ),
              child: CupertinoPicker(
                  backgroundColor: Colors.transparent,
                  itemExtent: 40,
                  magnification: 1.2,
                  diameterRatio: 1.9,
                  onSelectedItemChanged: (int index) {
                    selectedItem = pickerOptions[index];
                  },
                  children: pickerList),
            )),
        const SizedBox(height: 20.0),
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
                      {dataMap.insert(0, selectedItem), onNextCard()}),
            ])
      ],
    );
  }

  @override
  Widget returnTemplateSummary() {
    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          BodyOneText(
              dataMap.isNotEmpty ? dataMap[0] : 'Picker Selection skipped',
              decorationPriority.inactive)
        ]);
  }
}
