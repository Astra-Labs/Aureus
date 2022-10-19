library aureus;

export 'package:flutter/material.dart';
export 'package:google_fonts/google_fonts.dart';

/* ------------------ ASSETS -------------------- */
/* Where the widgets that Aureus builds from the objects are contained */

/* ------------------ CORE GLOBALS -------------------- */
/* Where the widgets that Aureus builds from the objects are contained */

export 'src/Core/foundation.dart';
export 'src/Core/accessibility.dart';
export 'src/Core/Safety/safety.dart';

export 'src/Core/Foundation/palette.dart';
export 'src/Core/Foundation/sensory.dart';
export 'src/Core/Foundation/sizing.dart';
export 'src/Core/Foundation/text.dart';
export 'src/Core/Foundation/decorations.dart';

/* ------------------ OBJECTS -------------------- */
/* Where the files that contain the objects that Aureus is built on are contained. Not every widget will have a corresponding object, but more complex widgets do. */

//MARK - Observer Object
export 'src/Objects/Observers/ResourceObserver.dart';

//MARK: - Element Objects
export 'src/Objects/Elements/AlertControllerObjects.dart';

//MARK: - Component Objects
export 'src/Objects/Components/CardObjects.dart';
export 'src/Objects/Components/InputFormObjects.dart';
export 'src/Objects/Components/Icons.dart';
export 'src/Objects/Components/TabbingBarObjects.dart';

//MARK: - View Objects
export 'src/Objects/Functionality/DataConsentObjects.dart';
export 'src/Objects/Views/HelpCenterObjects.dart';
export 'src/Objects/Views/OnboardingObjects.dart';

//MARK: - Functionality Objects
export 'src/Objects/Functionality/ToolLibraryObjects.dart';
export 'src/Objects/Observers/ResourceObserver.dart';
export 'src/Objects/Observers/NotificationObserver.dart';

//MARK: - Sensory Objects
export 'src/Objects/Views/routes.dart';

/* ------------------ WIDGETS -------------------- */
/* Where the widgets that Aureus builds from the objects are contained */

//MARK: - Widget Elements
export 'src/Widgets/Elements/Badges/BadgeElement.dart';

// -------------------------- Cards
// ------------------------------------------------ Standard
export 'src/Widgets/Elements/Cards/Standard/StandardCardElement.dart';
export 'src/Widgets/Elements/Cards/Standard/StandardBadgeCardElement.dart';
export 'src/Widgets/Elements/Cards/Standard/StandardSwitchCardElement.dart';
export 'src/Widgets/Elements/Cards/Standard/StandardSelectionCardElement.dart';
// ------------------------------------------------ Detail
export 'src/Widgets/Elements/Cards/Detail/DetailCardElement.dart';
export 'src/Widgets/Elements/Cards/Detail/DetailBadgeCardElement.dart';
export 'src/Widgets/Elements/Cards/Detail/DetailCarouselCardElement.dart';
export 'src/Widgets/Elements/Cards/Detail/CategoryIconDetailCardElement.dart';
// ------------------------------------------------ Complex
export 'src/Widgets/Elements/Cards/Complex/ComplexCardElement.dart';
export 'src/Widgets/Elements/Cards/Complex/ComplexBadgeCardElement.dart';
export 'src/Widgets/Elements/Cards/Complex/ComplexSwitchCardElement.dart';
// ------------------------------------------------ Grid
export 'src/Widgets/Elements/Cards/Grid/GridCardElement.dart';
export 'src/Widgets/Elements/Cards/Grid/GridBadgeCardElement.dart';
// ------------------------------------------------ Task
export 'src/Widgets/Elements/Cards/Task/ExpandingTaskCardElement.dart';
// ------------------------------------------------ Data Visualization
export 'src/Widgets/Elements/Cards/Data Visualization/AddressDataCardElement.dart';
export 'src/Widgets/Elements/Cards/Data Visualization/BaseDataCardElement.dart';
export 'src/Widgets/Elements/Cards/Data Visualization/PhotoDataCardElement.dart';
export 'src/Widgets/Elements/Cards/Data Visualization/TextFieldDataCardElement.dart';
export 'src/Widgets/Elements/Cards/Data Visualization/TextViewDataCardElement.dart';
export 'src/Widgets/Elements/Cards/Data Visualization/VideoRecordingDataCardElement.dart';
export 'src/Widgets/Elements/Cards/Data Visualization/VoiceRecordingDataCardElement.dart';

// -------------------------- Info Hierachy
export 'src/Widgets/Elements/Info Hierarchy/ArticleViewElement.dart';
export 'src/Widgets/Elements/Info Hierarchy/TabSubheaderElement.dart';
export 'src/Widgets/Elements/Info Hierarchy/MissionHeaderElement.dart';
export 'src/Widgets/Elements/Info Hierarchy/PageHeaderElement.dart';
export 'src/Widgets/Elements/Info Hierarchy/DividerElement.dart';
export 'src/Widgets/Elements/Info Hierarchy/DividingHeaderElement.dart';

