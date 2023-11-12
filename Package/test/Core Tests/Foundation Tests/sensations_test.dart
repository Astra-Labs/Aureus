import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aureus/aureus.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mockito/mockito.dart';

class MockAudioPlayer extends Mock implements AudioPlayer {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  /*group('Sensory', () {
    late Sensory sensory;
    late MockAudioPlayer mockPlayer;

    setUp(() {
      mockPlayer = MockAudioPlayer();
      sensory = Sensory();
      sensory.player = mockPlayer;
      sensory.prepare();
    });

    test('dispose should dispose the audio player', () {
      sensory.dispose();

      verify(mockPlayer.dispose());
    });

    test('runAudioPlayer should set and play the provided audio file',
        () async {
      const audioPath = "lib/assets/sounds/confirm.mp3";

      await sensory.runAudioPlayer(audioPath);

      verify(mockPlayer.setAsset(audioPath)).called(1);
      verify(mockPlayer.play()).called(1);
    });

    // Add more tests for createSensation based on the different sensation types

    test('createSensation should trigger haptic feedback and play audio',
        () async {
      const sensationKind = sensationType.confirmation;
      const audioPath = "lib/assets/sounds/confirm.mp3";

      await sensory.createSensation(sensationKind);

      // Mock the haptic feedback calls and verify the audio playback
      verify(HapticFeedback.lightImpact()).called(1);
      verify(mockPlayer.setAsset(audioPath)).called(1);
      verify(mockPlayer.play()).called(1);
    });
  });*/
}
