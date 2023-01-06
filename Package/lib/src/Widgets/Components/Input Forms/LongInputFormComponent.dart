library aureus;

import 'package:aureus/aureus.dart';

//An input form that takes multiple kinds of different data types
//(e.g: Time AND text AND password)

class LongInputFormComponent extends StatefulWidget {
  final List<LongInputFormGroupingObject> formGroupingObject;

  const LongInputFormComponent({required this.formGroupingObject});

  @override
  _LongInputFormComponentState createState() => _LongInputFormComponentState();
}

class _LongInputFormComponentState extends State<LongInputFormComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.formGroupingObject.length,
        itemBuilder: (BuildContext context, int index) {
          LongInputFormGroupingObject layer1Object =
              widget.formGroupingObject[index];

          return Padding(
              padding: size.universalPadding(),

              //layer two list view
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: layer1Object.inputObjects.length,
                  itemBuilder: (BuildContext context, int index) {
                    BaseUserInputObject currentObject =
                        layer1Object.inputObjects[index];

                    return Padding(
                        padding: size.universalPadding(),
                        child: SingleDataTypeUserInputElement(
                          dataPlaceholder: currentObject.placeholder,
                          itemTextEditingController:
                              currentObject.textEditingController,
                        ));
                  }));
        });
  }
}
