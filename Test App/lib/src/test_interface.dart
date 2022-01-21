import 'package:aureus/aureus.dart';
import 'package:test_app/src/text_items.dart';
import 'interface_items.dart';
import 'view_items.dart';

Map<String, Widget> aureusElements = {
  'Typography': textTestListView,
  'Tab Subheader': tabSubheader,
  'Divider': divider,
  'Slider': slider,
  'Timer': timer,
  'Single Input': singleInput,
  'Multiple Input': multiInput,
  'Standard Full Width Button': standardFullWidthButton,
  'Important Full Width Button': importantFullWidthButton,
  'Inactive Full Width Button': inactiveFullWidthButton,
  'Standard Primary Icon Button': standardPrimaryIconButton,
  'Important Primary Icon Button': importantPrimaryIconButton,
  'Inactive Primary Icon Button': inactivePrimaryIconButton,
  'Standard Secondary Icon Button': standardSecondaryIconButton,
  'Important Secondary Icon Button': importantSecondaryIconButton,
  'Inactive Secondary Icon Button': inactiveSecondaryIconButton,
  'Standard Smol Button': standardSmolButton,
  'Important Smol Button': importantSmolButton,
  'Inactive Smol Button': inactiveSmolButton,
  'Standard Standard Button': standardStandardButton,
  'Important Standard Button': importantStandardButton,
  'Inactive Standard Button': inactiveStandardButton,
};

Map<String, Widget> aureusComponents = {
  'Receiver Message Bubble': receiverMessageBubble,
  'Sender Message Bubble': senderMessageBubble,
  'Unread Notification': unreadNotification,
  'Read Notification': readNotification,
  'Search Bar': searchBar,
  'Send Field': sendField,
  'Blank Screen': blankScreen,
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

Map<String, Widget> aureusViews = {
  'Two Factor Authentication': TFAVerificationView(
      userPhoneNumber: 7142042256,
      issueVerificationCode: () => {print('verification code issued!')},
      onUserSubmission: () => {print('user submitted code!')}),
  'Onboarding Demo View': OnboardingDemoView(
      toolItems: [demoTool1, demoTool2, demoTool3, demoTool4],
      exitPoint: OnboardingLandingView()),
  'Onboarding Information View': OnboardingInformationView(
    onboardingDetails: [onboardingInfo1, onboardingInfo2, onboardingInfo3],
  ),
  'Onboarding Landing View': OnboardingLandingView(),
  'Data Opt-in View': DataOptInView(permissionItems: dataPermissions),
  'Help Center View': HelpCenterView(helpCenter: helpCenterTest),
  'Container View': ContainerView(
      decorationVariant: decorationPriority.standard, builder: landing2),
  'Safety Plan Opt In View': SafetyPlanOptInView(),
  'Safety Plan Confirmation View': SafetyPlanConfirmationView(),
  'Safety Plan Functionality View': SafetyPlanFunctionalityView(),
  'Sign In View': SignInView(
      onSignIn: fillerAction,
      onSignup: fillerAction,
      onResetInformation: fillerAction),
};

/*  ELEMENTS  */

class AureusElementsView extends StatefulWidget {
  const AureusElementsView();

  @override
  _AureusElementsViewState createState() => _AureusElementsViewState();
}

class _AureusElementsViewState extends State<AureusElementsView> {
  @override
  Widget build(BuildContext context) {
    ListView elementsList = ListView.builder(
        physics: ClampingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
        shrinkWrap: true,
        itemCount: aureusElements.entries.length,
        itemBuilder: (BuildContext context, int index) {
          var itemName = aureusElements.keys.elementAt(index);
          var itemWidget = aureusElements.values.elementAt(index);

          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                  child: BodyOneText(itemName, decorationPriority.standard),
                ),
                Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: CardBackingDecoration(
                            priority: decorationPriority.inactive)
                        .buildBacking(),
                    child: itemWidget)
              ]);
        });

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.stackScroll,
        children: [
          HeadingOneText('Elements', decorationPriority.standard),
          elementsList
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}

/*  COMPONENTS  */

class AureusComponentsView extends StatefulWidget {
  const AureusComponentsView();

  @override
  _AureusComponentsViewState createState() => _AureusComponentsViewState();
}

class _AureusComponentsViewState extends State<AureusComponentsView> {
  @override
  Widget build(BuildContext context) {
    ListView componentsList = ListView.builder(
      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: aureusComponents.entries.length,
      itemBuilder: (BuildContext context, int index) {
        var itemName = aureusComponents.keys.elementAt(index);
        var itemWidget = aureusComponents.values.elementAt(index);

        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                child: BodyOneText(itemName, decorationPriority.standard),
              ),
              Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: CardBackingDecoration(
                          priority: decorationPriority.inactive)
                      .buildBacking(),
                  child: itemWidget)
            ]);
      },
    );

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.stackScroll,
        children: [
          HeadingOneText('Components', decorationPriority.standard),
          componentsList
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}

/*  VIEWS  */

class AureusViewsView extends StatefulWidget {
  const AureusViewsView();

  @override
  _AureusViewsViewState createState() => _AureusViewsViewState();
}

class _AureusViewsViewState extends State<AureusViewsView> {
  List<CardObject> viewListItems = [];

  @override
  Widget build(BuildContext context) {
    setState(() {
      viewListItems.clear();

      aureusViews.forEach((key, value) {
        viewListItems.add(CardObject.standard(
            decorationPriority.standard,
            key,
            () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => value,
                      ))
                }));
      });
    });

    CardCollectionComponent viewsCardList = CardCollectionComponent(
        cardObjects: viewListItems,
        cardVariant: cardType.StandardCard,
        collectionDirection: Axis.horizontal);

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.stackScroll,
        children: [
          HeadingOneText('Views', decorationPriority.standard),
          viewsCardList
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
