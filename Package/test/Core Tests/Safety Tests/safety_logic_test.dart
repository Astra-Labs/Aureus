import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';

import 'package:aureus/aureus.dart';

void main() {
  group('Safety', () {
    setUp(() => {
          TestWidgetsFlutterBinding.ensureInitialized(),
        });

    test('actionSafetyCheck executes primaryItem if no violations', () async {
      // Arrange
      const safety = Safety(
        frequencyUsage: SafetyPlanFrequency.singleUse,
        eligiblePlanOptions: [
          SafetyPlanOptions.exitBar,
        ],
      );

      final List<SafetyPlanFallback> fallbackItems = [];

      // Act
      final executableCode = await safety.actionSafetyCheck(fallbackItems, () {
        // This is the primary item, it should execute without violations
      });

      // Assert
      expect(executableCode, isA<VoidCallback>());
    });

    /*test('recordFailedLogInAttempt should write to storage', () async {
      // Arrange
      const safety = Safety(
        frequencyUsage: SafetyPlanFrequency.recurringUse,
        eligiblePlanOptions: [
          SafetyPlanOptions.logFailedAttempts,
        ],
      );

      // Act
      await safety.recordFailedLogInAttempt();
    });*/
  });
}
