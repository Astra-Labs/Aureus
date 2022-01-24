import 'package:aureus/aureus.dart';

class LandingPageView extends StatefulWidget {
  final Image lightModeLandscapeBacking;
  final Image darkModeLandscapeBacking;
  final Image lightModeUIOverlay;
  final Image darkModeUIOverlay;
  final List<StandardIconButtonElement> actionButtons;

  const LandingPageView(
      {required this.lightModeLandscapeBacking,
      required this.darkModeLandscapeBacking,
      required this.lightModeUIOverlay,
      required this.darkModeUIOverlay,
      required this.actionButtons});

  @override
  _LandingPageViewState createState() => _LandingPageViewState();
}

class _LandingPageViewState extends State<LandingPageView> {
  @override
  Widget build(BuildContext context) {
    Column informationHiearchy = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          HeadingTwoText(
              "I'm ${apiVariables.prodName}", decorationPriority.standard),
          SizedBox(height: 4.0),
          HeadingOneText(
              apiVariables.missionTagline, decorationPriority.standard)
        ]);

    Image homeScreenOverlay = brightness() == Brightness.light
        ? widget.lightModeUIOverlay
        : widget.darkModeUIOverlay;

    Image landscapeBacking = brightness() == Brightness.light
        ? widget.lightModeLandscapeBacking
        : widget.darkModeLandscapeBacking;

    Column buttonItems = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: widget.actionButtons,
    );

    Container mobilePageFooter = Container(
        width: size.logicalWidth,
        height: size.layoutItemHeight(2, size.logicalScreenSize),
        decoration: BoxDecoration(
            color: coloration
                .decorationColor(
                    decorationVariant: decorationPriority.important)
                .withOpacity(0.85),
            border: Border(
                top:
                    BorderSide(color: coloration.inactiveColor(), width: 1.0))),
        child: Padding(
          padding: EdgeInsets.all(size.widthOf(weight: sizingWeight.w1)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                BodyOneText(
                    '${apiVariables.prodName} is run by Astra Labs, a 501(c)3 non-profit.',
                    decorationPriority.standard),
                SizedBox(width: 10.0),
                SmolButtonElement(
                    decorationVariant: decorationPriority.standard,
                    buttonTitle: 'Give Feedback',
                    buttonAction: () => {}),
                SizedBox(width: 10.0),
              ]),
        ));

    Container webPageFooter = Container(
        width: size.logicalWidth,
        decoration: BoxDecoration(
            color: coloration
                .decorationColor(
                    decorationVariant: decorationPriority.important)
                .withOpacity(0.85),
            border: Border(
                top:
                    BorderSide(color: coloration.inactiveColor(), width: 1.0))),
        child: SizedBox(
          width: size.logicalWidth,
          height: size.logicalHeight * 0.15,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  BodyOneText(
                      '${apiVariables.prodName} is run by Astra Labs, a 501(c)3 non-profit.',
                      decorationPriority.standard),
                  Row(
                    children: [
                      SmolButtonElement(
                          decorationVariant: decorationPriority.standard,
                          buttonTitle: 'Give Feedback',
                          buttonAction: () => {}),
                    ],
                  )
                ]),
          ),
        ));

    var mobileView = SizedBox(
        height: size.logicalHeight,
        width: size.logicalWidth,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsets.all(size.widthOf(weight: sizingWeight.w1)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: size.heightOf(weight: sizingWeight.w1)),
                        informationHiearchy,
                        SizedBox(
                            height: size.heightOf(weight: sizingWeight.w0)),
                        homeScreenOverlay,
                        SizedBox(
                            height: size.heightOf(weight: sizingWeight.w0)),
                        SizedBox(
                            height: size.logicalHeight *
                                (0.15 * widget.actionButtons.length),
                            child: buttonItems),
                        SizedBox(height: 10.0),
                      ]),
                ),
                FloatingContainerElement(child: mobilePageFooter)
              ],
            )));

    var webView = SizedBox(
        height: size.logicalHeight,
        width: size.logicalWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                    width: size.logicalWidth / 3.5,
                    height: size.logicalHeight * 0.5,
                    child: Center(child: informationHiearchy)),
                SizedBox(
                    width: size.logicalWidth / 3.5,
                    height: size.logicalHeight * 0.88,
                    child: homeScreenOverlay),
                SizedBox(
                    width: size.logicalWidth / 3.5,
                    height: size.logicalHeight *
                        (0.10 * widget.actionButtons.length),
                    child: buttonItems),
              ],
            ),
            FloatingContainerElement(child: webPageFooter)
          ],
        ));

    return Scaffold(
      body: Container(
          constraints: BoxConstraints(
              minHeight: size.logicalHeight,
              maxHeight: size.logicalHeight,
              minWidth: size.logicalWidth,
              maxWidth: size.logicalWidth),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: landscapeBacking.image,
              fit: BoxFit.cover,
            ),
          ),
          child: SizedBox(
              width: size.logicalWidth,
              height: size.logicalHeight,
              child: size.isDesktopDisplay() ? mobileView : webView)),
    );
  }
}
