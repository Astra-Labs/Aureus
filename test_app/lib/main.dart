import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aureus/aureus.dart';
import 'package:test_app/src/aur-lib.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Color productColor = Color.fromRGBO(181, 190, 242, 1.0);
  String productName = 'Aureus';
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

  late UDSVariables foundation;

  @override
  Widget build(BuildContext context) {
    foundation = UDSVariables(
        prodColor: productColor,
        prodName: productName,
        lightGrad: gradient1,
        mediumGrad: gradient2,
        darkGrad: gradient3);
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: foundation.white(),
        body: ListView(children: libElements));
  }
}
