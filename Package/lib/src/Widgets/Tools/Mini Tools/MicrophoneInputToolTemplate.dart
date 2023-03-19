import 'dart:async';

/// @nodoc
import 'package:flutter/material.dart';
import 'package:aureus/aureus.dart';
import 'package:record/record.dart';

/// {@category Widgets}
/// {@subCategory Tools}
/// {@image <image alt='' src=''>}

/*--------- MICROPHONE INPUT TOOL TEMPLATE ----------*/
/// A Tool template that allows the user to record a voice memo in response to a prompt.

class MicrophoneInputToolTemplate extends ToolCardTemplate {
  MicrophoneInputToolTemplate({required templatePrompt, required badgeIcon})
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
        toolChildren: const [
          _MicrophoneInputCard(),
        ]);
  }

  @override
  Widget returnTemplateSummary() {
    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          BodyTwoText('Recorded a noise.', decorationPriority.standard)
        ]);
  }
}

class _MicrophoneInputCard extends StatefulWidget {
  const _MicrophoneInputCard();

  @override
  _MicrophoneInputCardState createState() => _MicrophoneInputCardState();
}

class _MicrophoneInputCardState extends State<_MicrophoneInputCard>
    with TickerProviderStateMixin {
  bool _isRecording = false;
  bool _isPaused = false;
  int _recordDuration = 0;
  Timer? _timer;
  Timer? _ampTimer;
  final _audioRecorder = Record();

  late AnimationController controller;

  @override
  void initState() {
    // Checks user's accessibility settings to make sure animations are allowed,
    //and then initializes the animation controller.
    if (accessibility.accessFeatures.disableAnimations == false ||
        accessibility.accessFeatures.reduceMotion == false) {
      controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 300),
      )..addListener(() {
          setState(() {});
        });
    }

    _isRecording = false;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    _timer?.cancel();
    _ampTimer?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        await _audioRecorder.start();
        controller.repeat(reverse: true);

        _isRecording = await _audioRecorder.isRecording();
        setState(() {
          _recordDuration = 0;
        });

        _startTimer();
      }
    } catch (e) {
      throw ("$e");
    }
  }

  Future<void> _stop() async {
    setState(() => {
          _isRecording = false,
        });

    controller.stop();
    _timer?.cancel();
    _ampTimer?.cancel();
    await _audioRecorder.stop();
    toolTemplateMaster.notifyObserverForward();
    notificationMaster.sendAlertNotificationRequest(
        "Voice recording completed.", Assets.pencil);
  }

  Future<void> _pause() async {
    _timer?.cancel();
    _ampTimer?.cancel();
    controller.stop();
    await _audioRecorder.pause();

    setState(() => {_isPaused = true, _isRecording = false});
  }

  Future<void> _resume() async {
    _startTimer();
    await _audioRecorder.resume();

    setState(() => {_isPaused = false, _isRecording = true});
  }

  void _startTimer() {
    _timer?.cancel();
    _ampTimer?.cancel();
    controller.repeat(reverse: true);

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => _recordDuration++);
    });

    _ampTimer =
        Timer.periodic(const Duration(milliseconds: 200), (Timer t) async {
      setState(() {});
    });
  }

  String formatHHMMSS(int seconds) {
    int hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();

    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      return "$minutesStr:$secondsStr";
    }

    return "$hoursStr:$minutesStr:$secondsStr";
  }

  @override
  Widget build(BuildContext context) {
    var finishRecordingButton = IconButtonElement(
      decorationVariant: _isRecording == true
          ? decorationPriority.standard
          : decorationPriority.inactive,
      buttonIcon: Assets.yes,
      buttonHint: "Finishes recording.",
      buttonAction: () => {_stop()},
      buttonPriority: buttonSize.secondary,
    );
    var pauseRecordingButton = IconButtonElement(
      decorationVariant: _isRecording == true && _isPaused != true
          ? decorationPriority.standard
          : decorationPriority.inactive,
      buttonIcon: Assets.pause,
      buttonHint: "Pauses recording.",
      buttonAction: () => {_pause()},
      buttonPriority: buttonSize.secondary,
    );
    var playRecordingButton = IconButtonElement(
      decorationVariant: _isRecording == true && _isPaused != true
          ? decorationPriority.inactive
          : decorationPriority.important,
      buttonIcon: Assets.play,
      buttonHint:
          _isPaused == false ? "Starts recording." : "Resumes recording.",
      buttonAction: () => {_isPaused == false ? _start() : _resume()},
      buttonPriority: buttonSize.secondary,
    );

    var controlBar = Row(
      children: [
        const Spacer(),
        playRecordingButton,
        const Spacer(),
        pauseRecordingButton,
        const Spacer(),
        finishRecordingButton,
        const Spacer(),
      ],
    );

    var recordingIndicatorContainer = Container(
      decoration: BoxDecoration(
          color: coloration.accentColor().withOpacity(0.2),
          shape: BoxShape.circle),
      child: CircularProgressIndicator(
          backgroundColor: coloration.inactiveColor(),
          color: coloration.accentColor(),
          value: controller.value,
          strokeWidth: 3.0),
    );

    var recordingIndicator = SizedBox(
      width: 250,
      height: 250,
      child: Stack(alignment: Alignment.center, children: [
        PulseShadowElement(
          isActive: _isRecording == true ? true : false,
          pulseWidth: 200,
          child: FloatingContainerElement(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: recordingIndicatorContainer,
              ),
            ),
          ),
        ),
        HeadingOneText(
            formatHHMMSS(_recordDuration), decorationPriority.standard)
      ]),
    );

    return Column(
      children: [recordingIndicator, const SizedBox(height: 10.0), controlBar],
    );
  }
}
