/// {@category Foundation}

// ignore_for_file: camel_case_types

/* ------------------ ENUMS -------------------- */

/// {@template aureus.deviceVariants}
///
/// Describes what kind of device screen / ratio the user has.
///
/// {@endtemplate}
enum deviceVariants { mobile, desktop, tablet }

/// {@template aureus.modeVariants}
///
/// Describes whether UI components are in dark or light mode
///
/// {@endtemplate}
enum modeVariants { light, dark }

/// {@template aureus.messagingVariants}
///
/// Describes if a message is being sent or receieved.
///
/// {@endtemplate}
enum messagingVariants { sender, receiver }

/// {@template aureus.communicationStatus}
///
/// Describes the communication status of an outgoing message
///
/// {@endtemplate}
enum communicationStatus { sending, delivered, failed }

/// {@template aureus.sizingWeight}
///
/// Desribes what % of the screen height / width should be used
/// for padding or sizing calculations.
///
/// {@endtemplate}
enum sizingWeight { w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10 }

/// {@template aureus.decorationPriority}
///
/// Describes what 'priority' is assigned to a UI component. These
/// priorities also describe interactivity, and importance.
///
/// {@endtemplate}
enum decorationPriority {
  standard,
  important,
  inactive,
  inverted,
  active,
}

/// {@template aureus.buttonSize}
///
/// Whether a button is the primary button size (the top 'call to action'
/// of a page) or a secondary (not top call to action). The different
/// sizes make it easier for users to prioritize what to do, and provides
/// better UX. Primary is the biggest as a main call to action, and smolBaby
/// is the smallest (e.g: an exit button for a sub-item, like a card).
///
/// {@endtemplate}
enum buttonSize {
  primary, // Main call to action
  secondary, // Secondary, use for navigating / taking actions on whole pages.
  smolBaby, // Teriarity, use on sub-items within a page.
}

/// {@template aureus.buttonDecorationVariants}
///
/// Describes what different kind of UI styles a button has.
///
/// {@endtemplate}
enum buttonDecorationVariants {
  roundedPill,
  roundedRectangle,
  edgedRectangle,
  circle
}

/// {@template aureus.tabItemDecorationVariants}
///
///  Describes what different kind of UI styles a tab item has.
///
/// {@endtemplate}
enum tabItemDecorationVariants { circle, roundedRectangle }

/// {@template aureus.cardType}
///
///  Describes what different kind of UI styles a card item has.
///
/// {@endtemplate}
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

/// {@template aureus.wrapperVariants}
///
/// Describes how to set the layout for the greater ContainerView.
/// You can set a limit to the screen height with [fullScreen],
/// and build your layout with spacers, or you can use a [stackScroll]
/// to automatically put content in a scroll view to go past the
/// device screen height.
///
/// {@endtemplate}
enum wrapperVariants { stackScroll, fullScreen }

/// {@template aureus.dataAccess}
///
/// Describes the different kinds of data access you can request.
///
/// {@endtemplate}
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
  sensors,
  storage,
}

/// {@template aureus.adaptiveInput}
///
/// Describes the different kinds of input an [AdaptiveInputToolTemplate]
/// can do, which gives the users more options to input data.
///
/// {@endtemplate}
enum adaptiveInput {
  text,
  video,
  voice,
  draw,
}

/// {@template aureus.sensationType}
///
/// For the [Sensation] engine, describes the different kinds of
/// Sensations that Aureus can produce with the sound library / haptic engine.
///
/// {@endtemplate}
enum sensationType {
  confirmation,
  praise,
  error,
  attention,
  notification,
  urgent,
  enable,
  disable,
  swipe,
  press,
  hold,
}
