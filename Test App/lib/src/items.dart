part of 'aur-lib.dart';

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
var glassCard = GlassCardElement();
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
    currentVariant: buttonVariants.darkActive,
    buttonAction: fillerAction);

var lightFullWidthButton = FullWidthButtonElement(
    buttonTitle: fillerTextButton,
    currentVariant: buttonVariants.lightActive,
    buttonAction: fillerAction);

var inactiveFullWidthButton = FullWidthButtonElement(
    buttonTitle: fillerTextButton,
    currentVariant: buttonVariants.inactive,
    buttonAction: fillerAction);

var darkPrimaryIconButton = PrimaryIconButtonElement(
    currentVariant: buttonVariants.darkActive,
    buttonIcon: Icon(fillerIcon1, color: foundation.white()),
    buttonTooltip: fillerTextButton,
    buttonAction: fillerAction);

var lightPrimaryIconButton = PrimaryIconButtonElement(
    currentVariant: buttonVariants.lightActive,
    buttonIcon: Icon(fillerIcon1, color: foundation.black()),
    buttonTooltip: fillerTextButton,
    buttonAction: fillerAction);

var inactivePrimaryIconButton = PrimaryIconButtonElement(
    currentVariant: buttonVariants.inactive,
    buttonIcon: Icon(fillerIcon1, color: foundation.steel()),
    buttonTooltip: fillerTextButton,
    buttonAction: fillerAction);

var darkSecondaryIconButton = SecondaryIconButtonElement(
    currentVariant: buttonVariants.darkActive,
    buttonIcon: Icon(fillerIcon1, color: foundation.white()),
    buttonTooltip: fillerTextButton,
    buttonAction: fillerAction);

var lightSecondaryIconButton = SecondaryIconButtonElement(
    currentVariant: buttonVariants.lightActive,
    buttonIcon: Icon(fillerIcon1, color: foundation.black()),
    buttonTooltip: fillerTextButton,
    buttonAction: fillerAction);

var inactiveSecondaryIconButton = SecondaryIconButtonElement(
    currentVariant: buttonVariants.inactive,
    buttonIcon: Icon(fillerIcon1, color: foundation.steel()),
    buttonTooltip: fillerTextButton,
    buttonAction: fillerAction);

var darkSmolButton = SmolButtonElement(
    currentVariant: buttonVariants.darkActive,
    buttonTitle: fillerTextButton,
    buttonAction: fillerAction);

var lightSmolButton = SmolButtonElement(
    currentVariant: buttonVariants.lightActive,
    buttonTitle: fillerTextButton,
    buttonAction: fillerAction);

var inactiveSmolButton = SmolButtonElement(
    currentVariant: buttonVariants.inactive,
    buttonTitle: fillerTextButton,
    buttonAction: fillerAction);

var darkStandardButton = StandardButtonElement(
    currentVariant: buttonVariants.darkActive,
    buttonTitle: fillerTextButton,
    buttonAction: fillerAction);

var lightStandardButton = StandardButtonElement(
    currentVariant: buttonVariants.lightActive,
    buttonTitle: fillerTextButton,
    buttonAction: fillerAction);

var inactiveStandardButton = StandardButtonElement(
    currentVariant: buttonVariants.inactive,
    buttonTitle: fillerTextButton,
    buttonAction: fillerAction);

/* COMPONENTS */

var badgeGridCarousel = GridCardComponent(fillerLabels, CardType.badge);
var standardGridCarousel = GridCardComponent(fillerLabels, CardType.standard);

var badgeHorizontalCardCarousel = HorizontalCardCarouselComponent(
    fillerTextHeader, CardType.badge, fillerLabels, fillerIcons);
var standardHorizontalCardCarousel = HorizontalCardCarouselComponent(
    fillerTextHeader, CardType.standard, fillerLabels);

var lightReceiverMessageBubble = MessageBubbleComponent(
    modeVariant: modeVariants.light,
    messageVariant: messagingVariants.receiver,
    messageBody: fillerTextBody,
    currentStatus: communicationStatus.delivered);

var lightSenderMessageBubble = MessageBubbleComponent(
    modeVariant: modeVariants.light,
    messageVariant: messagingVariants.sender,
    messageBody: fillerTextBody,
    currentStatus: communicationStatus.delivered);

var darkReceiverMessageBubble = MessageBubbleComponent(
    modeVariant: modeVariants.dark,
    messageVariant: messagingVariants.receiver,
    messageBody: fillerTextBody,
    currentStatus: communicationStatus.delivered);

var darkSenderMessageBubble = MessageBubbleComponent(
    modeVariant: modeVariants.dark,
    messageVariant: messagingVariants.sender,
    messageBody: fillerTextBody,
    currentStatus: communicationStatus.delivered);

var notification = NotificationComponent(
    notificationSubCategory: fillerTextSubheader,
    notificationReceived: DateTime.now(),
    notificationHeader: fillerTextHeader,
    notificationBody: fillerTextBody,
    hasNotificationBeenRead: false);

var darkSearchBar =
    SearchBarComponent(onSearch: fillerAction, barVariant: modeVariants.dark);

var lightSearchBar =
    SearchBarComponent(onSearch: fillerAction, barVariant: modeVariants.light);

var darkSendField =
    SendFieldComponent(onSend: fillerAction, fieldVariant: modeVariants.dark);

var lightSendField =
    SendFieldComponent(onSend: fillerAction, fieldVariant: modeVariants.light);

/* VIEWS */
var darkContainerView =
    ContainerView(modeVariant: modeVariants.dark, hasExitBar: true);
var lightContainerView =
    ContainerView(modeVariant: modeVariants.light, hasExitBar: true);

/* MISC */

//array of all elements available in aureus
List<Widget> libElements = [
  /* badgeCard,
  glassCard,
  pastelCard,
  standardCard,
  tabSubheader,
  divider,
  timer,
  singleInput,
  multiInput,
  darkFullWidthButton,
  lightFullWidthButton,
  inactiveFullWidthButton
  darkPrimaryIconButton,
  lightPrimaryIconButton,
  inactivePrimaryIconButton,
  darkSecondaryIconButton,
  lightSecondaryIconButton,
  inactiveSecondaryIconButton,
  darkSmolButton,
  lightSmolButton,
  inactiveSmolButton
  darkStandardButton,
  lightStandardButton,
  inactiveStandardButton,
  lightDetailCarousel,
  darkDetailCarousel
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
  lightSendField*/
  lightContainerView
];
