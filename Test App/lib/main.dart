import 'package:aureus/aureus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    foundation = Aureus(
        prodColor: productColor,
        prodName: productName,
        lightFluidImage: Image.asset('assets/Light-Mesh.png'),
        darkFluidImage: Image.asset('assets/Dark-Mesh.png'));

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
  var testAlertController = Playground().centeredAlertController();

  var testButton1 = StandardButtonElement(
      decorationVariant: decorationPriority.inactive,
      buttonTitle: 'Standard Button',
      buttonAction: fillerAction);

  var testButton2 = FullWidthButtonElement(
      buttonTitle: 'Full Button',
      currentVariant: decorationPriority.inactive,
      buttonAction: fillerAction);

  var testButton3 = SmolButtonElement(
      decorationVariant: decorationPriority.inactive,
      buttonTitle: 'Smol Button',
      buttonAction: fillerAction);

  var testButton4 = PrimaryIconButtonElement(
      decorationVariant: decorationPriority.inactive,
      buttonIcon: Icons.add,
      buttonTooltip: 'Add button!',
      buttonAction: fillerAction);

  var testButton5 = SecondaryIconButtonElement(
      decorationVariant: decorationPriority.inactive,
      buttonIcon: Icons.add,
      buttonTooltip: 'Add button!',
      buttonAction: fillerAction);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ContainerView(
            decorationVariant: decorationPriority.standard,
            builder: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              //write item to be tested here.
            })));
  }
}
