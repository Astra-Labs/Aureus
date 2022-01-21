import 'package:aureus/aureus.dart';

//
//Doc Link:

class LandingPageView extends StatefulWidget {
  final String missionTagline;
  final Image lightModeLandscapeBacking;
  final Image darkModeLandscapeBacking;
  final Image lightModeUIOverlay;
  final Image darkModeUIOverlay;
  final List<StandardIconButtonElement> actionButtons;

  const LandingPageView(
      {required this.missionTagline,
      required this.lightModeLandscapeBacking,
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
          HeadingOneText(widget.missionTagline, decorationPriority.standard)
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

    Container pageFooter = Container(
        width: size.logicalWidth,
        decoration: BoxDecoration(
            color: coloration
                .decorationColor(
                    decorationVariant: decorationPriority.important)
                .withOpacity(0.70),
            border: Border(
                top:
                    BorderSide(color: coloration.inactiveColor(), width: 1.0))),
        child: SizedBox(
          width: size.logicalWidth,
          height: size.logicalHeight * 0.11,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
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
                      SizedBox(width: 8.0),
                      SmolButtonElement(
                          decorationVariant: decorationPriority.standard,
                          buttonTitle: 'See Status',
                          buttonAction: () => {}),
                      SizedBox(width: 8.0),
                      SmolButtonElement(
                          decorationVariant: decorationPriority.standard,
                          buttonTitle: 'Check Impact',
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
            child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                runSpacing: size.heightOf(weight: sizingWeight.w0),
                children: [
                  informationHiearchy,
                  homeScreenOverlay,
                  buttonItems,
                  pageFooter
                ])));

    var webView = SizedBox(
        height: size.logicalHeight,
        width: size.logicalWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
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
                        (0.15 * widget.actionButtons.length),
                    child: buttonItems),
              ],
            ),
            pageFooter
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
