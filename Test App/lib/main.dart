import 'package:aureus/aureus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/src/backing_items.dart';
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
        body: Container(
            width: size.widthOf(weight: sizingWeight.w10),
            height: size.heightOf(weight: sizingWeight.w10),
            color: foundation.white(),
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: libElements.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(child: libElements[index]);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            )));
  }
}
