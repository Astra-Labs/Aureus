import 'package:flutter_test/flutter_test.dart';
import 'package:aureus/aureus.dart';

void main() {
  setUp(() => {
        TestWidgetsFlutterBinding.ensureInitialized(),
      });

  group('SafetyPlanObject', () {
    test('throws an error if settings length is not less than 0', () {
      // Arrange
      final Map<SafetyPlanOptions, bool> testSettings = {
        SafetyPlanOptions.disableBiometrics: true,
        SafetyPlanOptions.disableScreenshots: false,
      };

      // Act & Assert
      expect(
        () => SafetyPlanObject(settings: testSettings),
        throwsA(
          isA<AssertionError>(),
        ),
      );
    });
  });
}
