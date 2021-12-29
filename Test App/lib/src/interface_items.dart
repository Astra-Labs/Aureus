import 'package:aureus/aureus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/src/playground.dart';

//where all items in aureus are initiated for testing

//FILLER DATA
var fillerTextHeader = 'Header';
var fillerTextSubheader = 'Subheader';
var fillerTextBody = 'This is body text.';
var fillerTextButton = 'Press here.';
var fillerTextAlert = 'Action completed.';
var fillerTextMissionLabel = 'How can I help?';
var fillerTextCardName = 'Card';
var fillerPlaceholder = 'Item';

var fillerIcon1 = Assets.add;
var fillerIcon2 = Assets.alert;
var fillerIcon3 = Assets.speedometer;
var fillerIcon4 = Assets.apple;
var fillerIcon5 = Assets.brain;

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
var badgeCard =
    BadgeCardElement(cardLabel: fillerTextCardName, cardIcon: fillerIcon1);
var pastelCard = PastelCardElement(fillerTextCardName);
var standardCard = StandardCardElement(fillerTextCardName);

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

var badgeGridCarousel = GridCardComponent(fillerLabels, CardType.badge);
var standardGridCarousel = GridCardComponent(fillerLabels, CardType.standard);

var badgeHorizontalCardCarousel = HorizontalCardCarouselComponent(
    fillerTextHeader, CardType.badge, fillerLabels, fillerIcons);
var standardHorizontalCardCarousel = HorizontalCardCarouselComponent(
    fillerTextHeader, CardType.standard, fillerLabels);

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

/* VIEWS */

/* Test Builder */
LayoutBuilder landing1 =
    LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
  List<Widget> landingTestWidget = [searchBar];

  return ListView.separated(
    padding: const EdgeInsets.all(8),
    shrinkWrap: true,
    itemCount: landingTestWidget.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(child: Center(child: landingTestWidget[index]));
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

var darkStandardContainerView = ContainerView(
    decorationVariant: decorationPriority.standard, builder: landing1);

var lightStandardContainerView = ContainerView(
    decorationVariant: decorationPriority.important, builder: landing1);

/* MISC */

//array of all elements available in aureus
List<Widget> libElements = [
  badgeCard,
  pastelCard,
  standardCard,
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
  badgeGridCarousel,
  standardGridCarousel,
  badgeHorizontalCardCarousel,
  standardHorizontalCardCarousel,
  receiverMessageBubble,
  senderMessageBubble,
  notification,
  searchBar,
  sendField
];
