import 'package:aureus/aureus.dart';
import 'package:camera/camera.dart';
/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class CameraInputToolTemplate extends ToolCardTemplate {
  final CameraDescription camera;

  CameraInputToolTemplate(
      {required templatePrompt, required badgeIcon, required this.camera})
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
          _CameraInputCard(camera: camera),
          const SizedBox(height: 10.0),
          const DividerElement(),
          const SizedBox(height: 20.0),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                SmolButtonElement(
                    decorationVariant: decorationPriority.important,
                    buttonTitle: 'Next',
                    buttonHint: 'Goes to the next card',
                    buttonAction: () => {onNextCard()}),
              ]),
        ]);
  }

  @override
  Widget returnTemplateSummary() {
    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          BodyTwoText('Took a photo with Camera Input Tool',
              decorationPriority.standard)
        ]);
  }
}

class _CameraInputCard extends StatefulWidget {
  final CameraDescription camera;

  const _CameraInputCard({required this.camera});

  @override
  _CameraInputCardState createState() => _CameraInputCardState();
}

class _CameraInputCardState extends State<_CameraInputCard> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  var isCameraActive = false;
  void startCamera() {}
  void stopCamera() {}

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!_controller.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      _controller.dispose();
    } else if (state == AppLifecycleState.resumed) {
      if (_controller != null) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();
    var boxSize = size.layoutItemWidth(1, screenSize);

    var startBox = Container(
        width: boxSize,
        height: boxSize,
        decoration: CardBackingDecoration(priority: decorationPriority.inactive)
            .buildBacking(),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10.0),
        child: StandardButtonElement(
            decorationVariant: decorationPriority.standard,
            buttonTitle: 'Start Camera',
            buttonAction: () => {startCamera()}));

    var cameraBox = FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          return CameraPreview(_controller);
        } else {
          // Otherwise, display a loading indicator.
          return const Center(child: LoadingCircleElement());
        }
      },
    );

    return isCameraActive == true
        ? Column(
            children: [
              cameraBox,
              const SizedBox(height: 20.0),
              PrimaryIconButtonElement(
                decorationVariant: decorationPriority.standard,
                buttonAction: () => {},
                buttonIcon: Assets.camera,
                buttonHint: 'Captures image for camera',
              ),
            ],
          )
        : startBox;
  }
}
