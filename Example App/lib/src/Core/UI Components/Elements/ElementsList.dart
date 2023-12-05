part of AureusTestingApp;

/* ELEMENTS */

// ELEMENTS MAP -----------------------------------------

Map<String, Widget> aureusElements = {
  'Typography': textTestListView,
  'Tab Subheader': tabSubheader,
  'Slider': slider,
  'Timer': timer,
  'Full Width Button': Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        standardFullWidthButton,
        SizedBox(height: 10),
        importantFullWidthButton,
        SizedBox(height: 10),
        inactiveFullWidthButton
      ]),
  'Primary Icon Buttons': Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        standardPrimaryIconButton,
        SizedBox(height: 10),
        importantPrimaryIconButton,
        SizedBox(height: 10),
        inactivePrimaryIconButton
      ]),
  'Secondary Icon Buttons': Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        standardSecondaryIconButton,
        SizedBox(height: 10),
        importantSecondaryIconButton,
        SizedBox(height: 10),
        inactiveSecondaryIconButton
      ]),
  'Smol Buttons': Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        standardSmolButton,
        SizedBox(height: 10),
        importantSmolButton,
        SizedBox(height: 10),
        inactiveSmolButton
      ]),
  'Standard Buttons': Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        standardStandardButton,
        SizedBox(height: 10),
        importantStandardButton,
        SizedBox(height: 10),
        inactiveStandardButton
      ]),
  'Standard Icon Buttons': Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        standardStandardIconButton,
        SizedBox(height: 10),
        importantStandardIconButton,
        SizedBox(height: 10),
        inactiveStandardIconButton
      ]),
  'Article View Element': articleViewElement,
  'Mission Header': missionHeader,
  'Page Header': Column(
    children: [
      pageHeaderElement,
      SizedBox(height: 10.0),
      pageHeaderElement2,
    ],
  ),
  'Divider': dividerElement,
  'Dividing Header': dividingHeaderElement,
  'Floating Container': floatingContainerElement,
  'Completion Circle': completionCircleElement,
  'Loading Circle': loadingCircleElement,
  'Progress Indicator': progressIndicatorElement,
};

// TYPOGRAPHY -----------------------------------------

//where all text related items in aureus are initiated for testing

Widget text1 =
    HeadingOneText(data: 'Heading One', textColor: decorationPriority.standard);
Text text2 = HeadingTwoText('Heading Two', decorationPriority.standard);
Text text3 = HeadingThreeText('Heading Three', decorationPriority.standard);
Text text4 = HeadingFourText('Heading Four', decorationPriority.standard);
Text text5 = SubheaderText('Subheader', decorationPriority.standard);
Text text6 = BodyOneText('Body One', decorationPriority.standard);
Text text7 = BodyTwoText('Body Two', decorationPriority.standard);
Text text8 = ButtonOneText('Button One', decorationPriority.standard);
Text text9 = ButtonTwoText('Button Two', decorationPriority.standard);
Text text10 = TagOneText('Tag One', decorationPriority.standard);
Text text11 = TagTwoText('Tag Two', decorationPriority.standard);

List<Widget> textTesting = [
  text1,
  text2,
  text3,
  text4,
  text5,
  text6,
  text7,
  text8,
  text9,
  text10,
  text11
];

var textTestListView = backingLayer(
  ListView.separated(
    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
    shrinkWrap: true,
    itemCount: textTesting.length,
    itemBuilder: (BuildContext context, int index) {
      return textTesting[index];
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  ),
);

Widget backingLayer(Widget child) {
  return Container(
    decoration:
        LayerBackingDecoration(decorationVariant: decorationPriority.inactive)
            .buildBacking(),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: child,
      ),
    ),
  );
}

// ITEMS -----------------------------------------

var tabSubheader = TabSubheaderElement(title: fillerTextSubheader);
var divider = DividerElement();

var slider = SliderElement();
var timer = backingLayer(TimerElement(timeAllotment: Duration(seconds: 30)));

var textEditor = TextEditingController();

var standardFullWidthButton = FullWidthButtonElement(
    buttonTitle: fillerTextButton,
    currentVariant: decorationPriority.standard,
    buttonHint: 'Hint here!',
    buttonAction: fillerAction);

var importantFullWidthButton = FullWidthButtonElement(
    buttonTitle: fillerTextButton,
    currentVariant: decorationPriority.important,
    buttonHint: 'Hint here!',
    buttonAction: fillerAction);

var inactiveFullWidthButton = FullWidthButtonElement(
    buttonTitle: fillerTextButton,
    currentVariant: decorationPriority.inactive,
    buttonHint: 'Hint here!',
    buttonAction: fillerAction);

