import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Tools}
/// {@image <image alt='' src=''>}

/*--------- ADAPTIVE INPUT SELECTION TOOL ----------*/
/// A tool template that lets the user CHANGE the input style for
/// a select few tool templates (hence adaptive input).
class AdaptiveInputSelectionToolTemplate extends ToolCardTemplate {
  AdaptiveInputSelectionToolTemplate()
      : super(
            templatePrompt: "How would you like to respond to tool prompts?",
            badgeIcon: Assets.hamburgermenu);

  adaptiveInput selectedAdaptation = adaptiveInput.text;

  @override
  Widget returnActiveToolCard() {
    var textButton = StandardIconButtonElement(
        decorationVariant: decorationPriority.standard,
        buttonTitle: "Typing with text",
        buttonHint: "Selects text as input mode",
        buttonIcon: Assets.window,
        buttonAction: () => {
              toolTemplateMaster.inputType = adaptiveInput.text,
              toolTemplateMaster.notifyObserverForward()
            });

    var videoButton = StandardIconButtonElement(
        decorationVariant: decorationPriority.standard,
        buttonTitle: "Recording video",
        buttonHint: "Selects video recording as input mode",
        buttonIcon: Assets.camera,
        buttonAction: () => {
              toolTemplateMaster.inputType = adaptiveInput.video,
              toolTemplateMaster.notifyObserverForward()
            });

    var voiceButton = StandardIconButtonElement(
        decorationVariant: decorationPriority.standard,
        buttonTitle: "Recording voice",
        buttonHint: "Selects voice recording as input mode",
        buttonIcon: Assets.play,
        buttonAction: () => {
              toolTemplateMaster.inputType = adaptiveInput.voice,
              toolTemplateMaster.notifyObserverForward()
            });

    var drawingButton = StandardIconButtonElement(
        decorationVariant: decorationPriority.standard,
        buttonTitle: "Drawing",
        buttonHint: "Selects drawing as input mode",
        buttonIcon: Assets.pencil,
        buttonAction: () => {
              toolTemplateMaster.inputType = adaptiveInput.draw,
              toolTemplateMaster.notifyObserverForward()
            });

    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          Column(
            children: [
              textButton,
              const SizedBox(height: 10.0),
              videoButton,
              const SizedBox(height: 10.0),
              voiceButton,
              const SizedBox(height: 10.0),
              drawingButton,
            ],
          )
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
              "Selected adaptive input type.", decorationPriority.standard)
        ]);
  }
}
