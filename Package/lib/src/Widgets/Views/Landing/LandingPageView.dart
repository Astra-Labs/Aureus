import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- LANDING PAGE VIEW ----------*/
/// A simple view meant to act as a templated landing page for a resource.

class LandingPageView extends StatefulWidget {
  /// An image for the light mode landing page background.
  final Image lightModeLandscapeBacking;

  /// An image for the dark mode landing page background.
  final Image darkModeLandscapeBacking;

  /// An image for the light mode landing page foreground image.
  /// This should be a UI overlay or logo.
  final Image lightModeUIOverlay;

  /// An image for the dark mode landing page foreground image.
  /// This should be a UI overlay or logo.
  final Image darkModeUIOverlay;

  /// A list of [StandardIconButtonElement]s that represent the main
  /// Calls To Action that you want the user to take. These should be limited to
  /// 1 or 2 of the most important things on the landing page.
  final List<StandardIconButtonElement> actionButtons;

  /// A [VoidCallback] that performs an action when a user wants to give you
  /// feedback on your resource. This should link them to a contact page, or
  /// open an email.
  final VoidCallback? onGiveFeedback;

  const LandingPageView(
      {required this.lightModeLandscapeBacking,
      required this.darkModeLandscapeBacking,
      required this.lightModeUIOverlay,
      required this.darkModeUIOverlay,
      required this.actionButtons,
      this.onGiveFeedback});

  @override
  _LandingPageViewState createState() => _LandingPageViewState();
}

class _LandingPageViewState extends State<LandingPageView> {
  var screenSize = size.logicalScreenSize();
  var screenWidth = size.logicalWidth();
  var screenHeight = size.logicalHeight();

  @override
  Widget build(BuildContext context) {
    Column informationHiearchy = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          HeadingTwoText(
              "I'm ${resourceValues.name}", decorationPriority.standard),
          const SizedBox(height: 4.0),
          HeadingOneText(resourceValues.mission, decorationPriority.standard)
        ]);

    Image homeScreenOverlay = palette.brightness() == Brightness.light
        ? widget.lightModeUIOverlay
        : widget.darkModeUIOverlay;

    Image landscapeBacking = palette.brightness() == Brightness.light
        ? widget.lightModeLandscapeBacking
        : widget.darkModeLandscapeBacking;

    Column buttonItems = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: widget.actionButtons,
    );

    Container mobilePageFooter = Container(
        width: screenWidth,
        height: size.layoutItemHeight(2, screenSize),
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
                    '${resourceValues.name} is run by ${resourceValues.developerName}',
                    decorationPriority.standard),
                const SizedBox(width: 10.0),
                widget.onGiveFeedback != null
                    ? SmolButtonElement(
                        decorationVariant: decorationPriority.standard,
                        buttonTitle: 'Give Feedback',
                        buttonHint: 'Opens the place to give feedback.',
                        buttonAction: () => {})
                    : const SizedBox(width: 10.0),
                const SizedBox(width: 10.0),
              ]),
        ));

    Container webPageFooter = Container(
        width: screenWidth,
        decoration: BoxDecoration(
            color: coloration
                .decorationColor(
                    decorationVariant: decorationPriority.important)
                .withOpacity(0.85),
            border: Border(
                top:
                    BorderSide(color: coloration.inactiveColor(), width: 1.0))),
        child: SizedBox(
          width: screenWidth,
          height: screenHeight * 0.15,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  BodyOneText(
                      '${resourceValues.name} is run by ${resourceValues.developerName}.',
                      decorationPriority.standard),
                  Row(
                    children: [
                      widget.onGiveFeedback != null
                          ? SmolButtonElement(
                              decorationVariant: decorationPriority.standard,
                              buttonTitle: 'Give Feedback',
                              buttonHint: 'Opens the place to give feedback.',
                              buttonAction: () => {})
                          : const SizedBox(width: 10.0),
                    ],
                  )
                ]),
          ),
        ));

    var mobileView = SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsets.all(size.widthOf(weight: sizingWeight.w0)),
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
                            height: screenHeight *
                                (0.15 * widget.actionButtons.length),
                            child: buttonItems),
                        const SizedBox(height: 10.0),
                      ]),
                ),
                FloatingContainerElement(child: mobilePageFooter)
              ],
            )));

    var webView = Column(
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
                width: screenWidth / 3.3,
                height: size.layoutItemHeight(1, screenSize),
                child: Center(child: informationHiearchy)),
            SizedBox(
                width: screenWidth / 3.3,
                height: size.layoutItemHeight(1, screenSize),
                child: homeScreenOverlay),
            SizedBox(
                width: screenWidth / 3.3,
                height: size.layoutItemHeight(2, screenSize),
                child: buttonItems),
          ],
        ),
        const Spacer(),
        FloatingContainerElement(child: webPageFooter)
      ],
    );

    return Scaffold(
      body: Container(
          constraints: BoxConstraints(
              minHeight: screenHeight,
              maxHeight: screenHeight,
              minWidth: screenWidth,
              maxWidth: screenWidth),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: landscapeBacking.image,
              fit: BoxFit.cover,
            ),
          ),
          child: SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: size.isDesktopDisplay() ? webView : mobileView)),
    );
  }
}
