import 'dart:io';

import 'package:aureus/aureus.dart';
import 'package:camera/camera.dart';
import 'package:video_player/video_player.dart';

/// {@category Widgets}
/// {@subCategory Tools}
/// {@image <image alt='' src=''>}

/*--------- VIDEO INPUT TOOL ----------*/

class VideoInputToolTemplate extends ToolCardTemplate {
  VideoInputToolTemplate({required templatePrompt, required badgeIcon})
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
          const DividerElement(),
          const SizedBox(height: 30.0),
          Builder(
            builder: (context) => StandardIconButtonElement(
                decorationVariant: decorationPriority.important,
                buttonIcon: Assets.play,
                buttonTitle: "Take a video",
                buttonHint: "Takes you to the camera.",
                buttonAction: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => _VideoRecordInputCard(
                                toolPrompt: templatePrompt,
                                cardIcon: badgeIcon),
                          )),
                    }),
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
          BodyTwoText('Responded with a video.', decorationPriority.standard)
        ]);
  }
}

class _VideoRecordInputCard extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  final IconData cardIcon;
  final String toolPrompt;

  const _VideoRecordInputCard(
      {required this.cardIcon, required this.toolPrompt});

  @override
  _VideoRecordInputCardState createState() => _VideoRecordInputCardState();
}

class _VideoRecordInputCardState extends State<_VideoRecordInputCard> {
  bool _isLoading = true;
  bool _isRecording = false;
  late CameraController _cameraController;

  @override
  void initState() {
    _initCamera();
    super.initState();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  void _manageVideo() async {
    if (_isRecording) {
      setState(() => _isRecording = false);
      await _cameraController.pauseVideoRecording();
    } else {
      setState(() => _isRecording = true);
      await _cameraController.prepareForVideoRecording();
      await _cameraController.startVideoRecording();
    }
  }

  void _clearVideo() async {
    await _cameraController.stopVideoRecording();
    setState(() => _isRecording = false);
  }

  void _finishVideo() async {
    final file = await _cameraController.stopVideoRecording();
    setState(() => _isRecording = false);
    final route = MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) => _VideoPlaybackCard(
          filePath: file.path,
          toolPrompt: widget.toolPrompt,
          cardIcon: widget.cardIcon),
    );
    Navigator.push(context, route);
  }

  void _initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
    _cameraController = CameraController(front, ResolutionPreset.max);
    await _cameraController.initialize();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    var topBar = SizedBox(
        width: size.layoutItemWidth(1, screenSize),
        height: size.layoutItemWidth(5, screenSize),
        child: FloatingContainerElement(
          child: Container(
            decoration:
                CardBackingDecoration(priority: decorationPriority.inactive)
                    .buildBacking(),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeadingTwoText("Record", decorationPriority.standard),
                const Spacer(),
                IconButtonElement(
                  decorationVariant: decorationPriority.standard,
                  buttonIcon: Assets.no,
                  buttonHint: "Exits the recording studio.",
                  buttonAction: () => {Navigator.pop(context)},
                  buttonPriority: buttonSize.secondary,
                ),
              ],
            ),
          ),
        ));

    var controlBar =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        width: size.layoutItemWidth(1, screenSize),
        height: size.layoutItemHeight(6, screenSize),
        child: Container(
            decoration:
                CardBackingDecoration(priority: decorationPriority.important)
                    .buildBacking(),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 10.0),
                IconBadge(
                    badgeIcon: widget.cardIcon,
                    badgePriority: decorationPriority.inverted),
                const SizedBox(width: 20.0),
                BodyTwoText(widget.toolPrompt, decorationPriority.important),
              ],
            )),
      ),
      const SizedBox(height: 20),
      SizedBox(
          width: size.layoutItemWidth(1, screenSize),
          height: size.layoutItemWidth(3, screenSize),
          child: FloatingContainerElement(
            child: Container(
              decoration:
                  CardBackingDecoration(priority: decorationPriority.inactive)
                      .buildBacking(),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  SmolButtonElement(
                      decorationVariant: _isRecording == true
                          ? decorationPriority.important
                          : decorationPriority.inactive,
                      buttonTitle: 'Clear',
                      buttonHint: "Clears and restarts recording.",
                      buttonAction: () => {_clearVideo()}),
                  const SizedBox(width: 30.0),
                  IconButtonElement(
                    decorationVariant: decorationPriority.important,
                    buttonIcon:
                        _isRecording ? Icons.circle : Icons.circle_outlined,
                    buttonHint:
                        _isRecording ? "Pauses recording." : "Starts recording",
                    buttonAction: () => {_manageVideo()},
                    buttonPriority: buttonSize.primary,
                  ),
                  const SizedBox(width: 30.0),
                  SmolButtonElement(
                      decorationVariant: _isRecording == true
                          ? decorationPriority.important
                          : decorationPriority.inactive,
                      buttonTitle: "Finish",
                      buttonHint: "Finishes recording.",
                      buttonAction: () => {
                            _finishVideo(),
                          }),
                  const Spacer(),
                ],
              ),
            ),
          ))
    ]);

    var cameraStack = SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.scale(
              scale: 1.5,
              child: CameraPreview(_cameraController),
            ),
            Positioned(top: 50, child: topBar),
            Positioned(bottom: 30, child: controlBar),
          ],
        ));

    var viewLayout = ContainerWrapperElement(
      children: [
        SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child:
              _isLoading == true ? const LoadingCircleElement() : cameraStack,
        )
      ],
      containerVariant: wrapperVariants.fullScreen,
      takesFullWidth: true,
    );

    return ContainerView(
      decorationVariant: decorationPriority.standard,
      builder: viewLayout,
      takesFullWidth: true,
      hasBackgroundImage: false,
    );
  }
}

