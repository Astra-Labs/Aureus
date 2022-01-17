library aureus;

import 'package:aureus/aureus.dart';

//A text / input form that only takes ONE kind of data (text/numbers/time, etc)
//Doc Link:

class BasicInputFormComponent extends StatefulWidget {
  String inputFormName;
  List<SingleUserInputTypeObject> singleVarianceInputObjects = [];
  List<MultiUserInputTypeObject> multiVarianceInputObjects = [];

  BasicInputFormComponent.singleDataType(
      {required this.inputFormName, required this.singleVarianceInputObjects})
      : assert(inputFormName != ''),
        assert(singleVarianceInputObjects != [] &&
            singleVarianceInputObjects.length >= 2);

  BasicInputFormComponent.multiDataType(
      {required this.inputFormName, required this.multiVarianceInputObjects})
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
                padding: size.universalPadding(),
                child: MultipleDataTypeUserInputElement(
                    dataLabel: currentObject.dataLabel,
                    dataPlaceholder: currentObject.placeholder));
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
                padding: size.universalPadding(),
                child: SingleDataTypeUserInputElement(
                    dataPlaceholder: currentObject.placeholder));
          });
    }

    //Builds a one section list view from inputted objects
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
              padding: size.containerPadding(),
              child: HeadingThreeText(
                  widget.inputFormName, decorationPriority.standard)),
          Padding(padding: size.containerPadding(), child: inputList)
        ]);
  }
}
