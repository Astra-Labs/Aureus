import 'package:flutter_test/flutter_test.dart';
import 'package:aureus/aureus.dart';

void main() {
  test('SafetyPlanFallback constructor should create an instance', () {
    const safetyOption = SafetyPlanOptions.disableNotifications;
    const fallbackOption = SafetyFallBackOptions.alternateCode;
    fallbackCode() {
      // Your fallback code here
    }

    final safetyPlanFallback =
        SafetyPlanFallback(safetyOption, fallbackOption, fallbackCode);

    expect(safetyPlanFallback.safetyOption, equals(safetyOption));
    expect(safetyPlanFallback.fallbackOption, equals(fallbackOption));
    expect(safetyPlanFallback.fallbackCode, equals(fallbackCode));
  });
}
