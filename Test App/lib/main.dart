import 'package:aureus/aureus.dart';
import 'package:test_app/src/backing_items.dart';
import 'package:test_app/src/playground.dart';
import 'package:test_app/src/test_interface.dart';
import 'package:test_app/src/view_items.dart';
import 'src/text_items.dart';
import 'src/interface_items.dart';
import 'src/functionality_items.dart';

void main() {
  
  apiVariables = Aureus(
      prodColor: Color.fromRGBO(255, 255, 255, 1.0),
      prodName: 'Aureus',
      safetyPlan: Safety(
          frequencyUsage: SafetyPlanFrequency.singleUse,
          productEligiblePlanOptions: []),
      darkFluidImage: Image(image: AssetImage('Dark-Blur.png')),
      lightFluidImage: Image(image: AssetImage('Light-Fluid.jpg')),
      darkBlurImage: Image(image: AssetImage('Dark-Blur.png')),
      lightBlurImage: Image(image: AssetImage('Light-Blur.png')),
      lightLogo: Image(image: AssetImage('Light-Logo.png')),
      darkLogo: Image(image: AssetImage('Dark-Logo.png')));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = lavender();

    if (brightness() == Brightness.dark) {
      backgroundColor = black();
    } else if (brightness() == Brightness.light) {
      backgroundColor = white();
    }

    return MaterialApp(
        home: Scaffold(body: MyHomePage()),
        theme: new ThemeData(scaffoldBackgroundColor: backgroundColor));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        backgroundColor: coloration.accentColor().withOpacity(0.3),
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
