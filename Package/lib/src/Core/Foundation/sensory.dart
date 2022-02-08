import 'package:aureus/aureus.dart';
import 'package:flutter/services.dart';

/* ------------------ SENSORY -------------------- */
/*

This class contains the sensory components of Aureus. This covers animations, 
haptics, our sound library, and more. 

*/

class Sensory {
  void createSensation(Widget item, sensationType sense) {
    switch (sense) {
      case sensationType.confirmation:
        {
          HapticFeedback.lightImpact();
          break;
        }
      case sensationType.praise:
        {
          HapticFeedback.lightImpact();
          break;
        }
      case sensationType.error:
        {
          HapticFeedback.heavyImpact();
          break;
        }
      case sensationType.attention:
        {
          HapticFeedback.vibrate();
          break;
        }
      case sensationType.notification:
        {
          HapticFeedback.lightImpact();
          break;
        }
      case sensationType.urgent:
        {
          HapticFeedback.heavyImpact();
          break;
        }
      case sensationType.enable:
        {
          HapticFeedback.mediumImpact();
          break;
        }
      case sensationType.disable:
        {
          HapticFeedback.selectionClick();
          break;
        }
      case sensationType.swipe:
        {
          HapticFeedback.selectionClick();
          break;
        }
      case sensationType.press:
        {
          HapticFeedback.selectionClick();
          break;
        }
      case sensationType.hold:
        {
          HapticFeedback.vibrate();
          break;
        }
    }
  }
}

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

class CircularAnimation {}

class ShakeAnimation {}

class PulseAnimation {}

class ShimmerAnimation {}
