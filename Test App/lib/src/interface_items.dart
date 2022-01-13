import 'package:aureus/aureus.dart';
import 'package:test_app/src/playground.dart';

//where all items in aureus are initiated for testing

//FILLER DATA
var fillerTextHeader = 'Header';
var fillerTextSubheader = 'Subheader';
var fillerTextBody =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';
var fillerTextButton = 'Press here.';
var fillerTextAlert = 'Action completed.';
var fillerTextMissionLabel = 'How can I help?';
var fillerTextCardName = 'Card Item';
var fillerPlaceholder = 'Item';

var fillerIcon1 = Icons.add;
var fillerIcon2 = Icons.center_focus_weak_sharp;
var fillerIcon3 = Icons.deck;
var fillerIcon4 = Icons.keyboard;
var fillerIcon5 = Icons.pages;

var fillerLabels = ['Label 1', 'Label 2', 'Label 3', 'Label 4', 'Label 5'];
var fillerIcons = [
  fillerIcon1,
  fillerIcon2,
  fillerIcon3,
  fillerIcon4,
  fillerIcon5
];

void fillerAction() {
  print('Action completed');
}

var testAlertControllerAction = AlertControllerAction(
    actionName: 'Yee the haw',
    actionSeverity: AlertControllerActionSeverity.confirm,
    onSelection: () => {print('yee haw!')});

var testAlertControllerAction2 = AlertControllerAction(
    actionName: 'Haw the yee',
    actionSeverity: AlertControllerActionSeverity.destruct,
    onSelection: () => {print('haw yee!')});

late AlertControllerObject testAlertControllerObject =
    AlertControllerObject.singleAction(
        onCancellation: () => {print('cancelled')},
        alertTitle: 'Would you like to yee?',
        alertBody: 'Haw. Haw Haw Haw Haw.',
        actions: [testAlertControllerAction],
        alertIcon: Icons.access_alarm);

/* ELEMENTS */

var tabSubheader = TabSubheaderElement(title: fillerTextSubheader);
var divider = DividerElement();

var slider = SliderElement();
var timer = TimerElement();

var singleInput = SingleDataTypeUserInputElement(
    dataPlaceholder: fillerPlaceholder, dataTextType: TextInputType.name);

var multiInput = MultipleDataTypeUserInputElement(
    dataLabel: fillerTextSubheader,
    dataPlaceholder: fillerPlaceholder,
    dataTextType: TextInputType.name);

var standardFullWidthButton = FullWidthButtonElement(
    buttonTitle: fillerTextButton,
    currentVariant: decorationPriority.standard,
    buttonAction: fillerAction);

var importantFullWidthButton = FullWidthButtonElement(
    buttonTitle: fillerTextButton,
    currentVariant: decorationPriority.important,
    buttonAction: fillerAction);

var inactiveFullWidthButton = FullWidthButtonElement(
    buttonTitle: fillerTextButton,
    currentVariant: decorationPriority.inactive,
    buttonAction: fillerAction);

var standardPrimaryIconButton = PrimaryIconButtonElement(
    buttonIcon: fillerIcon1,
    buttonTooltip: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.standard);

var importantPrimaryIconButton = PrimaryIconButtonElement(
    buttonIcon: fillerIcon1,
    buttonTooltip: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.important);

var inactivePrimaryIconButton = PrimaryIconButtonElement(
    buttonIcon: fillerIcon1,
    buttonTooltip: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.inactive);

var standardSecondaryIconButton = SecondaryIconButtonElement(
    buttonIcon: fillerIcon1,
    buttonTooltip: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.standard);

var importantSecondaryIconButton = SecondaryIconButtonElement(
    buttonIcon: fillerIcon1,
    buttonTooltip: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.important);

var inactiveSecondaryIconButton = SecondaryIconButtonElement(
    buttonIcon: fillerIcon1,
    buttonTooltip: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.inactive);

var standardSmolButton = SmolButtonElement(
    buttonTitle: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.standard);

var importantSmolButton = SmolButtonElement(
    buttonTitle: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.important);

var inactiveSmolButton = SmolButtonElement(
    buttonTitle: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.inactive);

var standardStandardButton = StandardButtonElement(
    buttonTitle: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.standard);

var importantStandardButton = StandardButtonElement(
    buttonTitle: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.important);

var inactiveStandardButton = StandardButtonElement(
    buttonTitle: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.inactive);

/* COMPONENTS */

var receiverMessageBubble = MessageBubbleComponent(
    messageVariant: messagingVariants.receiver,
    messageBody: fillerTextBody,
    currentStatus: communicationStatus.delivered);

var senderMessageBubble = MessageBubbleComponent(
    messageVariant: messagingVariants.sender,
    messageBody: fillerTextBody,
    currentStatus: communicationStatus.delivered);

var notification = NotificationComponent(
    notificationSubCategory: fillerTextSubheader,
    notificationReceived: DateTime.now(),
    notificationHeader: fillerTextHeader,
    notificationBody: fillerTextBody,
    hasNotificationBeenRead: false);

var searchBar = SearchBarComponent(onSearch: fillerAction);

var sendField = SendFieldComponent(onSend: fillerAction);

Widget testStandardCard = Playground().filledCardObject(
    cardVariant: cardType.StandardCard,
    cardData: Playground().standardCardObject);

