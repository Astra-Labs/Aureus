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

  @override
  Widget build(BuildContext context) {
    imageCache?.clear();

    print('platform brightness is ${brightness}');

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
    return ContainerView(
        decorationVariant: decorationPriority.important, builder: landing1);
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
