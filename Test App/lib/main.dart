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
  /*
  Widget testStandardCard = Playground().filledCardObject(
      cardVariant: cardType.StandardCard,
      cardData: Playground().standardCardObject);

  Widget testStandardIconCard = Playground().filledCardObject(
      cardVariant: cardType.StandardBadgeCard,
      cardData: Playground().standardIconCardObject);

  Widget testDetailCard = Playground().filledCardObject(
      cardVariant: cardType.DetailCard,
      cardData: Playground().detailCardObject);

  Widget testDetailIconCard = Playground().filledCardObject(
      cardVariant: cardType.DetailBadgeCard,
      cardData: Playground().detailIconCardObject);

  Widget testDetailCarouselCard = Playground().filledCardObject(
      cardVariant: cardType.DetailCarouselCard,
      cardData: Playground().standardIconCardObject);

  Widget testComplexCard = Playground().filledCardObject(
      cardVariant: cardType.ComplexCard,
      cardData: Playground().complexCardObject);

  Widget testComplexIconCard = Playground().filledCardObject(
      cardVariant: cardType.ComplexBadgeCard,
      cardData: Playground().complexIconCardObject);

  Widget testCategoryCard = Playground().filledCardObject(
      cardVariant: cardType.CategoryIconDetailCard,
      cardData: Playground().complexIconCardObject);*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: CardCollectionComponent(
      cardObjects: [
        Playground().detailCardObject,
        Playground().detailCardObject,
        Playground().detailCardObject,
      ],
      cardVariant: cardType.DetailCard,
      collectionDirection: Axis.horizontal,
    )));
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
