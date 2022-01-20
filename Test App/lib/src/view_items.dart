import 'package:aureus/aureus.dart';
import 'package:test_app/src/functionality_items.dart';
import 'package:test_app/src/interface_items.dart';

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
    categoryIcon: Icons.ac_unit_outlined);

HelpCenterCategories helpCenterCategoryTwo = HelpCenterCategories(
    categoryTitle: 'Category Two',
    categoryArticles: [
      helpCenterArticleOne,
      helpCenterArticleTwo,
      helpCenterArticleThree
    ],
    categoryIcon: Icons.analytics_sharp);

HelpCenterCategories helpCenterCategoryThree = HelpCenterCategories(
    categoryTitle: 'Category Three',
    categoryArticles: [
      helpCenterArticleOne,
      helpCenterArticleTwo,
      helpCenterArticleThree
    ],
    categoryIcon: Icons.satellite_sharp);

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

DataPermissionObject microphoneObject = DataConsent().cameraAccessPermission(
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    () {
  print('asking for microphone!');
});

DataPermissionObject locationObject = DataConsent().cameraAccessPermission(
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
    toolIcon: Icons.access_alarm_outlined,
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
    toolIcon: Icons.attach_email_outlined,
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
    toolIcon: Icons.dangerous_outlined,
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
    toolIcon: Icons.arrow_downward,
    entrySource: weightedBox4,
    exitSource: OnboardingLandingView());

OnboardingDetail onboardingInfo1 = OnboardingDetail(
    detailTitle: "Item 1",
    detailBody: fillerTextBody,
    detailImage: Image.network(
        'https://preview.redd.it/g3tbgs87ze941.png?width=960&crop=smart&auto=webp&s=5f4a5cdb91f4c081d5f8c34befa9145f2176ccb7'),
    detailCategoryIcon: fillerIcon1);

OnboardingDetail onboardingInfo2 = OnboardingDetail(
    detailTitle: "Item 2",
    detailBody: fillerTextBody,
    detailImage: Image.network(
        'https://preview.redd.it/3e9o1o1cxah41.jpg?width=640&crop=smart&auto=webp&s=65ba7a23f0e782436818e09cf2efb9bd261266d8'),
    detailCategoryIcon: fillerIcon2);

OnboardingDetail onboardingInfo3 = OnboardingDetail(
    detailTitle: "Item 3",
    detailBody: fillerTextBody,
    detailImage: Image.network('https://i.redd.it/lbq642vppyg51.jpg'),
    detailCategoryIcon: fillerIcon3);
