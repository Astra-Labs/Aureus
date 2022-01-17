library aureus;

export 'package:flutter/material.dart';
export 'package:google_fonts/google_fonts.dart';

/* ------------------ ASSETS -------------------- */
/* Where the widgets that Aureus builds from the objects are contained */

/* ------------------ CORE GLOBALS -------------------- */
/* Where the widgets that Aureus builds from the objects are contained */

export 'src/Core/foundation.dart';
export 'src/Core/accessibility.dart';
export 'src/Core/safety.dart';

/* ------------------ OBJECTS -------------------- */
/* Where the files that contain the objects that Aureus is built on are contained. Not every widget will have a corresponding object, but more complex widgets do. */

//MARK: - Element Objects
export 'src/Objects/Elements/AlertControllerObjects.dart';

//MARK: - Component Objects
export 'src/Objects/Components/CardObjects.dart';
export 'src/Objects/Components/InputFormObjects.dart';
export 'src/Objects/Components/Icons.dart';
export 'src/Objects/Components/NotificationObject.dart';
export 'src/Objects/Components/TabbingBarObjects.dart';

//MARK: - View Objects
export 'src/Objects/Views/DataConsentObjects.dart';
export 'src/Objects/Views/HelpCenterObjects.dart';
export 'src/Objects/Views/OnboardingObjects.dart';

//MARK: - Functionality Objects
export 'src/Objects/Functionality/AccessibilityObjects.dart';
export 'src/Objects/Functionality/SafetyPlanObjects.dart';

/* ------------------ WIDGETS -------------------- */
/* Where the widgets that Aureus builds from the objects are contained */

//MARK: - Widget Elements
export 'src/Widgets/Elements/Badges/BadgeElement.dart';

export 'src/Widgets/Elements/Cards/StandardCardElement.dart';
export 'src/Widgets/Elements/Cards/StandardBadgeCardElement.dart';
export 'src/Widgets/Elements/Cards/DetailCardElement.dart';
export 'src/Widgets/Elements/Cards/DetailBadgeCardElement.dart';
export 'src/Widgets/Elements/Cards/DetailCarouselCardElement.dart';
export 'src/Widgets/Elements/Cards/ComplexCardElement.dart';
export 'src/Widgets/Elements/Cards/ComplexBadgeCardElement.dart';
export 'src/Widgets/Elements/Cards/CategoryIconDetailCardElement.dart';
export 'src/Widgets/Elements/Cards/StandardSwitchCardComponent.dart';
export 'src/Widgets/Elements/Cards/ComplexSwitchCardComponent.dart';

export 'src/Widgets/Elements/Info Hierarchy/TabSubheaderElement.dart';
export 'src/Widgets/Elements/Info Hierarchy/MissionHeader.dart';
export 'src/Widgets/Elements/Info Hierarchy/DividerElement.dart';

export 'src/Widgets/Elements/Misc/SliderElement.dart';
export 'src/Widgets/Elements/Misc/TimerElement.dart';

export 'src/Widgets/Elements/User Input/TextFieldComponent.dart';
export 'src/Widgets/Elements/User Input/MultipleDataTypeUserInputElement.dart';
export 'src/Widgets/Elements/User Input/SingleDataTypeUserInputElement.dart';

//Exporting lib widget components
export 'src/Widgets/Components/Alert Controllers/CenteredAlertControllerComponent.dart';

export 'src/Widgets/Components/Buttons/FullWidthButtonElement.dart';
export 'src/Widgets/Components/Buttons/IconButtonElement.dart';
export 'src/Widgets/Components/Buttons/SmolButtonElement.dart';
export 'src/Widgets/Components/Buttons/StandardButtonElement.dart';
export 'src/Widgets/Components/Buttons/StandardIconButtonElement.dart';

export 'src/Widgets/Components/Collection Views/CardCollectionComponent.dart';
export 'src/Widgets/Components/Collection Views/DetailCardCarouselComponent.dart';

export 'src/Widgets/Components/Communication/MessageBubbleComponent.dart';
export 'src/Widgets/Components/Communication/NotificationComponent.dart';
export 'src/Widgets/Components/Communication/SearchBarComponent.dart';
export 'src/Widgets/Components/Communication/SendFieldComponent.dart';
export 'src/Widgets/Components/Communication/BlankScreenComponent.dart';
export 'src/Widgets/Components/Communication/ExitBarComponent.dart';

export 'src/Widgets/Components/Input Forms/BasicInputFormComponent.dart';
export 'src/Widgets/Components/Input Forms/LongInputFormComponent.dart';
export 'src/Widgets/Components/Input Forms/SwitchComponent.dart';

export 'src/Widgets/Components/Tabbing Bars/IconTabbingBarComponent.dart';
export 'src/Widgets/Components/Tabbing Bars/NavBarComponent.dart';
export 'src/Widgets/Components/Tabbing Bars/OnboardingTabbingComponent.dart';
export 'src/Widgets/Components/Tabbing Bars/SmolTextTabbingBarComponent.dart';

//Exporting lib widget views
//export 'Views/';

export 'src/Widgets/Views/Onboarding/OnboardingDemoView.dart';
export 'src/Widgets/Views/Onboarding/OnboardingInformationView.dart';
export 'src/Widgets/Views/Onboarding/OnboardingLandingView.dart';
export 'src/Widgets/Views/DataConsentView.dart';
export 'src/Widgets/Views/HelpCenterView.dart';
export 'src/Widgets/Views/ContainerView.dart';
export 'src/Widgets/Views/Safety Plan/SafetyPlanOptInView.dart';
export 'src/Widgets/Views/Safety Plan/SafetyPlanConfirmationView.dart';
export 'src/Widgets/Views/Safety Plan/SafetyPlanFunctionalityView.dart';
export 'src/Widgets/Views/2FAVerificationView.dart';
export 'src/Widgets/Views/SignInView.dart';
export 'src/Widgets/Views/SignUpView.dart';

/* ------------------ ENUMS -------------------- */
//Global Foundational Enums go here since Dart doesn't support nested types
enum deviceVariants { mobile, desktop, tablet }
enum modeVariants { light, dark }
enum messagingVariants { sender, receiver }
enum communicationStatus { sending, delivered, failed }
enum CardType { standard, badge }
enum userInputType { singleDataType, multiDataType }
enum sizingWeight { w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10 }
enum decorationPriority { standard, important, inactive }
enum buttonDecorationVariants {
  roundedPill,
  roundedRectangle,
  edgedRectangle,
  circle
}
enum tabItemDecorationVariants { circle, roundedRectangle }
enum cardType {
  StandardCard,
  StandardBadgeCard,
  DetailCard,
  DetailBadgeCard,
  DetailCarouselCard,
  ComplexCard,
  ComplexBadgeCard,
  CategoryIconDetailCard,
}
