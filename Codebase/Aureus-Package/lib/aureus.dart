library aureus;

//Exporting base / prod variables
export 'foundation.dart';

/* ------------------ OBJECTS -------------------- */
/* Where the files that contain the objects that Aureus is built on are contained. Not every widget will have a corresponding object, but more complex widgets do. */

//MARK: - Element Objects
export 'Objects/Elements/AlertControllerObjects.dart';

//MARK: - Component Objects
export 'Objects/Components/InputFormObjects.dart';
export 'Objects/Components/NotificationObject.dart';

//MARK: - View Objects
export 'Objects/Views/HelpCenterObjects.dart';

/* ------------------ WIDGETS -------------------- */
/* Where the widgets that Aureus builds from the objects are contained */

//MARK: - Widget Elements
export 'Widgets/Elements/Badges/BadgeElement.dart';

export 'Widgets/Elements/Cards/BadgeCardElement.dart';
export 'Widgets/Elements/Cards/GlassCardElement.dart';
export 'Widgets/Elements/Cards/PastelCardElement.dart';
export 'Widgets/Elements/Cards/StandardCardElement.dart';

export 'Widgets/Elements/Info Hierarchy/TabSubheaderElement.dart';
export 'Widgets/Elements/Info Hierarchy/DividerElement.dart';

export 'Widgets/Elements/Misc/SliderElement.dart';
export 'Widgets/Elements/Misc/TimerElement.dart';

export 'Widgets/Elements/User Input/MultipleDataTypeUserInputElement.dart';
export 'Widgets/Elements/User Input/SingleDataTypeUserInputElement.dart';

//Exporting lib widget components
export 'Widgets/Components/Buttons/FullWidthButtonElement.dart';
export 'Widgets/Components/Buttons/IconButtonElement.dart';
export 'Widgets/Components/Buttons/SmolButtonElement.dart';
export 'Widgets/Components/Buttons/StandardButtonElement.dart';

export 'Widgets/Components/Collection Views/DetailCarouselComponent.dart';
export 'Widgets/Components/Collection Views/GridCardComponent.dart';
export 'Widgets/Components/Collection Views/HorizontalCardCarouselComponent.dart';

export 'Widgets/Components/Communication/MessageBubbleComponent.dart';
export 'Widgets/Components/Communication/NotificationComponent.dart';
export 'Widgets/Components/Communication/SearchBarComponent.dart';
export 'Widgets/Components/Communication/SendFieldComponent.dart';

//Exporting lib widget views
//export 'Views/';
export '/Widgets/Views/HelpCenterView.dart';
