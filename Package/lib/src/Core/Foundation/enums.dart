/// {@category Foundation}

/* ------------------ ENUMS -------------------- */
//Global Foundational Enums go here since Dart doesn't support nested types

///
enum deviceVariants { mobile, desktop, tablet }

///
enum modeVariants { light, dark }

///
enum messagingVariants { sender, receiver }

///
enum communicationStatus { sending, delivered, failed }

///
enum CardType { standard, badge }

///
enum userInputType { singleDataType, multiDataType }

///
enum sizingWeight { w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10 }

///
enum decorationPriority { standard, important, inactive, inverted, active }

///
enum buttonSize { primary, secondary }

///
enum buttonDecorationVariants {
  roundedPill,
  roundedRectangle,
  edgedRectangle,
  circle
}

///
enum tabItemDecorationVariants { circle, roundedRectangle }

///
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

///
enum wrapperVariants { stackScroll, fullScreen }

///
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

///
enum adaptiveInput {
  text,
  video,
  voice,
  draw,
}

///
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
