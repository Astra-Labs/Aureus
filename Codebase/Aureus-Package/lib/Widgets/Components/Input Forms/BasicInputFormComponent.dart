import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//A text / input form that only takes ONE kind of data (text/numbers/time, etc)
//Doc Link:

// ignore: must_be_immutable
class BasicInputFormComponent extends StatefulWidget {
  final String inputFormName;
  List<SingleUserInputTypeObject> singleVarianceInputObjects = [];
  List<MultiUserInputTypeObject> multiVarianceInputObjects = [];
  final modeVariants formVariant;

  BasicInputFormComponent.singleDataType(
      {required this.inputFormName,
      required this.singleVarianceInputObjects,
      required this.formVariant})
      : assert(inputFormName != ''),
        assert(singleVarianceInputObjects != [] &&
            singleVarianceInputObjects.length >= 2);

  BasicInputFormComponent.multiDataType(
      {required this.inputFormName,
      required this.multiVarianceInputObjects,
      required this.formVariant})
      : assert(inputFormName != ''),
        assert(multiVarianceInputObjects != [] &&
            multiVarianceInputObjects.length >= 2);

  @override
  _BasicInputFormComponentState createState() =>
      _BasicInputFormComponentState();
}

class _BasicInputFormComponentState extends State<BasicInputFormComponent> {
  //returns user input based
  Map<int, String> returnAllUserInput() {
    return Map();
  }

  void getInputFromIndex({index: int}) {}

  @override
  Widget build(BuildContext context) {
    ListView inputList = ListView();
    Color textColor = foundation.white();

    if (widget.formVariant == modeVariants.dark) {
      textColor = foundation.melt();
    } else if (widget.formVariant == modeVariants.light) {
      textColor = foundation.black();
    }

    if (widget.multiVarianceInputObjects != [] &&
        widget.singleVarianceInputObjects == []) {
      //Input form is made of up multi-variance objects

      inputList = ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.multiVarianceInputObjects.length,
          itemBuilder: (BuildContext context, int index) {
            MultiUserInputTypeObject currentObject =
                widget.multiVarianceInputObjects[index];

            return Padding(
                padding: EdgeInsets.all(10),
                child: MultipleDataTypeUserInputElement(
                    dataLabel: currentObject.dataLabel,
                    dataPlaceholder: currentObject.placeholder,
                    dataTextType: currentObject.textInputType));
          });
    } else if (widget.singleVarianceInputObjects != [] &&
        widget.multiVarianceInputObjects == []) {
      //Input form is made up of single variance objects

      inputList = ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.multiVarianceInputObjects.length,
          itemBuilder: (BuildContext context, int index) {
            SingleUserInputTypeObject currentObject =
                widget.singleVarianceInputObjects[index];

            return Padding(
                padding: EdgeInsets.all(10),
                child: SingleDataTypeUserInputElement(
                    dataPlaceholder: currentObject.placeholder,
                    dataTextType: currentObject.textInputType));
          });
    }

    //Builds a one section list view from inputted objects
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: HeadingThreeText(widget.inputFormName, textColor)),
          Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20), child: inputList)
        ]);
  }
}
