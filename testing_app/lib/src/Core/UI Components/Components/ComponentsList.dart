part of AureusTestingApp;

/* COMPONENTS */

Map<String, Widget> aureusComponents = {
  'Exit Bar': ExitBarComponent(),
  'Alert Controller': alertController,
  'Content Warning': ContentWarningComponent(
      warningDescription:
          'This article contains mentions of sexual assult and depictions of trauma.',
      onContinue: () => {print('Yee  haw')}),
  'Cookie Banner': CookieBannerComponent(
      cookieMessage:
          'We show cookies to improve your experience. Please enable cookies. owo.',
      onCookieAccept: () => {print('cookies enabled uwu!')},
      onCookieDeny: () => {print('cookies disabled owo!')}),
  'Message Bubbles': Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        senderMessageBubble,
        SizedBox(height: 20),
        receiverMessageBubble
      ]),
  'Notifications': Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [unreadNotification, SizedBox(height: 10), readNotification]),
  'Empty Item Placeholder': blankScreen,
  'Standard Card': testStandardCard,
  'Standard Icon Card': testStandardIconCard,
  'Detail Card': testDetailCard,
  'Detail Icon Card': testDetailIconCard,
  'Detail Carousel Card': testDetailCarouselCard,
  'Complex Card': testComplexCard,
  'Complex Icon Card': testComplexIconCard,
  'Category Card': testCategoryCard,
  'Detail Carousel': testDetailCarousel
};

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
        alertIcon: Assets.expand);

AlertControllerObject multipleTestAlertControllerObject =
    AlertControllerObject.multipleActions(
        onCancellation: () => {print('cancelled')},
        alertTitle: 'Would you like to yee?',
        alertBody: 'Haw. Haw Haw Haw Haw.',
        actions: [testAlertControllerAction, testAlertControllerAction2],
        alertIcon: Assets.expand);

var alertController =
    CenteredAlertControllerComponent(alertData: testAlertControllerObject);

var receiverMessageBubble = MessageBubbleComponent(
    messageVariant: messagingVariants.receiver,
    messageBody: fillerTextBody,
    currentStatus: communicationStatus.delivered);

var senderMessageBubble = MessageBubbleComponent(
    messageVariant: messagingVariants.sender,
    messageBody: fillerTextBody,
    currentStatus: communicationStatus.delivered);

var blankScreen = BlankScreenComponent(
    cardTitle: 'No data to show.',
    cardBody: 'Use the button below to add your first item to track.');

var unreadNotification = NotificationComponent(
    notificationSubCategory: fillerTextSubheader,
    notificationReceived: DateTime.now(),
    notificationHeader: fillerTextHeader,
    notificationBody: fillerTextBody,
    hasNotificationBeenRead: false);

var readNotification = NotificationComponent(
    notificationSubCategory: fillerTextSubheader,
    notificationReceived: DateTime.now(),
    notificationHeader: fillerTextHeader,
    notificationBody: fillerTextBody,
    hasNotificationBeenRead: true);

var searchBar = SearchBarComponent(onSearch: fillerAction);

var sendField = SendFieldComponent(
  onSend: fillerAction,
  textEditController: textEditor,
);

var card = AureusCards();

CardObject standardCardObject = CardObject.standard(
    decorationPriority.standard, fillerTextHeader, fillerAction);

CardObject standardIconCardObject = CardObject.standardIcon(
    decorationPriority.standard, fillerTextHeader, fillerIcon1, fillerAction);

CardObject detailCardObject = CardObject.detailed(decorationPriority.standard,
    fillerTextHeader, fillerTextBody, fillerAction);

CardObject detailIconCardObject = CardObject.detailedIcon(
    decorationPriority.standard,
    fillerTextHeader,
    fillerTextBody,
    fillerIcon1,
    fillerAction);

CardObject complexCardObject = CardObject.complex(
    decorationPriority.standard,
    fillerTextHeader,
    fillerTextBody,
    {
      'Detail 1': fillerIcon1,
      'Detail 2': fillerIcon2,
      'Detail 3': fillerIcon3,
      'Detail 4': fillerIcon4,
    },
    fillerAction);

CardObject complexIconCardObject = CardObject.complexIcon(
    decorationPriority.standard,
    fillerTextHeader,
    fillerTextBody,
    fillerIcon1,
    {
      'Detail 1': fillerIcon1,
      'Detail 2': fillerIcon2,
      'Detail 3': fillerIcon3,
      'Detail 4': fillerIcon4,
    },
    fillerAction);

Widget testStandardCard = card.filledCardObject(
    cardVariant: cardType.standardCard, cardData: standardCardObject);

Widget testStandardIconCard = card.filledCardObject(
    cardVariant: cardType.standardBadgeCard, cardData: standardIconCardObject);

Widget testDetailCard = card.filledCardObject(
    cardVariant: cardType.detailCard, cardData: detailCardObject);

Widget testDetailIconCard = card.filledCardObject(
    cardVariant: cardType.detailBadgeCard, cardData: detailIconCardObject);

Widget testDetailCarouselCard = card.filledCardObject(
    cardVariant: cardType.detailCarouselCard, cardData: standardIconCardObject);

Widget testComplexCard = card.filledCardObject(
    cardVariant: cardType.complexCard, cardData: complexCardObject);

Widget testComplexIconCard = card.filledCardObject(
    cardVariant: cardType.complexBadgeCard, cardData: complexIconCardObject);

Widget testCategoryCard = card.filledCardObject(
    cardVariant: cardType.categoryIconDetailCard,
    cardData: complexIconCardObject);

Widget testDetailCarousel = DetailCardCarouselComponent(cardDetailCarousel: {
  'Detail 1': fillerIcon1,
  'Detail 2': fillerIcon2,
  'Detail 3': fillerIcon3,
  'Detail 4': fillerIcon4,
});

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
