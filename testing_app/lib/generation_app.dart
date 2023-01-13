import 'package:aureus/aureus.dart';
import 'package:test_app/interface_items.dart';
import 'package:test_app/test_interface.dart';
import 'package:test_app/view_items.dart';
import 'landing_interface.dart';

class GenerationLandingPage extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    List<StandardIconButtonElement> buttonItems = [
      StandardIconButtonElement(
          decorationVariant: decorationPriority.standard,
          buttonHint: "Create your Aureus resource.",
          buttonTitle: "Generate a resource.",
          buttonIcon: Assets.window,
          buttonAction: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            ToolDetailView(parentTool: GenerationTool())))
              }),
    ];

    Image landingUIOverlayImage() {
      if (brightness() == Brightness.light) {
        return Image(image: AssetImage('assets/Light Mode - Preview.png'));
      } else if (brightness() == Brightness.dark) {
        return Image(image: AssetImage('assets/Dark Mode - Preview.png'));
      }
      throw ('Unexpected platform brightness issue. Please check the implementation.');
    }

    Image landscapeBackgroundImage() {
      if (brightness() == Brightness.light) {
        return Image.network(
            'https://images.unsplash.com/photo-1526934709557-35f3777499c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2069&q=80');
      } else if (brightness() == Brightness.dark) {
        return Image.network(
            'https://images.unsplash.com/photo-1471047283799-ebd97acc0bc3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2577&q=80');
      }
      throw ('Unexpected platform brightness issue. Please check the implementation.');
    }

    return Scaffold(
        body: size.isDesktopDisplay()
            ? mobileLandingView(
                landscapeBacking: landscapeBackgroundImage(),
                uiOverlay: landingUIOverlayImage(),
                actionButtons: buttonItems)
            : webLandingView(
                landscapeBacking: landscapeBackgroundImage(),
                uiOverlay: landingUIOverlayImage(),
                actionButtons: buttonItems));
  }
}
