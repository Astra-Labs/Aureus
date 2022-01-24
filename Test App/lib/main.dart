import 'package:aureus/aureus.dart';
import 'package:test_app/test_interface.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  apiVariables = Aureus(
      missionTagline:
          "An open-source design system specifically for software focused on safety, privacy, and accessibility.",
      prodColor: Color.fromRGBO(255, 255, 255, 1.0),
      prodName: 'Aureus',
      safetyObject: Safety(
          frequencyUsage: SafetyPlanFrequency.singleUse,
          eligiblePlanOptions: []),
      darkFluidImage: Image(image: AssetImage('assets/Dark-Blur.png')),
      lightFluidImage: Image(image: AssetImage('assets/Light-Fluid.jpg')),
      darkBlurImage: Image(image: AssetImage('assets/Dark-Blur.png')),
      lightBlurImage: Image(image: AssetImage('assets/Light-Blur.png')),
      lightLogo: Image(image: AssetImage('assets/Light-Logo.png')),
      darkLogo: Image(image: AssetImage('assets/Dark-Logo.png')));

  runApp(AureusTestApp());
}

class AureusTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = lavender();

    if (brightness() == Brightness.dark) {
      backgroundColor = black();
    } else if (brightness() == Brightness.light) {
      backgroundColor = white();
    }

    return MaterialApp(
        home: LandingPage(),
        theme: new ThemeData(scaffoldBackgroundColor: backgroundColor));
  }
}

class LandingPage extends StatelessWidget {
  // This widget is the root of your application.

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    List<StandardIconButtonElement> buttonItems = [
      StandardIconButtonElement(
          decorationVariant: decorationPriority.standard,
          buttonTitle: "Install with pub.dev.",
          buttonIcon: Assets.wrench,
          buttonAction: () => {_launchInBrowser('')}),
      StandardIconButtonElement(
          decorationVariant: decorationPriority.standard,
          buttonTitle: "Find documentation on Github.",
          buttonIcon: Assets.settings,
          buttonAction: () => {_launchInBrowser('')}),
      StandardIconButtonElement(
          decorationVariant: decorationPriority.standard,
          buttonTitle: "Use the test app.",
          buttonIcon: Assets.expand,
          buttonAction: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestAppLanding(),
                    ))
              })
    ];

    return Scaffold(
      body: LandingPageView(
          lightModeLandscapeBacking: Image.network(
              'https://images.unsplash.com/flagged/photo-1550340148-50cf8be518f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2102&q=80'),
          darkModeLandscapeBacking: Image.network(
              'https://images.unsplash.com/photo-1468103933896-2c34a78104c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80'),
          lightModeUIOverlay:
              Image(image: AssetImage('assets/Light Mode - Preview.png')),
          darkModeUIOverlay:
              Image(image: AssetImage('assets/Dark Mode - Preview.png')),
          actionButtons: buttonItems),
    );
  }
}

class TestAppLanding extends StatefulWidget {
  @override
  _TestAppLandingState createState() => _TestAppLandingState();
}

class _TestAppLandingState extends State<TestAppLanding> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    AureusElementsView(),
    AureusComponentsView(),
    AureusViewsView()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: coloration.sameColor(),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_outlined,
                color: coloration.decorationColor(
                    decorationVariant: decorationPriority.standard)),
            label: 'Elements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined,
                color: coloration.decorationColor(
                    decorationVariant: decorationPriority.standard)),
            label: 'Components',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.window_outlined,
                color: coloration.decorationColor(
                    decorationVariant: decorationPriority.standard)),
            label: 'Views',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
