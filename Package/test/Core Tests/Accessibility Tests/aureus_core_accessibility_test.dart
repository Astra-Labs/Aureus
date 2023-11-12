import 'package:flutter_test/flutter_test.dart';
import 'package:aureus/aureus.dart';

void main() {
  setUp(() => {
        TestWidgetsFlutterBinding.ensureInitialized(),
      });
  group('SemanticsWrapper', () {
    test('header constructor should create a header SemanticsWrapper', () {
      final header = SemanticsWrapper.header(label: 'Header');
      expect(header.label, 'Header');
      expect(header.header, true);
      expect(header.readOnly, true);
    });

    test('button constructor should create a button SemanticsWrapper', () {
      final button = SemanticsWrapper.button(
        isEnabled: true,
        label: 'Button',
        hint: 'Button Hint',
        isMutuallyExclusive: false,
      );
      expect(button.label, 'Button');
      expect(button.enabled, true);
      expect(button.hint, 'Button Hint');
      expect(button.button, true);
      expect(button.focusable, true);
      expect(button.inMutuallyExclusiveGroup, false);
    });

    test('toggle constructor should create a toggle SemanticsWrapper', () {
      final toggle = SemanticsWrapper.toggle(
        isEnabled: true,
        isToggled: false,
        isMutuallyExclusive: true,
      );
      expect(toggle.enabled, true);
      expect(toggle.toggled, false);
      expect(toggle.inMutuallyExclusiveGroup, true);
    });

    // Add more tests for other constructors and methods as needed
  });
}
