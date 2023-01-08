library aureus;

import 'package:aureus/aureus.dart';

//A text / input form that only takes ONE kind of data (text/numbers/time, etc)
//Doc Link:

// ignore: must_be_immutable
class BasicInputFormComponent extends StatefulWidget {
  late String inputFormName;
  late List<SingleUserInputTypeObject> singleVarianceInputObjects = [];
  late List<MultiUserInputTypeObject> multiVarianceInputObjects = [];

  BasicInputFormComponent.singleDataType(
      {Key? key,
      required this.inputFormName,
      required this.singleVarianceInputObjects})
      : assert(inputFormName != ''),
        assert(singleVarianceInputObjects != [] &&
            singleVarianceInputObjects.isNotEmpty),
        super(key: key);

  BasicInputFormComponent.multiDataType(
      {Key? key,
      required this.inputFormName,
      required this.multiVarianceInputObjects})
      : assert(inputFormName != ''),
        assert(multiVarianceInputObjects != [] &&
            multiVarianceInputObjects.isNotEmpty),
        super(key: key);

  @override
  _BasicInputFormComponentState createState() =>
      _BasicInputFormComponentState();
}

class _BasicInputFormComponentState extends State<BasicInputFormComponent> {
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
                  dataPlaceholder: currentObject.placeholder,
                  isEnabled: currentObject.isEnabled,
                ));
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
                  dataPlaceholder: currentObject.placeholder,
                  itemTextEditingController:
                      currentObject.textEditingController,
                  isEnabled: currentObject.isEnabled,
                ));
          });
    }

    //Builds a one section list view from inputted objects
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          HeadingThreeText(widget.inputFormName, decorationPriority.standard),
          const SizedBox(height: 8.0),
          inputList
        ]);
  }
}
