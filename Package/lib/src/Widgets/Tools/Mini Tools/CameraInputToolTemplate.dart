import 'package:aureus/aureus.dart';
import 'package:camera/camera.dart';
import 'dart:io';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class CameraInputToolTemplate extends ToolCardTemplate {
  CameraInputToolTemplate({required templatePrompt, required badgeIcon})
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
                buttonIcon: Assets.camera,
                buttonTitle: "Take photo",
                buttonHint: "Takes you to the camera.",
                buttonAction: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => _CameraInputCard(
                                templatePrompt: templatePrompt,
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
          BodyTwoText('Took a photo with Camera Input Tool',
              decorationPriority.standard)
        ]);
  }
}

class _CameraInputCard extends StatefulWidget {
  final String templatePrompt;
  final IconData cardIcon;
  const _CameraInputCard(
      {required this.templatePrompt, required this.cardIcon});

  @override
  _CameraInputCardState createState() => _CameraInputCardState();
}

class _CameraInputCardState extends State<_CameraInputCard> {
  bool _isLoading = true;
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

  void _takePhoto() async {
    final file = await _cameraController.takePicture();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => _CameraReviewCard(
            file: file,
            toolPrompt: widget.templatePrompt,
            cardIcon: widget.cardIcon,
          ),
        ));
  }

  void _initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);
    _cameraController = CameraController(front, ResolutionPreset.max);
    await _cameraController.initialize();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    var topBar = Column(children: [
      SizedBox(
          width: size.layoutItemWidth(1, screenSize),
          height: size.layoutItemWidth(5, screenSize),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: CardBackingDecoration(
                          priority: decorationPriority.important)
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
                      BodyTwoText(
                          widget.templatePrompt, decorationPriority.important),
                      const SizedBox(width: 10.0),
                    ],
                  )),
              const Spacer(),
              IconButtonElement(
                decorationVariant: decorationPriority.standard,
                buttonIcon: Assets.no,
                buttonHint: "Exits the camera.",
                buttonAction: () => {Navigator.pop(context)},
                buttonPriority: buttonSize.secondary,
              ),
            ],
          )),
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
            Positioned(top: 60, child: topBar),
            Positioned(
                bottom: 45,
                child: IconButtonElement(
                  decorationVariant: decorationPriority.important,
                  buttonIcon: Icons.circle_outlined,
                  buttonHint: "Takes a photo.",
                  buttonAction: () => {_takePhoto()},
                  buttonPriority: buttonSize.primary,
                )),
            Container(
                width: size.responsiveSize(250),
                height: size.responsiveSize(250),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: universalBorder(),
                )),
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

class _CameraReviewCard extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables

  final XFile file;
  final IconData cardIcon;
  final String toolPrompt;

  const _CameraReviewCard(
      {Key? key,
      required this.file,
      required this.cardIcon,
      required this.toolPrompt})
      : super(key: key);

  @override
  _CameraReviewCardState createState() => _CameraReviewCardState();
}

class _CameraReviewCardState extends State<_CameraReviewCard> {
  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();
    var popCount = 0;

    var controlBar = SizedBox(
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
                    buttonHint: "Goes back to camera.",
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
                              "Camera tool completed.", Assets.camera)
                        }),
                const Spacer(),
              ],
            ),
          ),
        ));

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
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.file(File(widget.file.path),
                          width: screenSize.width,
                          height: screenSize.height,
                          fit: BoxFit.cover),
                      Positioned(
                        top: 45,
                        child: SizedBox(
                          width: size.layoutItemWidth(1, screenSize),
                          height: size.layoutItemHeight(6, screenSize),
                          child: Container(
                              decoration: CardBackingDecoration(
                                      priority: decorationPriority.important)
                                  .buildBacking(),
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 10.0),
                                  IconBadge(
                                      badgeIcon: widget.cardIcon,
                                      badgePriority:
                                          decorationPriority.inverted),
                                  const SizedBox(width: 20.0),
                                  BodyTwoText(widget.toolPrompt,
                                      decorationPriority.important),
                                ],
                              )),
                        ),
                      ),
                      Positioned(bottom: 30, child: controlBar)
                    ],
                  ))
            ],
            containerVariant: wrapperVariants.fullScreen));
  }
}
