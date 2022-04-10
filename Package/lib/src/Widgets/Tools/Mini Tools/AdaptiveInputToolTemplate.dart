import 'package:aureus/aureus.dart';

// A tool template that changes the input style for
// a select few tool templates (hence adaptive input).
// ---------------------------------
// This allows people to respond to prompts with video,
// text, sketch, or voice recording.

class AdaptiveInputToolTemplate extends ToolCardTemplate {
  final adaptiveInput inputVariant;

  // Creates variables to be initialize in the constructor
  // this is so the user can see the variables from the tool
  // as opposed to a "skipped tool message" even if filled
  // with data.
  late SketchToolTemplate _drawingTool;
  late SingleInputToolTemplate _textTool;
  late VideoInputToolTemplate _videoTool;
  late MicrophoneInputToolTemplate _voiceTool;

  AdaptiveInputToolTemplate(
      {required templatePrompt, required badgeIcon, required this.inputVariant})
      : super(templatePrompt: templatePrompt, badgeIcon: badgeIcon) {
    _drawingTool = SketchToolTemplate(
        templatePrompt: templatePrompt, badgeIcon: badgeIcon);
    _textTool = SingleInputToolTemplate(
        templatePrompt: templatePrompt, badgeIcon: badgeIcon);
    _videoTool = VideoInputToolTemplate(
        templatePrompt: templatePrompt, badgeIcon: badgeIcon);
    _voiceTool = MicrophoneInputToolTemplate(
        templatePrompt: templatePrompt, badgeIcon: badgeIcon);
  }

  @override
  Widget returnActiveToolCard() {
    switch (inputVariant) {

      // returns proper tool for drawing.
      case (adaptiveInput.draw):
        {
          return _drawingTool.returnActiveToolCard();
        }
      // returns proper tool for drawing.
      case (adaptiveInput.text):
        {
          return _textTool.returnActiveToolCard();
        }
      // returns proper tool for drawing.
      case (adaptiveInput.video):
        {
          return _videoTool.returnActiveToolCard();
        }
      // returns proper tool for drawing.
      case (adaptiveInput.voice):
        {
          return _voiceTool.returnActiveToolCard();
        }
    }

    throw ('An error has occured with returning the active card of an AdaptiveInputToolTemplate.');
  }

  @override
  Widget returnTemplateSummary() {
    switch (inputVariant) {

      // returns proper tool for drawing.
      case (adaptiveInput.draw):
        {
          return _drawingTool.returnTemplateSummary();
        }
      // returns proper tool for drawing.
      case (adaptiveInput.text):
        {
          return _textTool.returnTemplateSummary();
        }
      // returns proper tool for drawing.
      case (adaptiveInput.video):
        {
          return _videoTool.returnTemplateSummary();
        }
      // returns proper tool for drawing.
      case (adaptiveInput.voice):
        {
          return _voiceTool.returnTemplateSummary();
        }
    }

    throw ('An error has occured with returning the template summary of an AdaptiveInputToolTemplate.');
  }
}
