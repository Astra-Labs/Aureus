import 'package:aureus/aureus.dart';
import 'package:test_app/src/backing_items.dart';
import 'package:test_app/src/playground.dart';
import 'src/text_items.dart';
import 'src/interface_items.dart';
import 'src/functionality_items.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Color productColor = Color.fromRGBO(181, 190, 242, 1.0);
  String productName = 'Zenith';
  Gradient gradient1 = LinearGradient(colors: [
    Color.fromRGBO(255, 255, 255, 1.0),
    Color.fromRGBO(181, 190, 242, 1.0)
  ]);
  Gradient gradient2 = LinearGradient(colors: [
    Color.fromRGBO(181, 190, 242, 1.0),
    Color.fromRGBO(97, 112, 197, 1.0)
  ]);
  Gradient gradient3 = LinearGradient(colors: [
    Color.fromRGBO(181, 190, 242, 1.0),
    Color.fromRGBO(77, 79, 90, 1.0)
  ]);

  late Aureus foundation;

  @override
  Widget build(BuildContext context) {
    foundation = Aureus();

    print('platform brightness is ${foundation.brightness}');

    Color backgroundColor = foundation.lavender();

    if (foundation.brightness == Brightness.dark) {
      backgroundColor = foundation.black();
    } else if (foundation.brightness == Brightness.light) {
      backgroundColor = foundation.white();
    }

    //var testingAlertController = Playground().centeredAlertController();
    return MaterialApp(
        home: MyHomePage(),
        theme: new ThemeData(scaffoldBackgroundColor: backgroundColor));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Widget childWidget1 = Container(color: foundation.lavender());
    Widget childWidget2 = Container(color: foundation.melt());
    Widget childWidget3 = Container(color: foundation.ice());
    Widget childWidget4 = Container(color: foundation.steel());

    TabObject tab1 = TabObject.forIconTabbing(
        tabIcon: fillerIcon1,
        childController: childWidget1,
        tabPriority: decorationPriority.standard,
        accessibilityHint: 'Lavender');

    TabObject tab2 = TabObject.forIconTabbing(
        tabIcon: fillerIcon2,
        childController: childWidget1,
        tabPriority: decorationPriority.standard,
        accessibilityHint: 'Melt');

    TabObject tab3 = TabObject.forIconTabbing(
        tabIcon: fillerIcon3,
        childController: childWidget1,
        tabPriority: decorationPriority.standard,
        accessibilityHint: 'Ice');

    TabObject tab4 = TabObject.forIconTabbing(
        tabIcon: fillerIcon4,
        childController: childWidget1,
        tabPriority: decorationPriority.standard,
        accessibilityHint: 'Steel');

    return Scaffold(
        body: Align(
            alignment: Alignment.bottomCenter,
            child: NavBarComponent(tabItems: [tab1, tab2, tab3, tab4])));
  }
}

class TestingListView extends StatelessWidget {
  const TestingListView();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      itemCount: libElements.length,
      itemBuilder: (BuildContext context, int index) {
        return libElements[index];
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
