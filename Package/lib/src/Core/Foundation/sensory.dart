import 'package:aureus/aureus.dart';

import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';

/// {@category Foundation}

var sensation = Sensory();

/* ------------------ SENSORY -------------------- */
/// This class contains the sensory components of Aureus. This covers animations,
/// haptics, our sound library, and more.

class Sensory {
  /// Calls the Haptic Feedback engine and plays
  /// an accompanying sound file for the different
  /// types of gestures that happen.
  late AudioPlayer player;

  /// Prepares the audio player for use, put this function in your initState method.
  void prepare() async {
    player = AudioPlayer();
  }

  /// Prepares the audio player for disposal, put this function in your dispose method.
  void dispose() {
    player.dispose();
  }

  var confirmationAudioPath = "/lib/assets/sounds/confirm.mp3";
  var praiseAudioPath = "/lib/assets/sounds/praise.mp3";
  var errorAudioPath = "/lib/assets/sounds/error.mp3";
  var attentionAudioPath = "/lib/assets/sounds/attention.mp3";
  var notificationAudioPath = "/lib/assets/sounds/notification.mp3";
  var urgentAudioPath = "/lib/assets/sounds/urgent.mp3";
  var enableAudioPath = "/lib/assets/sounds/enable.mp3";
  var disableAudioPath = "/lib/assets/sounds/disable.mp3";
  var swipeAudioPath = "/lib/assets/sounds/swipe.mp3";
  var pressAudioPath = "/lib/assets/sounds/enable.mp3";
  var holdAudioPath = "/lib/assets/sounds/hold.mp3";

  /// A function that calls the Haptic Engine and the sound library.

  Future<void> createSensation(sensationType sense) async {
    await AudioPlayer.clearAssetCache();

    switch (sense) {
      case sensationType.confirmation:
        {
          HapticFeedback.lightImpact();

          /* await player.setAudioSource(
              AudioSource.uri(Uri.parse(confirmationAudioPath)),
              initialPosition: Duration.zero,
              preload: true);

          player.play(); */
          break;
        }
      case sensationType.praise:
        {
          HapticFeedback.lightImpact();

          /* await player.setAudioSource(
              AudioSource.uri(Uri.parse(praiseAudioPath)),
              initialPosition: Duration.zero,
              preload: true);

          player.play(); */
          break;
        }
      case sensationType.error:
        {
          HapticFeedback.heavyImpact();

          /* await player.setAudioSource(
              AudioSource.uri(Uri.parse(errorAudioPath)),
              initialPosition: Duration.zero,
              preload: true);

          player.play(); */
          break;
        }
      case sensationType.attention:
        {
          HapticFeedback.vibrate();

          /* await player.setAudioSource(
              AudioSource.uri(Uri.parse(attentionAudioPath)),
              initialPosition: Duration.zero,
              preload: true);

          player.play();*/
          break;
        }
      case sensationType.notification:
        {
          HapticFeedback.lightImpact();

          /* await player.setAudioSource(
              AudioSource.uri(Uri.parse(notificationAudioPath)),
              initialPosition: Duration.zero,
              preload: true);

          player.play(); */
          break;
        }
      case sensationType.urgent:
        {
          HapticFeedback.heavyImpact();

          /* await player.setAudioSource(
              AudioSource.uri(Uri.parse(urgentAudioPath)),
              initialPosition: Duration.zero,
              preload: true);

          player.play(); */
          break;
        }
      case sensationType.enable:
        {
          HapticFeedback.mediumImpact();

          /* await player.setAudioSource(
              AudioSource.uri(Uri.parse(enableAudioPath)),
              initialPosition: Duration.zero,
              preload: true);

          player.play(); */
          break;
        }
      case sensationType.disable:
        {
          HapticFeedback.selectionClick();

          /* await player.setAudioSource(
              AudioSource.uri(Uri.parse(disableAudioPath)),
              initialPosition: Duration.zero,
              preload: true);

          player.play(); */
          break;
        }
      case sensationType.swipe:
        {
          HapticFeedback.selectionClick();

          /* await player.setAudioSource(
              AudioSource.uri(Uri.parse(swipeAudioPath)),
              initialPosition: Duration.zero,
              preload: true);

          player.play(); */
          break;
        }
      case sensationType.press:
        {
          HapticFeedback.selectionClick();

          /* await player.setAudioSource(
              AudioSource.uri(Uri.parse(pressAudioPath)),
              initialPosition: Duration.zero,
              preload: true);

          player.play(); */
          break;
        }
      case sensationType.hold:
        {
          HapticFeedback.vibrate();

          /* await player.setAudioSource(AudioSource.uri(Uri.parse(holdAudioPath)),
              initialPosition: Duration.zero, preload: true); 

          player.play();*/
          break;
        }
    }
  }
}
