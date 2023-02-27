part of AureusTestingApp;

/* COMPONENTS */

Map<String, Widget> aureusComponents = {
  'Exit Bar': ExitBarComponent(),
  'Alert Controller': alertController,
  'Content Warning': ContentWarningComponent(
      warningDescription:
          'This article contains mentions of sexual assult and depictions of trauma.',
      onContinue: () => {
            notificationMaster.sendAlertNotificationRequest(
                "Content Warning accepted.", Icons.ac_unit)
          }),
  'Bottom Action Sheet': bottomActionSheetComponent,
  'Cookie Banner': CookieBannerComponent(
      cookieMessage:
          'We show cookies to improve your experience. Please enable cookies. owo.',
      onCookieAccept: () => {
            notificationMaster.sendAlertNotificationRequest(
                "(Fake) cookies enabled.", Icons.ac_unit)
          },
      onCookieDeny: () => {
            notificationMaster.sendAlertNotificationRequest(
                "(Fake) cookies disabled.", Icons.ac_unit)
          }),
  'Blank Screen': blankScreenComponent,
  'Message Bubbles': Column(children: [
    senderMessageBubble,
    SizedBox(height: 20),
    receiverMessageBubble
  ]),
  'Notifications': Column(children: [
    unreadNotification,
    SizedBox(height: 10),
    readNotification,
  ]),
  'Emergency Access Bar': emergencyAccessBar,
  'Empty Item Placeholder': blankScreen,
  'Standard Card': testStandardCard,
  'Standard Icon Card': testStandardIconCard,
  'Detail Card': testDetailCard,
  'Detail Icon Card': testDetailIconCard,
  'Detail Carousel Card': testDetailCarouselCard,
  'Complex Card': testComplexCard,
  'Complex Icon Card': testComplexIconCard,
  'Category Card': testCategoryCard,
  'Detail Carousel': testDetailCarousel,
  'Standard Switch Card': standardSwitchCard,
  'Standard Selection Card': standardSelectionCard,
  'Complex Switch Card': complexSwitchCard,
  'Grid Card': gridCard,
  'Grid Badge Card': gridBadgeCard,
  'Text Field': textFieldComponent,
  'Text View': textViewComponent,
  'Search Bar': searchBarComponent,
  'Send Field': sendFieldComponent,
  'Banner Notification': bannerNotificationComponent,
  'Icon Tabbing Bar': iconTabbingBarComponent,
  'Iterating Tabbing Component': iteratingTabbingComponent,
  'Smol Text Tabbing Bar': smolTextTabbingComponent,
};

var testAlertControllerAction = AlertControllerAction(
    actionName: 'Yee the haw',
    actionSeverity: AlertControllerActionSeverity.confirm,
    onSelection: () => {
          notificationMaster.sendAlertNotificationRequest(
              "Pressed yee the haw.", Icons.ac_unit)
        });

var testAlertControllerAction2 = AlertControllerAction(
    actionName: 'Haw the yee',
    actionSeverity: AlertControllerActionSeverity.destruct,
    onSelection: () => {
          notificationMaster.sendAlertNotificationRequest(
              "Pressed haw the yee.", Icons.ac_unit)
        });

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

var bottomActionSheetComponent =
    BottomActionSheetComponent(alertData: testAlertControllerObject);

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

var searchBar = SearchBarComponent(
  onSearch: fillerAction,
  textEditController: textEditor,
);

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

Widget standardSwitchCard = StandardSwitchCardElement(
  cardLabel: fillerTextCardName,
  onEnable: () => {},
  onDisable: () => {},
);

Widget standardSelectionCard =
    StandardSelectionCardElement(cardLabel: fillerTextCardName);

Widget complexSwitchCard = ComplexSwitchCardElement(
  cardLabel: fillerTextHeader,
  cardBody: fillerTextBody,
  cardIcon: fillerIcon1,
  onEnable: () => {
    notificationMaster.sendAlertNotificationRequest(
        "Card enabled", fillerIcon3),
  },
  onDisable: () => {
    notificationMaster.sendAlertNotificationRequest(
        "Card disabled.", fillerIcon3),
  },
);

Widget gridCard = GridCardElement(
    decorationVariant: decorationPriority.standard,
    cardLabel: fillerTextCardName,
    gridSize: Size(300, 300));

Widget gridBadgeCard = GridBadgeCardElement(
    decorationVariant: decorationPriority.standard,
    cardLabel: fillerTextCardName,
    cardIcon: fillerIcon3);

Widget textFieldComponent = StandardTextFieldComponent(
    hintText: "I am a text field",
    isEnabled: true,
    decorationVariant: decorationPriority.standard,
    textFieldController: textEditor);

Widget textViewComponent = TextViewComponent(
    textFieldController: textEditor,
    hintText: "I am a text view!",
    isEnabled: true,
    prompt: "Text View Prompt");

Widget emergencyAccessBar = EmergencyAccessBarComponent(tabItems: [
  TabObject.forTextTabbing(
      onTabSelection: () => {
            notificationMaster.sendAlertNotificationRequest(
                "Item 1 pressed on action bar.", Icons.ac_unit)
          },
      tabTitle: "Item 1",
      accessibilityHint: "Opens Item 1"),
  TabObject.forTextTabbing(
      tabTitle: "Item 2",
      onTabSelection: () => {
            notificationMaster.sendAlertNotificationRequest(
                "Item 2 pressed on action bar.", Icons.ac_unit)
          },
      accessibilityHint: "Opens Item 2"),
  TabObject.forTextTabbing(
      tabTitle: "Item 3",
      onTabSelection: () => {
            notificationMaster.sendAlertNotificationRequest(
                "Item 3 pressed on action bar.", Icons.ac_unit)
          },
      accessibilityHint: "Opens Item 3"),
]);

Widget searchBarComponent =
    SearchBarComponent(onSearch: () => {}, textEditController: textEditor);

Widget sendFieldComponent =
    SendFieldComponent(onSend: () => {}, textEditController: textEditor);

Widget blankScreenComponent = BlankScreenComponent(
    cardTitle: "No Data",
    cardBody: "Please do [insert action here] to populate this screen.");

Widget bannerNotificationComponent = BannerNotificationComponent(
    body: "I'm notifying you!", icon: Assets.babycarriage);

Widget switchComponent = SwitchComponent(
  () => {},
  () => {},
);

Widget iconTabbingBarComponent = IconTabbingBarComponent(tabItems: [
  tab1,
  tab2,
  tab3,
  tab4,
]);

Widget iteratingTabbingComponent = IteratingTabbingComponent(itemTitles: [
  "Standard Button",
  "Inactive Button",
  "Important Button"
], itemWidgets: [
  standardStandardButton,
  inactiveStandardButton,
  importantStandardButton
]);

Widget smolTextTabbingComponent = SmolTextTabbingBarComponent(itemTitles: [
  "Item 1",
  "Item 2",
  "Item 3"
], itemActions: [
  () => {},
  () => {},
  () => {},
]);

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