var standardPrimaryIconButton = IconButtonElement(
    buttonIcon: fillerIcon1,
    buttonHint: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.standard,
    buttonPriority: buttonSize.primary);

var importantPrimaryIconButton = IconButtonElement(
    buttonIcon: fillerIcon1,
    buttonHint: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.important,
    buttonPriority: buttonSize.primary);

var inactivePrimaryIconButton = IconButtonElement(
    buttonIcon: fillerIcon1,
    buttonHint: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.inactive,
    buttonPriority: buttonSize.primary);

var standardSecondaryIconButton = IconButtonElement(
    buttonIcon: fillerIcon1,
    buttonHint: 'Hint here!',
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.standard,
    buttonPriority: buttonSize.secondary);

var importantSecondaryIconButton = IconButtonElement(
    buttonIcon: fillerIcon1,
    buttonHint: 'Hint here!',
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.important,
    buttonPriority: buttonSize.secondary);

var inactiveSecondaryIconButton = IconButtonElement(
    buttonIcon: fillerIcon1,
    buttonHint: 'Hint here!',
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.inactive,
    buttonPriority: buttonSize.secondary);

var standardSmolButton = SmolButtonElement(
    buttonTitle: fillerTextButton,
    buttonAction: fillerAction,
    buttonHint: 'Hint here!',
    decorationVariant: decorationPriority.standard);

var importantSmolButton = SmolButtonElement(
    buttonTitle: fillerTextButton,
    buttonAction: fillerAction,
    buttonHint: 'Hint here!',
    decorationVariant: decorationPriority.important);

var inactiveSmolButton = SmolButtonElement(
    buttonTitle: fillerTextButton,
    buttonAction: fillerAction,
    buttonHint: 'Hint here!',
    decorationVariant: decorationPriority.inactive);

var standardStandardButton = StandardButtonElement(
    buttonTitle: fillerTextButton,
    buttonHint: "Completes $fillerTextButton",
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.standard);

var importantStandardButton = StandardButtonElement(
    buttonTitle: fillerTextButton,
    buttonHint: "Completes $fillerTextButton",
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.important);

var inactiveStandardButton = StandardButtonElement(
    buttonTitle: fillerTextButton,
    buttonHint: "Completes $fillerTextButton",
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.inactive);

var standardStandardIconButton = StandardIconButtonElement(
    buttonTitle: fillerTextButton,
    buttonIcon: fillerIcon1,
    buttonHint: "Completes $fillerTextButton",
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.standard);

var importantStandardIconButton = StandardIconButtonElement(
    buttonTitle: fillerTextButton,
    buttonIcon: fillerIcon2,
    buttonHint: "Completes $fillerTextButton",
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.important);

var inactiveStandardIconButton = StandardIconButtonElement(
    buttonTitle: fillerTextButton,
    buttonIcon: fillerIcon3,
    buttonHint: "Completes $fillerTextButton",
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.inactive);

var articleViewElement = backingLayer(
  ArticleViewElement(
    title: fillerTextHeader,
    subheader: fillerTextSubheader,
    body: fillerTextBody,
  ),
);

var missionHeader = backingLayer(
  MissionHeaderElement(),
);

var pageHeaderElement = backingLayer(PageHeaderElement.withExit(
  pageTitle: fillerTextHeader,
  onPageExit: () => {
    notificationMaster.sendAlertNotificationRequest(
        "Request page exit", Assets.add)
  },
));

var pageHeaderElement2 = backingLayer(
  PageHeaderElement.withOptionsExit(
      pageTitle: fillerTextHeader,
      onPageDetails: () => {
            notificationMaster.sendAlertNotificationRequest(
                "Requested page details", Assets.add)
          },
      onPageExit: () => {
            notificationMaster.sendAlertNotificationRequest(
                "Request page exit", Assets.add)
          }),
);

var dividerElement = backingLayer(DividerElement());

var dividingHeaderElement = backingLayer(
  DividingHeaderElement(
    headerText: fillerTextHeader,
    subheaderText: fillerTextSubheader,
  ),
);

var floatingContainerElement = FloatingContainerElement(
  child: SizedBox(
    width: 50,
    height: 50,
    child: Container(
      decoration:
          CardBackingDecoration(decorationVariant: decorationPriority.standard)
              .buildBacking(),
    ),
  ),
);

var completionCircleElement =
    backingLayer(CompletionCircleElement(progressValue: 0.2));

var loadingCircleElement = backingLayer(LoadingCircleElement());

var progressIndicatorElement =
    backingLayer(ProgressIndicatorElement(value: 0.5));
