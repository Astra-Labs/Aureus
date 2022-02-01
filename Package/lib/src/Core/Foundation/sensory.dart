import 'package:aureus/aureus.dart';

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
          break;
        }
      case sensationType.praise:
        {
          break;
        }
      case sensationType.error:
        {
          break;
        }
      case sensationType.attention:
        {
          break;
        }
      case sensationType.notification:
        {
          break;
        }
      case sensationType.urgent:
        {
          break;
        }
      case sensationType.enable:
        {
          break;
        }
      case sensationType.disable:
        {
          break;
        }
      case sensationType.swipe:
        {
          break;
        }
      case sensationType.press:
        {
          break;
        }
      case sensationType.hold:
        {
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
