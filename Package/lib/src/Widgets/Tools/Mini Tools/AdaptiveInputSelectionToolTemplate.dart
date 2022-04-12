import 'package:aureus/aureus.dart';

// A tool template that changes the input style for
// a select few tool templates (hence adaptive input).
// ---------------------------------
// This allows people to respond to prompts with video,
// text, sketch, or voice recording.

class AdaptiveInputSelectionToolTemplate extends ToolCardTemplate {
  AdaptiveInputSelectionToolTemplate()
      : super(
            templatePrompt: "How would you like to respond to tool prompts?",
            badgeIcon: Assets.hamburgermenu);

  adaptiveInput selectedAdaptation = adaptiveInput.text;

  @override
  Widget returnActiveToolCard() {
    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          Column(
            children: [
              StandardIconButtonElement(
                  decorationVariant: decorationPriority.standard,
                  buttonTitle: "Typing with text",
                  buttonHint: "Selects text as input mode",
                  buttonIcon: Assets.window,
                  buttonAction: () => {
                        toolTemplateMaster.inputType = adaptiveInput.text,
                        toolTemplateMaster.notifyObserverForward()
                      }),
              const SizedBox(height: 10.0),
              StandardIconButtonElement(
                  decorationVariant: decorationPriority.standard,
                  buttonTitle: "Recording video",
                  buttonHint: "Selects video recording as input mode",
                  buttonIcon: Assets.camera,
                  buttonAction: () => {
                        toolTemplateMaster.inputType = adaptiveInput.video,
                        toolTemplateMaster.notifyObserverForward()
                      }),
              const SizedBox(height: 10.0),
              StandardIconButtonElement(
                  decorationVariant: decorationPriority.standard,
                  buttonTitle: "Recording voice",
                  buttonHint: "Selects voice recording as input mode",
                  buttonIcon: Assets.play,
                  buttonAction: () => {
                        toolTemplateMaster.inputType = adaptiveInput.voice,
                        toolTemplateMaster.notifyObserverForward()
                      }),
              const SizedBox(height: 10.0),
              StandardIconButtonElement(
                  decorationVariant: decorationPriority.standard,
                  buttonTitle: "Drawing",
                  buttonHint: "Selects drawing as input mode",
                  buttonIcon: Assets.pencil,
                  buttonAction: () => {
                        toolTemplateMaster.inputType = adaptiveInput.draw,
                        toolTemplateMaster.notifyObserverForward()
                      }),
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
