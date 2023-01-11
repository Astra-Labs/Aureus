import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';

/* ------------------ SENSORY -------------------- */
/*

This class contains the sensory components of Aureus. This covers animations, 
haptics, our sound library, and more. 

*/

var sensation = Sensory();

class Sensory {
  // Wraps an Ink & Inkwell widget together and calls
  // the Aureus sensory engine to provide haptic feedback
  // and noises from the sound library.

  // Calls the Haptic Feedback engine and plays
  // an accompanying sound file for the different
  // types of gestures that happen.
  late AudioPlayer player;

  // Use this function in your initState method.
  void prepare() async {
    player = AudioPlayer();
  }

  // Use this widget in your dispose method
  void dispose() {
    player.dispose();
  }

  //static AudioCache player = AudioCache(prefix: 'assets/sounds/');
  var confirmationAudioPath = "sounds/confirm.mp3";
  var praiseAudioPath = "sounds/praise.mp3";
  var errorAudioPath = "sounds/error.mp3";
  var attentionAudioPath = "sounds/attention.mp3";
  var notificationAudioPath = "sounds/notification.mp3";
  var urgentAudioPath = "sounds/urgent.mp3";
  var enableAudioPath = "sounds/enable.mp3";
  var disableAudioPath = "sounds/disable.mp3";
  var swipeAudioPath = "sounds/swipe.mp3";
  var pressAudioPath = "sounds/enable.mp3";
  var holdAudioPath = "sounds/hold.mp3";

  Future<void> createSensation(sensationType sense) async {
    switch (sense) {
      case sensationType.confirmation:
        {
          HapticFeedback.lightImpact();
          await player.setAsset(confirmationAudioPath);
          player.play();
          break;
        }
      case sensationType.praise:
        {
          HapticFeedback.lightImpact();
          await player.setAsset(praiseAudioPath);
          player.play();
          break;
        }
      case sensationType.error:
        {
          HapticFeedback.heavyImpact();
          await player.setAsset(errorAudioPath);
          player.play();
          break;
        }
      case sensationType.attention:
        {
          HapticFeedback.vibrate();
          await player.setAsset(attentionAudioPath);
          player.play();
          break;
        }
      case sensationType.notification:
        {
          HapticFeedback.lightImpact();
          await player.setAsset(notificationAudioPath);
          player.play();
          break;
        }
      case sensationType.urgent:
        {
          HapticFeedback.heavyImpact();
          await player.setAsset(urgentAudioPath);
          player.play();
          break;
        }
      case sensationType.enable:
        {
          HapticFeedback.mediumImpact();
          await player.setAsset(enableAudioPath);
          player.play();
          break;
        }
      case sensationType.disable:
        {
          HapticFeedback.selectionClick();
          await player.setAsset(disableAudioPath);
          player.play();
          break;
        }
      case sensationType.swipe:
        {
          HapticFeedback.selectionClick();
          await player.setAsset(swipeAudioPath);
          player.play();
          break;
        }
      case sensationType.press:
        {
          HapticFeedback.selectionClick();
          await player.setAsset(pressAudioPath);
          player.play();
          break;
        }
      case sensationType.hold:
        {
          HapticFeedback.vibrate();
          await player.setAsset(holdAudioPath);
          player.play();
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
