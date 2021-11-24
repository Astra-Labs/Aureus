library aureus;

export 'package:flutter/material.dart';
export 'package:google_fonts/google_fonts.dart';

/* ------------------ CORE GLOBALS -------------------- */
/* Where the widgets that Aureus builds from the objects are contained */

export '/src/Core/foundation.dart';
export 'src/Core/accessibility.dart';
export '/src/Core/safety.dart';

/* ------------------ OBJECTS -------------------- */
/* Where the files that contain the objects that Aureus is built on are contained. Not every widget will have a corresponding object, but more complex widgets do. */

//MARK: - Element Objects
export 'src/Objects/Elements/AlertControllerObjects.dart';

//MARK: - Component Objects
export 'src/Objects/Components/InputFormObjects.dart';
export 'src/Objects/Components/NotificationObject.dart';
export 'src/Objects/Components/TabbingBarObjects.dart';

//MARK: - View Objects
export 'src/Objects/Views/HelpCenterObjects.dart';
export 'src/Objects/Views/OnboardingObjects.dart';

/* ------------------ WIDGETS -------------------- */
/* Where the widgets that Aureus builds from the objects are contained */

//MARK: - Widget Elements
export 'src/Widgets/Elements/Badges/BadgeElement.dart';

export 'src/Widgets/Elements/Cards/BadgeCardElement.dart';
export 'src/Widgets/Elements/Cards/GlassCardElement.dart';
export 'src/Widgets/Elements/Cards/PastelCardElement.dart';
export 'src/Widgets/Elements/Cards/StandardCardElement.dart';

export 'src/Widgets/Elements/Info Hierarchy/TabSubheaderElement.dart';
export 'src/Widgets/Elements/Info Hierarchy/DividerElement.dart';

export 'src/Widgets/Elements/Misc/SliderElement.dart';
export 'src/Widgets/Elements/Misc/TimerElement.dart';

export 'src/Widgets/Elements/User Input/MultipleDataTypeUserInputElement.dart';
export 'src/Widgets/Elements/User Input/SingleDataTypeUserInputElement.dart';

//Exporting lib widget components
export 'src/Widgets/Components/Buttons/FullWidthButtonElement.dart';
export 'src/Widgets/Components/Buttons/IconButtonElement.dart';
export 'src/Widgets/Components/Buttons/SmolButtonElement.dart';
export 'src/Widgets/Components/Buttons/StandardButtonElement.dart';

export 'src/Widgets/Components/Collection Views/DetailCarouselComponent.dart';
export 'src/Widgets/Components/Collection Views/GridCardComponent.dart';
export 'src/Widgets/Components/Collection Views/HorizontalCardCarouselComponent.dart';

export 'src/Widgets/Components/Communication/MessageBubbleComponent.dart';
export 'src/Widgets/Components/Communication/NotificationComponent.dart';
export 'src/Widgets/Components/Communication/SearchBarComponent.dart';
export 'src/Widgets/Components/Communication/SendFieldComponent.dart';

export '/src/Widgets/Components/Input Forms/BasicInputFormComponent.dart';
export 'src/Widgets/Components/Input Forms/LongInputFormComponent.dart';

export 'src/Widgets/Components/Tabbing Bars/IconTabbingBarComponent.dart';
export 'src/Widgets/Components/Tabbing Bars/NavBarComponent.dart';
export 'src/Widgets/Components/Tabbing Bars/OnboardingTabbingComponent.dart';
export 'src/Widgets/Components/Tabbing Bars/SmolTextTabbingBarComponent.dart';

//Exporting lib widget views
//export 'Views/';
export 'src/Widgets/Views/DataConsentView.dart';
export 'src/Widgets/Views/HelpCenterView.dart';
export 'src/Widgets/Views/OnboardingView.dart';
export 'src/Widgets/Views/SafetyPlanView.dart';
export 'src/Widgets/Views/SignInView.dart';
export 'src/Widgets/Views/SignUpView.dart';

/* ------------------ ENUMS -------------------- */
//Global Foundational Enums go here since Dart doesn't support nested types
enum deviceVariants { mobile, desktop, tablet }
enum modeVariants { light, dark }
enum buttonVariants { inactive, lightActive, darkActive }
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
enum layerDecorationVariants { rounded, edged }
enum cardDecorationVariants { pilledRectangle, roundedRectangle }
enum tabItemDecorationVariants { circle, roundedRectangle }
