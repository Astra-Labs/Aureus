import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aureus/aureus.dart';

/// Import the package where your code is located

void main() {
  testWidgets('AureusResource widget test', (WidgetTester tester) async {
    // Define the branding, information, and navigation data for the test
    final branding = AureusBranding(
      fontFamily: 'TestFont',
      lightModeStyle: AureusStylization(
        contrastGradient:
            const LinearGradient(colors: [Colors.blue, Colors.green]),
        accentColor: Colors.blue,
        primaryImage: null,
        secondaryImage: null,
        logo: null,
      ),
      darkModeStyle: AureusStylization(
        contrastGradient:
            const LinearGradient(colors: [Colors.black, Colors.red]),
        accentColor: Colors.red,
        primaryImage: null,
        secondaryImage: null,
        logo: null,
      ),
    );

    const information = AureusInformation(
      name: 'Test App',
      mission: 'This is a test app',
      safetySettings: Safety(
          eligiblePlanOptions: [],
          frequencyUsage: SafetyPlanFrequency.singleUse),
      developerName: 'Test Developer',
      developerEmail: 'test@example.com',
      userSupportURL: 'https://example.com/support',
      requestedDataPermissions: [],
      termsOfService: 'Test Terms of Service',
      privacyPolicy: 'Test Privacy Policy',
    );

    final navigation = AureusNavigationTree(
      homeScreen: Container(),
    );

    // Create the AureusResource widget with the test data
    final widget = AureusResource(
      resourceBranding: branding,
      resourceInformation: information,
      resourceNavigation: navigation,
    );

    // Build the widget and trigger frame updates
    await tester.pumpWidget(MaterialApp(home: widget));
  });
}
