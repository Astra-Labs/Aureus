// ignore_for_file: must_be_immutable

/// {@category Widgets}
/// {@subCategory Tools}
/// {@image <image alt='' src=''>}

import 'package:aureus/aureus.dart';

/*--------- PROMPT LIST USER INPUT TOOL ----------*/

class PromptListUserInputToolTemplate extends ToolCardTemplate {
  PromptListUserInputToolTemplate({required templatePrompt, required badgeIcon})
      : super(templatePrompt: templatePrompt, badgeIcon: badgeIcon);

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes. Write to dataMap in ActiveCard,
  // and read in SummaryCard.
  var dataMap = [];

  @override
  Widget returnActiveToolCard() {
    var inputCard = _PromptListInputCard();

    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          inputCard,
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
                    buttonAction: () => {
                          dataMap.insert(0, inputCard.promptList),
                          onNextCard()
                        }),
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
        toolChildren: const []);
  }
}

class _PromptListInputCard extends StatefulWidget {
  List<String> promptList = [];

  _PromptListInputCard();

  @override
  _PromptListInputCardState createState() => _PromptListInputCardState();
}

class _PromptListInputCardState extends State<_PromptListInputCard> {
  var promptController = TextEditingController();

  void addItem() {
    setState(() {
      widget.promptList.insert(0, promptController.text);
      promptController.value = TextEditingValue.empty;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> promptListItems = [];

    var screenSize = size.logicalScreenSize();

    for (var element in widget.promptList) {
      promptListItems.add(Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
        child: StandardSelectionCardElement(cardName: element),
      ));
    }

    var promptScrollView = SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(children: promptListItems),
    );

    var textField = SizedBox(
      width: size.layoutItemWidth(1, screenSize) * 0.8,
      height: size.layoutItemHeight(6, screenSize),
      child: TextFormField(
          style: body2().copyWith(
              color: coloration.decorationColor(
                  decorationVariant: decorationPriority.standard)),
          controller: promptController,
          decoration: InputDecoration(
              fillColor: coloration.inactiveColor(),
              filled: true,
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: palette.lavender(), width: 1.0)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: coloration
                          .decorationColor(
                              decorationVariant: decorationPriority.standard)
                          .withOpacity(0.3),
                      width: 1.0)),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(255, 178, 178, 1.0), width: 1.0)),
              disabledBorder: InputBorder.none,
              hintStyle: body2()
                  .copyWith(color: coloration.contrastColor().withOpacity(0.7)),
              hintText: 'Add an item'),
          autocorrect: false,
          textAlign: TextAlign.left,
          keyboardType: TextInputType.text),
    );

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textField,
            const Spacer(),
            IconButtonElement(
              decorationVariant: decorationPriority.standard,
              buttonIcon: Assets.add,
              buttonHint: 'Add an item to the list',
              buttonAction: () => {addItem()},
              buttonPriority: buttonSize.secondary,
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        const DividerElement(),
        const SizedBox(height: 20.0),
        widget.promptList.isEmpty == true
            ? BodyOneText("Use the text field above to create an item",
                decorationPriority.standard)
            : promptScrollView,
      ],
    );
  }
}
