import 'package:aureus/aureus.dart';
import 'package:test_app/functionality_items.dart';
import 'package:test_app/interface_items.dart';

HelpCenterObject helpCenterTest = HelpCenterObject(articleCategories: [
  helpCenterCategoryOne,
  helpCenterCategoryTwo,
  helpCenterCategoryThree
]);

HelpCenterCategories helpCenterCategoryOne = HelpCenterCategories(
    categoryTitle: 'Category One',
    categoryArticles: [
      helpCenterArticleOne,
      helpCenterArticleTwo,
      helpCenterArticleThree
    ],
    categoryIcon: Assets.window);

HelpCenterCategories helpCenterCategoryTwo = HelpCenterCategories(
    categoryTitle: 'Category Two',
    categoryArticles: [
      helpCenterArticleOne,
      helpCenterArticleTwo,
      helpCenterArticleThree
    ],
    categoryIcon: Assets.snowflake);

HelpCenterCategories helpCenterCategoryThree = HelpCenterCategories(
    categoryTitle: 'Category Three',
    categoryArticles: [
      helpCenterArticleOne,
      helpCenterArticleTwo,
      helpCenterArticleThree
    ],
    categoryIcon: Assets.android);

HelpCenterArticle helpCenterArticleOne = HelpCenterArticle(
    articleTitle: 'Lorem ipsum dolor?',
    articleBody:
        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    articleCTA: () => {});

HelpCenterArticle helpCenterArticleTwo = HelpCenterArticle(
    articleTitle: 'Lorem ipsum dolor?',
    articleBody:
        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    articleCTA: () => {});

HelpCenterArticle helpCenterArticleThree = HelpCenterArticle(
    articleTitle: 'Lorem ipsum dolor?',
    articleBody:
        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    articleCTA: () => {});

/*------------------  DATA PERMISSION & CONSENT  -------------------*/

List<DataPermissionObject> dataPermissions = [
  cameraObject,
  microphoneObject,
  locationObject,
  bluetoothObject
];

DataPermissionObject cameraObject = DataConsent().cameraAccessPermission(
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    () {
  print('asking for camera!');
});

DataPermissionObject microphoneObject = DataConsent().microphoneAccessPermission(
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    () {
  print('asking for microphone!');
});

DataPermissionObject locationObject = DataConsent().locationAccessPermission(
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    () {
  print('asking for location!');
});

DataPermissionObject bluetoothObject = DataConsent().bluetoothAccessPermission(
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    () {
  print('asking for bluetooth!');
});

CoreTool demoTool1 = CoreTool(
    toolName: 'Tool 1',
    toolDescription: [
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
    ],
    toolCards: [],
    toolIcon: Assets.mail,
    entrySource: weightedBox1,
    exitSource: OnboardingLandingView());

CoreTool demoTool2 = CoreTool(
    toolName: 'Tool 2',
    toolDescription: [
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
    ],
    toolCards: [],
    toolIcon: Assets.body,
    entrySource: weightedBox2,
    exitSource: OnboardingLandingView());

CoreTool demoTool3 = CoreTool(
    toolName: 'Tool 3',
    toolDescription: [
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
    ],
    toolCards: [],
    toolIcon: Assets.stethoscope,
    entrySource: weightedBox3,
    exitSource: OnboardingLandingView());

CoreTool demoTool4 = CoreTool(
    toolName: 'Tool 4',
    toolDescription: [
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
    ],
    toolCards: [],
    toolIcon: Assets.pencil,
    entrySource: weightedBox4,
    exitSource: OnboardingLandingView());

OnboardingDetail onboardingInfo1 = OnboardingDetail(
    detailTitle: "Item 1",
    detailBody: fillerTextBody,
    detailImage: Image.network(
        'https://images.unsplash.com/photo-1568313381727-b78471533264?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
    detailCategoryIcon: fillerIcon1);

OnboardingDetail onboardingInfo2 = OnboardingDetail(
    detailTitle: "Item 2",
    detailBody: fillerTextBody,
    detailImage: Image.network(
        'https://images.unsplash.com/photo-1551740994-7af69385a217?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
    detailCategoryIcon: fillerIcon2);

OnboardingDetail onboardingInfo3 = OnboardingDetail(
    detailTitle: "Item 3",
    detailBody: fillerTextBody,
    detailImage: Image.network(
        'https://images.unsplash.com/photo-1632269826291-2cb3009bf43d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=664&q=80'),
    detailCategoryIcon: fillerIcon3);
