import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class TriInputToolTemplate extends ToolCardTemplate {
  final String textPrompt1;
  final String textPrompt2;
  final String textPrompt3;

  TriInputToolTemplate(
      {required this.textPrompt1,
      required this.textPrompt2,
      required this.textPrompt3,
      required templatePrompt,
      required badgeIcon})
      : super(templatePrompt: templatePrompt, badgeIcon: badgeIcon);

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes. Write to dataMap in ActiveCard,
  // and read in SummaryCard.
  var dataMap = ['yee haw my beans', 'yee haw my toast', 'yee haw my beets'];

  @override
  Widget returnActiveToolCard() {
    var textField1Controller = TextEditingController();
    var textField2Controller = TextEditingController();
    var textField3Controller = TextEditingController();

    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          const SizedBox(height: 25.0),
          StandardTextFieldComponent(
              hintText: textPrompt1,
              decorationVariant: decorationPriority.standard,
              textFieldController: textField1Controller),
          StandardTextFieldComponent(
              hintText: textPrompt2,
              decorationVariant: decorationPriority.standard,
              textFieldController: textField2Controller),
          StandardTextFieldComponent(
              hintText: textPrompt3,
              decorationVariant: decorationPriority.standard,
              textFieldController: textField3Controller),
          const SizedBox(height: 5),
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
                          dataMap.insert(0, textField1Controller.text),
                          dataMap.insert(1, textField2Controller.text),
                          dataMap.insert(2, textField3Controller.text),
                          onNextCard()
                        }),
              ]),
        ]);
  }

  @override
  Widget returnTemplateSummary() {
    //The summary to displayed when the tool is completed.
    var filledChildren = [
      Row(
        children: [
          FloatingContainerElement(
              child: Container(
            decoration:
                LayerBackingDecoration(priority: decorationPriority.inactive)
                    .buildBacking(),
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TagTwoText(textPrompt1, decorationPriority.standard),
                  const SizedBox(height: 5.0),
                  BodyOneText(dataMap.isNotEmpty ? dataMap[0] : '',
                      decorationPriority.standard)
                ]),
          )),
          const SizedBox(width: 15.0),
          FloatingContainerElement(
              child: Container(
            decoration:
                LayerBackingDecoration(priority: decorationPriority.inactive)
                    .buildBacking(),
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TagTwoText(textPrompt2, decorationPriority.standard),
                  const SizedBox(height: 5.0),
                  BodyOneText(dataMap.isNotEmpty ? dataMap[1] : '',
                      decorationPriority.standard)
                ]),
          )),
          const SizedBox(width: 15.0),
          FloatingContainerElement(
              child: Container(
            decoration:
                LayerBackingDecoration(priority: decorationPriority.inactive)
                    .buildBacking(),
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TagTwoText(textPrompt3, decorationPriority.standard),
                  const SizedBox(height: 5.0),
                  BodyOneText(dataMap.isNotEmpty ? dataMap[2] : '',
                      decorationPriority.standard)
                ]),
          ))
        ],
      )
    ];

    //The list to displayed when the tool is skipped.
    var skippedChildren = [
      BodyOneText('Tool Skipped', decorationPriority.inactive)
    ];

    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: dataMap.isNotEmpty ? filledChildren : skippedChildren);
  }
}
