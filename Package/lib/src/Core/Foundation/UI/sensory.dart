import 'package:aureus/aureus.dart';
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

  var confirmationAudioPath = "lib/assets/sounds/confirm.mp3";
  var praiseAudioPath = "lib/assets/sounds/praise.mp3";
  var errorAudioPath = "lib/assets/sounds/error.mp3";
  var attentionAudioPath = "lib/assets/sounds/attention.mp3";
  var notificationAudioPath = "lib/assets/sounds/notification.mp3";
  var urgentAudioPath = "lib/assets/sounds/urgent.mp3";
  var enableAudioPath = "lib/assets/sounds/enable.mp3";
  var disableAudioPath = "lib/assets/sounds/disable.mp3";
  var swipeAudioPath = "lib/assets/sounds/swipe.mp3";
  var pressAudioPath = "lib/assets/sounds/enable.mp3";
  var holdAudioPath = "lib/assets/sounds/hold.mp3";

  /// A reusable function to play the sound.
  Future<void> runAudioPlayer(String path) async {
    await player.setAsset(path);
    await player.play();
  }

  /// A function that calls the Haptic Engine and the sound library.

  Future<void> createSensation(sensationType sense) async {
    AudioPlayer.clearAssetCache();

    /*switch (sense) {
      case sensationType.confirmation:
        {
          await HapticFeedback.lightImpact();
          await runAudioPlayer(confirmationAudioPath);
          break;
        }
      case sensationType.praise:
        {
          await HapticFeedback.lightImpact();
          await runAudioPlayer(praiseAudioPath);
          break;
        }
      case sensationType.error:
        {
          await HapticFeedback.heavyImpact();
          await runAudioPlayer(errorAudioPath);
          break;
        }
      case sensationType.attention:
        {
          await HapticFeedback.vibrate();
          await runAudioPlayer(attentionAudioPath);
          break;
        }
      case sensationType.notification:
        {
          await HapticFeedback.lightImpact();
          await runAudioPlayer(attentionAudioPath);
          break;
        }
      case sensationType.urgent:
        {
          await HapticFeedback.heavyImpact();
          await runAudioPlayer(urgentAudioPath);
          break;
        }
      case sensationType.enable:
        {
          await HapticFeedback.mediumImpact();
          await runAudioPlayer(enableAudioPath);
          break;
        }
      case sensationType.disable:
        {
          await HapticFeedback.selectionClick();
          await runAudioPlayer(disableAudioPath);
          break;
        }
      case sensationType.swipe:
        {
          await HapticFeedback.selectionClick();
          await runAudioPlayer(swipeAudioPath);
          break;
        }
      case sensationType.press:
        {
          await HapticFeedback.selectionClick();
          await runAudioPlayer(pressAudioPath);
          break;
        }
      case sensationType.hold:
        {
          await HapticFeedback.vibrate();
          await runAudioPlayer(holdAudioPath);
          break;
        }
    }*/
  }
}
