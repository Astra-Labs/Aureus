import 'package:aureus/aureus.dart';
import 'package:test_app/src/backing_items.dart';
import 'package:test_app/src/playground.dart';
import 'package:test_app/src/test_interface.dart';
import 'package:test_app/src/view_items.dart';
import 'src/text_items.dart';
import 'src/interface_items.dart';
import 'src/functionality_items.dart';

void main() {
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

    var testSafetyPlan = Safety(
        frequencyUsage: SafetyProductOptions.singleUse,
        productEligiblePlanOptions: []);

    apiVariables = Aureus(
        prodColor: Color.fromRGBO(255, 255, 255, 1.0),
        prodName: 'Aetheria',
        safetyPlan: testSafetyPlan,
        darkFluidImage: Image.asset('assets/Dark-Fluid'),
        lightFluidImage: Image.asset('assets/Light-Fluid'),
        darkBlurImage: Image.asset('assets/Dark-Blur'),
        lightBlurImage: Image.asset('assets/Light-Blur'),
        lightLogo: Image.asset('assets/Light-Logo'),
        darkLogo: Image.asset('assets/Dark-Logo'));

    return MaterialApp(
        home: Scaffold(
          body: DataOptInView(permissionItems: dataPermissions),
        ),
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
        backgroundColor: carbon(),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:
                Icon(Icons.circle_outlined, color: coloration.contrastColor()),
            label: 'Elements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined, color: coloration.contrastColor()),
            label: 'Components',
          ),
          BottomNavigationBarItem(
            icon:
                Icon(Icons.window_outlined, color: coloration.contrastColor()),
            label: 'Views',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
