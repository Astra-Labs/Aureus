import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//An input form that takes multiple kinds of different data types (e.g: Time AND text AND password)
//Doc Link:

class LongInputFormComponent extends StatefulWidget {
  final List<LongInputFormGroupingObject> formGroupingObject;

  const LongInputFormComponent({required this.formGroupingObject});

  @override
  _LongInputFormComponentState createState() => _LongInputFormComponentState();
}

class _LongInputFormComponentState extends State<LongInputFormComponent> {
  @override
  Widget build(BuildContext context) {

    ListView inputList = ListView();
    Color textColor = foundation.white();

    return Container(child: 
    
          //layer one list view that contains lists of all of the sections
          ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.formGroupingObject.length,
          itemBuilder: (BuildContext context, int index) {
             LongInputFormGroupingObject layer1Object = widget.formGroupingObject[index]

            return Padding(
                padding: EdgeInsets.all(10),
                child: ListView.builder(scrollDirection: Axis.vertical,
          itemCount: currentObject.inputObjects.length,
          itemBuilder: (BuildContext context, int index) {

            layer1Object

                }));
          }));
  }
}