// -------------------------- Misc Elements
export 'src/Widgets/Elements/Misc/ContainerWrapperElement.dart';
export 'src/Widgets/Elements/Misc/FloatingContainerElement.dart';
export 'src/Widgets/Elements/Misc/CompletionCircleElement.dart';
export 'src/Widgets/Elements/Misc/LoadingCircleElement.dart';
export 'src/Widgets/Elements/Misc/ProgressIndicatorElement.dart';
export 'src/Widgets/Elements/Misc/TimerElement.dart';
export 'src/Widgets/Elements/Misc/PulseShadowElement.dart';
export 'src/Widgets/Elements/Misc/EclipseShadowElement.dart';

// -------------------------- User Input
export 'src/Widgets/Elements/User Input/TextFieldComponent.dart';
export 'src/Widgets/Elements/User Input/MultipleDataTypeUserInputElement.dart';
export 'src/Widgets/Elements/User Input/SingleDataTypeUserInputElement.dart';
export 'src/Widgets/Elements/User Input/SliderElement.dart';

//Exporting lib widget components
// -------------------------- Alert Controllers
export 'src/Widgets/Components/Alert Controllers/CenteredAlertControllerComponent.dart';
export 'src/Widgets/Components/Alert Controllers/ContentWarningComponent.dart';
export 'src/Widgets/Components/Alert Controllers/BottomActionSheetComponent.dart';

// -------------------------- Buttons
export 'src/Widgets/Components/Buttons/FullWidthButtonElement.dart';
export 'src/Widgets/Components/Buttons/IconButtonElement.dart';
export 'src/Widgets/Components/Buttons/SmolButtonElement.dart';
export 'src/Widgets/Components/Buttons/StandardButtonElement.dart';
export 'src/Widgets/Components/Buttons/StandardIconButtonElement.dart';

// -------------------------- Collection Views
export 'src/Widgets/Components/Collection Views/DetailCardCarouselComponent.dart';
export 'src/Widgets/Components/Collection Views/QuickActionBarComponent.dart';

// -------------------------- Communication
export 'src/Widgets/Components/Communication/MessageBubbleComponent.dart';
export 'src/Widgets/Components/Communication/NotificationComponent.dart';
export 'src/Widgets/Components/Communication/SearchBarComponent.dart';
export 'src/Widgets/Components/Communication/SendFieldComponent.dart';
export 'src/Widgets/Components/Communication/BlankScreenComponent.dart';
export 'src/Widgets/Components/Communication/CookieBannerComponent.dart';
export 'src/Widgets/Components/Communication/ExitBarComponent.dart';
export 'src/Widgets/Components/Communication/BannerNotificationComponent.dart';

// -------------------------- Input Forms
export 'src/Widgets/Components/Input Forms/BasicInputFormComponent.dart';
export 'src/Widgets/Components/Input Forms/LongInputFormComponent.dart';
export 'src/Widgets/Components/Input Forms/SwitchComponent.dart';

// -------------------------- Tabbing Bars
export 'src/Widgets/Components/Tabbing Bars/IconTabbingBarComponent.dart';
export 'src/Widgets/Components/Tabbing Bars/NavBarComponent.dart';
export 'src/Widgets/Components/Tabbing Bars/IteratingTabbingComponent.dart';
export 'src/Widgets/Components/Tabbing Bars/SmolTextTabbingBarComponent.dart';
export 'src/Widgets/Components/Tabbing Bars/VerticalSideNavBarComponent.dart';

//Exporting lib widget views

// -------------------------- Onboarding
export 'src/Widgets/Views/Onboarding/OnboardingDemoView.dart';
export 'src/Widgets/Views/Onboarding/OnboardingInformationView.dart';
export 'src/Widgets/Views/Onboarding/OnboardingLandingView.dart';
// -------------------------- Misc
export 'src/Widgets/Views/DataConsentView.dart';
export 'src/Widgets/Views/HelpCenterView.dart';
export 'src/Widgets/Views/DataDetailView.dart';
export 'src/Widgets/Views/2FAVerificationView.dart';
export 'src/Widgets/Views/LandingPageView.dart';
export 'src/Widgets/Views/SignInView.dart';
export 'src/Widgets/Views/SplashScreenView.dart';
export 'src/Widgets/Views/CheckboxArticleView.dart';
export 'src/Widgets/Views/SettingsView.dart';
export 'src/Widgets/Views/PasscodeView.dart';
// -------------------------- Supporting
export 'src/Widgets/Views/Supporting/ContainerView.dart';
// -------------------------- Safety Plan
export 'src/Widgets/Views/Safety Plan/SafetyPlanOptInView.dart';
export 'src/Widgets/Views/Safety Plan/SafetyPlanOptionsView.dart';
export 'src/Widgets/Views/Safety Plan/SafetyPlanLogInAuditView.dart';
export 'src/Widgets/Views/Safety Plan/SafetyPlanSettingsView.dart';
// -------------------------- Tool Library
export 'src/Widgets/Views/Tool Library/ToolDetailView.dart';
export 'src/Widgets/Views/Tool Library/ToolNextStepView.dart';
export 'src/Widgets/Views/Tool Library/ToolSummaryView.dart';
export 'src/Widgets/Views/Tool Library/ToolNavigationCardCarouselView.dart';