Widget testStandardIconCard = Playground().filledCardObject(
    cardVariant: cardType.StandardBadgeCard,
    cardData: Playground().standardIconCardObject);

Widget testDetailCard = Playground().filledCardObject(
    cardVariant: cardType.DetailCard, cardData: Playground().detailCardObject);

Widget testDetailIconCard = Playground().filledCardObject(
    cardVariant: cardType.DetailBadgeCard,
    cardData: Playground().detailIconCardObject);

Widget testDetailCarouselCard = Playground().filledCardObject(
    cardVariant: cardType.DetailCarouselCard,
    cardData: Playground().standardIconCardObject);

Widget testComplexCard = Playground().filledCardObject(
    cardVariant: cardType.ComplexCard,
    cardData: Playground().complexCardObject);

Widget testComplexIconCard = Playground().filledCardObject(
    cardVariant: cardType.ComplexBadgeCard,
    cardData: Playground().complexIconCardObject);

Widget testCategoryCard = Playground().filledCardObject(
    cardVariant: cardType.CategoryIconDetailCard,
    cardData: Playground().complexIconCardObject);

var testingCards = SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          testStandardCard,
          Padding(padding: EdgeInsets.fromLTRB(0, 5.0, 0.0, 5.0)),
          testStandardIconCard,
          Padding(padding: EdgeInsets.fromLTRB(0, 5.0, 0.0, 5.0)),
          testDetailCard,
          Padding(padding: EdgeInsets.fromLTRB(0, 5.0, 0.0, 5.0)),
          testDetailIconCard,
          Padding(padding: EdgeInsets.fromLTRB(0, 5.0, 0.0, 5.0)),
          testDetailCarouselCard,
          Padding(padding: EdgeInsets.fromLTRB(0, 5.0, 0.0, 5.0)),
          testComplexCard,
          Padding(padding: EdgeInsets.fromLTRB(0, 5.0, 0.0, 5.0)),
          testComplexIconCard,
          Padding(padding: EdgeInsets.fromLTRB(0, 5.0, 0.0, 5.0)),
          testCategoryCard
        ]));

/* VIEWS */

/* Test Builder */
LayoutBuilder landing1 =
    LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
  List<Widget> testCards = [];

  return ListView.separated(
    padding: const EdgeInsets.all(8),
    shrinkWrap: true,
    itemCount: testCards.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(child: Center(child: testCards[index]));
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  );
});

LayoutBuilder landing2 =
    LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
  NotificationComponent notification1 = NotificationComponent(
      notificationSubCategory: 'Hi!',
      notificationReceived: DateTime.now(),
      notificationHeader: 'Kill me now.',
      notificationBody: 'Let me out of this codebase cursed body.',
      hasNotificationBeenRead: true);

  NotificationComponent notification2 = NotificationComponent(
      notificationSubCategory: 'SCREM',
      notificationReceived: DateTime.now(),
      notificationHeader: 'If there is a god.',
      notificationBody: 'he is not on my side..',
      hasNotificationBeenRead: false);

  NotificationComponent notification3 = NotificationComponent(
      notificationSubCategory: 'pls',
      notificationReceived: DateTime.now(),
      notificationHeader: 'salt chip.',
      notificationBody: 'salt ,, vinegar chip ,, provide ,, provide me salt ',
      hasNotificationBeenRead: false);

  return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [notification1, notification2, notification3]);
});

var standardContainerView = ContainerView(
    decorationVariant: decorationPriority.standard, builder: landing1);

var importantContainerView = ContainerView(
    decorationVariant: decorationPriority.important, builder: landing1);

Widget childWidget1 = Container(color: lavender());
Widget childWidget2 = Container(color: melt());
Widget childWidget3 = Container(color: ice());
Widget childWidget4 = Container(color: steel());

TabObject tab1 = TabObject.forIconTabbing(
    tabIcon: fillerIcon1,
    childController: childWidget1,
    tabPriority: decorationPriority.standard,
    accessibilityHint: 'Lavender');

TabObject tab2 = TabObject.forIconTabbing(
    tabIcon: fillerIcon2,
    childController: childWidget2,
    tabPriority: decorationPriority.standard,
    accessibilityHint: 'Melt');

TabObject tab3 = TabObject.forIconTabbing(
    tabIcon: fillerIcon3,
    childController: childWidget3,
    tabPriority: decorationPriority.standard,
    accessibilityHint: 'Ice');

TabObject tab4 = TabObject.forIconTabbing(
    tabIcon: fillerIcon4,
    childController: childWidget4,
    tabPriority: decorationPriority.standard,
    accessibilityHint: 'Steel');

/* MISC */

//array of all elements available in aureus
List<Widget> libElements = [
  tabSubheader,
  divider,
  timer,
  singleInput,
  multiInput,
  inactiveFullWidthButton,
  standardPrimaryIconButton,
  importantPrimaryIconButton,
  inactivePrimaryIconButton,
  standardSecondaryIconButton,
  importantSecondaryIconButton,
  inactiveSecondaryIconButton,
  standardSmolButton,
  importantSmolButton,
  inactiveSmolButton,
  standardStandardButton,
  importantStandardButton,
  inactiveStandardButton,
  receiverMessageBubble,
  senderMessageBubble,
  notification,
  searchBar,
  sendField
];
