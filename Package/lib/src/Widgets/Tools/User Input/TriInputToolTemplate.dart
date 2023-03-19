import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Tools}
/// {@image <image alt='' src=''>}

/*--------- TRIINPUT TOOL ----------*/
/// A tool template for showing 3 prompts and text fields.

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

  String? answer1;
  String? answer2;
  String? answer3;

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
              textFieldController: textField1Controller,
              isEnabled: true),
          StandardTextFieldComponent(
              hintText: textPrompt2,
              decorationVariant: decorationPriority.standard,
              textFieldController: textField2Controller,
              isEnabled: true),
          StandardTextFieldComponent(
              hintText: textPrompt3,
              decorationVariant: decorationPriority.standard,
              textFieldController: textField3Controller,
              isEnabled: true),
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
                          answer1 = textField1Controller.text,
                          answer2 = textField2Controller.text,
                          answer3 = textField3Controller.text,
                          onNextCard()
                        }),
              ]),
        ]);
  }

  @override
  Widget returnTemplateSummary() {
    //The summary to displayed when the tool is completed.
    var floatingContainerElement = FloatingContainerElement(
        child: Container(
      decoration:
          LayerBackingDecoration(decorationVariant: decorationPriority.inactive)
              .buildBacking(),
      padding: const EdgeInsets.all(15.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            TagTwoText(textPrompt1, decorationPriority.standard),
            const SizedBox(height: 5.0),
            BodyOneText(
                answer1 != null ? answer1! : '', decorationPriority.standard)
          ]),
    ));

    var floatingContainerElement2 = FloatingContainerElement(
        child: Container(
      decoration:
          LayerBackingDecoration(decorationVariant: decorationPriority.inactive)
              .buildBacking(),
      padding: const EdgeInsets.all(15.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            TagTwoText(textPrompt2, decorationPriority.standard),
            const SizedBox(height: 5.0),
            BodyOneText(
                answer2 != null ? answer2! : '', decorationPriority.standard)
          ]),
    ));

    var floatingContainerElement3 = FloatingContainerElement(
        child: Container(
      decoration:
          LayerBackingDecoration(decorationVariant: decorationPriority.inactive)
              .buildBacking(),
      padding: const EdgeInsets.all(15.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            TagTwoText(textPrompt3, decorationPriority.standard),
            const SizedBox(height: 5.0),
            BodyOneText(
                answer3 != null ? answer3! : '', decorationPriority.standard)
          ]),
    ));

    var filledChildren = [
      Row(
        children: [
          floatingContainerElement,
          const SizedBox(width: 15.0),
          floatingContainerElement2,
          const SizedBox(width: 15.0),
          floatingContainerElement3
        ],
      )
    ];

    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: filledChildren);
  }
}
