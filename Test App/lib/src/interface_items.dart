import 'package:aureus/aureus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

var darkFullWidthButton = FullWidthButtonElement(
    buttonTitle: fillerTextButton,
    currentVariant: decorationPriority.standard,
    buttonAction: fillerAction);

var lightFullWidthButton = FullWidthButtonElement(
    buttonTitle: fillerTextButton,
    currentVariant: decorationPriority.important,
    buttonAction: fillerAction);

var inactiveFullWidthButton = FullWidthButtonElement(
    buttonTitle: fillerTextButton,
    currentVariant: decorationPriority.inactive,
    buttonAction: fillerAction);

var darkPrimaryIconButton = PrimaryIconButtonElement(
    buttonIcon: Icon(fillerIcon1, color: foundation.white()),
    buttonTooltip: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.important);

var lightPrimaryIconButton = PrimaryIconButtonElement(
    buttonIcon: Icon(fillerIcon1, color: foundation.black()),
    buttonTooltip: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.important);

var inactivePrimaryIconButton = PrimaryIconButtonElement(
    buttonIcon: Icon(fillerIcon1, color: foundation.steel()),
    buttonTooltip: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.important);

var darkSecondaryIconButton = SecondaryIconButtonElement(
    buttonIcon: Icon(fillerIcon1, color: foundation.white()),
    buttonTooltip: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.important);

var lightSecondaryIconButton = SecondaryIconButtonElement(
    buttonIcon: Icon(fillerIcon1, color: foundation.black()),
    buttonTooltip: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.important);

var inactiveSecondaryIconButton = SecondaryIconButtonElement(
    buttonIcon: Icon(fillerIcon1, color: foundation.steel()),
    buttonTooltip: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.important);

var darkSmolButton = SmolButtonElement(
    buttonTitle: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.important);

var lightSmolButton = SmolButtonElement(
    buttonTitle: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.important);

var inactiveSmolButton = SmolButtonElement(
    buttonTitle: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.important);

var darkStandardButton = StandardButtonElement(
    buttonTitle: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.important);

var lightStandardButton = StandardButtonElement(
    buttonTitle: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.important);

var inactiveStandardButton = StandardButtonElement(
    buttonTitle: fillerTextButton,
    buttonAction: fillerAction,
    decorationVariant: decorationPriority.important);

/* COMPONENTS */

var badgeGridCarousel = GridCardComponent(fillerLabels, CardType.badge);
var standardGridCarousel = GridCardComponent(fillerLabels, CardType.standard);

var badgeHorizontalCardCarousel = HorizontalCardCarouselComponent(
    fillerTextHeader, CardType.badge, fillerLabels, fillerIcons);
var standardHorizontalCardCarousel = HorizontalCardCarouselComponent(
    fillerTextHeader, CardType.standard, fillerLabels);

var lightReceiverMessageBubble = MessageBubbleComponent(
    messageVariant: messagingVariants.receiver,
    messageBody: fillerTextBody,
    currentStatus: communicationStatus.delivered);

var lightSenderMessageBubble = MessageBubbleComponent(
    messageVariant: messagingVariants.sender,
    messageBody: fillerTextBody,
    currentStatus: communicationStatus.delivered);

var darkReceiverMessageBubble = MessageBubbleComponent(
    messageVariant: messagingVariants.receiver,
    messageBody: fillerTextBody,
    currentStatus: communicationStatus.delivered);

var darkSenderMessageBubble = MessageBubbleComponent(
    messageVariant: messagingVariants.sender,
    messageBody: fillerTextBody,
    currentStatus: communicationStatus.delivered);

var notification = NotificationComponent(
    notificationSubCategory: fillerTextSubheader,
    notificationReceived: DateTime.now(),
    notificationHeader: fillerTextHeader,
    notificationBody: fillerTextBody,
    hasNotificationBeenRead: false);

var darkSearchBar = SearchBarComponent(onSearch: fillerAction);

var lightSearchBar = SearchBarComponent(onSearch: fillerAction);

var darkSendField = SendFieldComponent(onSend: fillerAction);

var lightSendField = SendFieldComponent(onSend: fillerAction);

/* VIEWS */

/* Test Builder */
LayoutBuilder landing1 =
    LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
  var testAction = AlertControllerAction(
      actionName: 'Yee the haw',
      actionSeverity: AlertControllerActionSeverity.destruct,
      onSelection: () => {print('yee haw!')});

  var testObject = AlertControllerObject.singleAction(
      onCancellation: () => {print('cancelled')},
      alertTitle: 'Would you like to yee?',
      alertBody: 'Haw. Haw Haw Haw Haw.',
      actions: [testAction]);

  return CenteredAlertControllerComponent(alertData: testObject);
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

var darkImportantContainerView = ContainerView(
    decorationVariant: decorationPriority.standard, builder: landing1);

var lightStandardContainerView = ContainerView(
    decorationVariant: decorationPriority.important, builder: landing1);

var lightImportantContainerView = ContainerView(
    decorationVariant: decorationPriority.important, builder: landing1);

/* MISC */

//array of all elements available in aureus
List<Widget> libElements = [
  /*badgeCard,
  glassCard,
  pastelCard,
  standardCard,
  tabSubheader,
  divider,
  timer, */
  singleInput,
  multiInput,
  darkFullWidthButton,
  lightFullWidthButton,
  inactiveFullWidthButton,
  darkPrimaryIconButton,
  lightPrimaryIconButton,
  inactivePrimaryIconButton,
  darkSecondaryIconButton,
  lightSecondaryIconButton,
  inactiveSecondaryIconButton,
  darkSmolButton,
  lightSmolButton,
  inactiveSmolButton,
  darkStandardButton,
  lightStandardButton,
  inactiveStandardButton,
  badgeGridCarousel,
  standardGridCarousel,
  badgeHorizontalCardCarousel,
  standardHorizontalCardCarousel,
  lightReceiverMessageBubble,
  darkReceiverMessageBubble,
  lightSenderMessageBubble,
  darkSenderMessageBubble,
  notification,
  darkSearchBar,
  lightSearchBar,
  darkSendField,
  lightSendField
];
