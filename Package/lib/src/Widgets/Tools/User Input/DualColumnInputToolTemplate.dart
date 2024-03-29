import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Tools}
/// {@image <image alt='' src=''>}

/*--------- DUAL COLUMN INPUT TOOL ----------*/
/// A tool template for providing 2 different columns for input. We use this
/// for pro/cons flows, and to help users compare and contrast things.

class DualColumnInputToolTemplate extends ToolCardTemplate {
  final String prompt1;
  final String prompt2;

  DualColumnInputToolTemplate(
      {required this.prompt1,
      required this.prompt2,
      required templatePrompt,
      required badgeIcon})
      : super(templatePrompt: templatePrompt, badgeIcon: badgeIcon);

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes. Write to dataMap in ActiveCard,
  // and read in SummaryCard.

  String? answer1;
  String? answer2;

  @override
  Widget returnActiveToolCard() {
    var column1Controller = TextEditingController();
    var column2Controller = TextEditingController();

    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          const SizedBox(height: 20.0),
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TagOneText(prompt1, decorationPriority.standard),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      width: constraints.maxWidth * 0.48,
                      height: 100,
                      child: TextFormField(
                        style: body2().copyWith(
                            color: coloration.decorationColor(
                                decorationVariant:
                                    decorationPriority.standard)),
                        controller: column1Controller,
                        decoration: InputDecoration(
                            fillColor: coloration.inactiveColor(),
                            filled: true,
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: palette.lavender(), width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: coloration
                                        .decorationColor(
                                            decorationVariant:
                                                decorationPriority.standard)
                                        .withOpacity(0.3),
                                    width: 1.0)),
                            errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 178, 178, 1.0),
                                    width: 1.0)),
                            disabledBorder: InputBorder.none,
                            hintStyle: body2().copyWith(
                                color: coloration
                                    .contrastColor()
                                    .withOpacity(0.7))),
                        autocorrect: false,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TagOneText(prompt2, decorationPriority.standard),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      width: constraints.maxWidth * 0.48,
                      height: 100,
                      child: TextFormField(
                        style: body2().copyWith(
                            color: coloration.decorationColor(
                                decorationVariant:
                                    decorationPriority.standard)),
                        controller: column2Controller,
                        decoration: InputDecoration(
                            fillColor: coloration.inactiveColor(),
                            filled: true,
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: palette.lavender(), width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: coloration
                                        .decorationColor(
                                            decorationVariant:
                                                decorationPriority.standard)
                                        .withOpacity(0.3),
                                    width: 1.0)),
                            errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 178, 178, 1.0),
                                    width: 1.0)),
                            disabledBorder: InputBorder.none,
                            hintStyle: body2().copyWith(
                                color: coloration
                                    .contrastColor()
                                    .withOpacity(0.7))),
                        autocorrect: false,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                    )
                  ],
                )
              ],
            );
          }),
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
                          answer1 = column1Controller.text,
                          answer2 = column2Controller.text,
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
            decoration: LayerBackingDecoration(
                    decorationVariant: decorationPriority.inactive)
                .buildBacking(),
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TagTwoText(prompt1, decorationPriority.standard),
                  const SizedBox(height: 5.0),
                  BodyOneText(answer1 ?? '', decorationPriority.standard)
                ]),
          )),
          const SizedBox(width: 15.0),
          FloatingContainerElement(
              child: Container(
            decoration: LayerBackingDecoration(
                    decorationVariant: decorationPriority.inactive)
                .buildBacking(),
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TagTwoText(prompt2, decorationPriority.standard),
                  const SizedBox(height: 5.0),
                  BodyOneText(answer2 ?? '', decorationPriority.standard)
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
        toolChildren: answer1 != null ? filledChildren : skippedChildren);
  }
}