//Exporting lib tool templates

export 'src/Widgets/Tools/BaseCardToolTemplate.dart';
export 'src/Widgets/Tools/BasePageToolTemplate.dart';

// -------------------------- Mini Tools
export 'src/Widgets/Tools/Mini Tools/CameraInputToolTemplate.dart';
export 'src/Widgets/Tools/Mini Tools/ColorSpectrumToolTemplate.dart';
export 'src/Widgets/Tools/Mini Tools/GyroscopeDirectionToolTemplate.dart';
export 'src/Widgets/Tools/Mini Tools/MapInputToolTemplate.dart';
export 'src/Widgets/Tools/Mini Tools/MicrophoneInputToolTemplate.dart';
export 'src/Widgets/Tools/Mini Tools/PulseInputToolTemplate.dart';
export 'src/Widgets/Tools/Mini Tools/SensoryMapToolTemplate.dart';
export 'src/Widgets/Tools/Mini Tools/SketchToolTemplate.dart';
export 'src/Widgets/Tools/Mini Tools/TimerToolTemplate.dart';
export 'src/Widgets/Tools/Mini Tools/AdaptiveInputSelectionToolTemplate.dart';
export 'src/Widgets/Tools/Mini Tools/AdaptiveInputToolTemplate.dart';
export 'src/Widgets/Tools/Mini Tools/VideoInputToolTemplate.dart';

// -------------------------- Trackers
export 'src/Widgets/Tools/Trackers/MultiCategoryItemInfoToolTemplate.dart';
export 'src/Widgets/Tools/Trackers/MultiCategoryTrackerToolTemplate.dart';
export 'src/Widgets/Tools/Trackers/SingleCategoryItemInfoToolTemplate.dart';
export 'src/Widgets/Tools/Trackers/SingleCategoryTrackerToolTemplate.dart';

// -------------------------- User Input
export 'src/Widgets/Tools/User Input/DualColumnInputToolTemplate.dart';
export 'src/Widgets/Tools/User Input/InputSummaryToolTemplate.dart';
export 'src/Widgets/Tools/User Input/PromptListUserInputToolTemplate.dart';
export 'src/Widgets/Tools/User Input/SingleInputToolTemplate.dart';
export 'src/Widgets/Tools/User Input/SingleSliderInputToolTemplate.dart';
export 'src/Widgets/Tools/User Input/TriInputToolTemplate.dart';
export 'src/Widgets/Tools/User Input/DatePickerInputToolTemplate.dart';
export 'src/Widgets/Tools/User Input/TimePickerInputToolTemplate.dart';

// -------------------------- User Selection
export 'src/Widgets/Tools/User Selection/ListViewButtonSelectToolTemplate.dart';
export 'src/Widgets/Tools/User Selection/ListViewPickerSelectToolTemplate.dart';
export 'src/Widgets/Tools/User Selection/MultiCategoryCardSelectInputToolTemplate.dart';
export 'src/Widgets/Tools/User Selection/YesNoButtonSelectToolTemplate.dart';
export 'src/Widgets/Tools/User Selection/GridCardSelectToolTemplate.dart';

/* ------------------ ENUMS -------------------- */
//Global Foundational Enums go here since Dart doesn't support nested types
enum deviceVariants { mobile, desktop, tablet }
enum modeVariants { light, dark }
enum messagingVariants { sender, receiver }
enum communicationStatus { sending, delivered, failed }
enum CardType { standard, badge }
enum userInputType { singleDataType, multiDataType }
enum sizingWeight { w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10 }
enum decorationPriority { standard, important, inactive, inverted, active }
enum buttonDecorationVariants {
  roundedPill,
  roundedRectangle,
  edgedRectangle,
  circle
}
enum tabItemDecorationVariants { circle, roundedRectangle }
enum cardType {
  standardCard,
  standardBadgeCard,
  detailCard,
  detailBadgeCard,
  detailCarouselCard,
  complexCard,
  complexBadgeCard,
  categoryIconDetailCard,
}

enum wrapperVariants { stackScroll, fullScreen }

enum dataAccess {
  camera,
  microphone,
  bluetooth,
  pushNotifications,
  location,
  contacts,
  photos,
  tracking,
  health,
  sensors
}

enum adaptiveInput {
  text,
  video,
  voice,
  draw,
}
