import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//A text field and icon button used to send communications to a receipent
//Doc Link:

class SendFieldComponent extends StatefulWidget {
  final VoidCallback onSend;
  final modeVariants fieldVariant;

  const SendFieldComponent({required this.onSend, required this.fieldVariant});

  @override
  _SendFieldComponentState createState() => _SendFieldComponentState();
}

class _SendFieldComponentState extends State<SendFieldComponent> {
  @override
  Widget build(BuildContext context) {
    BoxDecoration fieldBackingDecoration;
    Color textColor = foundation.black();

    if (widget.fieldVariant == modeVariants.light) {
      fieldBackingDecoration = BoxDecoration(
          color: foundation.white(),
          border: Border.all(color: foundation.steel(), width: 1),
          borderRadius: BorderRadius.circular(10.0));
      textColor = foundation.carbon();
    } else if (widget.fieldVariant == modeVariants.dark) {
      fieldBackingDecoration = BoxDecoration(
          color: foundation.carbon(),
          border: Border.all(color: foundation.steel(), width: 1),
          borderRadius: BorderRadius.circular(10.0));
      textColor = foundation.melt();
    }

    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          width: 250,
          decoration: BoxDecoration(
            border: Border.all(color: foundation.steel(), width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: foundation.ice(),
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: TextFormField(
                style: foundation.heading2().copyWith(color: textColor),
                maxLines: null,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintStyle: foundation.body1(),
                    hintText: 'Send here.'),
                autocorrect: false,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.text),
          ))),
      Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: foundation.mediumGradient(),
              border: Border.all(color: foundation.steel(), width: 1)),
          width: 73.0,
          height: 73.0,
          child: Expanded(
              child: IconButton(
                  icon: Image.asset(''),
                  iconSize: 50,
                  color: foundation.black(),
                  tooltip: 'Send Button',
                  onPressed: widget.onSend)))
    ]);
  }
}
