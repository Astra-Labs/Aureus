part of AureusTestingApp;

/* ELEMENTS */

// ELEMENTS MAP -----------------------------------------

Map<String, Widget> aureusElements = {
  'Typography': textTestListView,
  'Tab Subheader': tabSubheader,
  'Slider': slider,
  'Timer': timer,
  'Standard Text Field': singleInput,
  'Labeled Input Text Field': multiInput,
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
};

// TYPOGRAPHY -----------------------------------------

//where all text related items in aureus are initiated for testing

Text text1 = HeadingOneText('Heading One', decorationPriority.standard);
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

List<Text> textTesting = [
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

var textTestListView = ListView.separated(
  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
  shrinkWrap: true,
  itemCount: textTesting.length,
  itemBuilder: (BuildContext context, int index) {
    return textTesting[index];
  },
  separatorBuilder: (BuildContext context, int index) => const Divider(),
);

// ITEMS -----------------------------------------

var tabSubheader = TabSubheaderElement(title: fillerTextSubheader);
var divider = DividerElement();

var slider = SliderElement();
var timer = TimerElement(timeAllotment: Duration(seconds: 30));

var textEditor = TextEditingController();

var singleInput = SingleDataTypeUserInputElement(
  dataPlaceholder: fillerPlaceholder,
  itemTextEditingController: textEditor,
  isEnabled: true,
);

var multiInput = MultipleDataTypeUserInputElement(
  dataLabel: fillerTextSubheader,
  dataPlaceholder: fillerPlaceholder,
  isEnabled: true,
);

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