class _VideoPlaybackCard extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables

  final String filePath;
  final IconData cardIcon;
  final String toolPrompt;

  const _VideoPlaybackCard(
      {Key? key,
      required this.filePath,
      required this.cardIcon,
      required this.toolPrompt})
      : super(key: key);

  @override
  _VideoPlaybackCardState createState() => _VideoPlaybackCardState();
}

class _VideoPlaybackCardState extends State<_VideoPlaybackCard> {
  late VideoPlayerController _videoPlayerController;

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(widget.filePath));
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.play();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();
    var popCount = 0;

    var controlBar =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        width: size.layoutItemWidth(1, screenSize),
        height: size.layoutItemHeight(6, screenSize),
        child: Container(
            decoration:
                CardBackingDecoration(priority: decorationPriority.important)
                    .buildBacking(),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 10.0),
                IconBadge(
                    badgeIcon: widget.cardIcon,
                    badgePriority: decorationPriority.inverted),
                const SizedBox(width: 20.0),
                BodyTwoText(widget.toolPrompt, decorationPriority.important),
              ],
            )),
      ),
      const SizedBox(height: 20),
      SizedBox(
          width: size.layoutItemWidth(1, screenSize),
          height: size.layoutItemWidth(2, screenSize),
          child: FloatingContainerElement(
            child: Container(
              decoration:
                  CardBackingDecoration(priority: decorationPriority.inactive)
                      .buildBacking(),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  StandardIconButtonElement(
                      decorationVariant: decorationPriority.standard,
                      buttonTitle: 'Retake',
                      buttonIcon: Assets.no,
                      buttonHint: "Goes back to recording studio.",
                      buttonAction: () => {Navigator.pop(context)}),
                  const SizedBox(height: 20),
                  StandardIconButtonElement(
                      decorationVariant: decorationPriority.standard,
                      buttonTitle: "Complete",
                      buttonHint: "Finishes prompt.",
                      buttonIcon: Assets.yes,
                      buttonAction: () => {
                            toolTemplateMaster.notifyObserverForward(),
                            Navigator.of(context)
                                .popUntil((_) => popCount++ >= 2),
                            notificationMaster.sendAlertNotificationRequest(
                                "Video tool completed.", Assets.camera)
                          }),
                  const Spacer(),
                ],
              ),
            ),
          ))
    ]);

    return ContainerView(
        decorationVariant: decorationPriority.standard,
        hasBackgroundImage: false,
        takesFullWidth: true,
        builder: ContainerWrapperElement(
            takesFullWidth: true,
            children: [
              SizedBox(
                width: screenSize.width,
                height: screenSize.height,
                child: FutureBuilder(
                    future: _initVideoPlayer(),
                    builder: (context, state) {
                      if (state.connectionState == ConnectionState.waiting) {
                        return const Center(child: LoadingCircleElement());
                      } else {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            VideoPlayer(_videoPlayerController),
                            Positioned(bottom: 30, child: controlBar)
                          ],
                        );
                      }
                    }),
              )
            ],
            containerVariant: wrapperVariants.fullScreen));
  }
}
