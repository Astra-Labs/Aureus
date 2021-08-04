import 'package:aureus/Elements/Misc/TitleCase.dart';
import 'package:flutter/cupertino.dart';
import 'package:aureus/foundation.dart';
import 'package:flutter/material.dart';

//A blank card that looks like a "pane" of glass
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/4%20-%20Elements%20(Materials)/Cards/Pastel%20Cards.md

final foundation = UDSVariables();

class PastelCardElement extends StatelessWidget {
  final String cardLabel;

  PastelCardElement(this.cardLabel);
  @override
  Widget build(BuildContext context) {
    String titleCaseCardLabel = TitleCase.convertToTitleCase(cardLabel);
    return Container(
      height: 192,
      width: 189,
      decoration: BoxDecoration(
        gradient: foundation.icyBoi2(),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          color: foundation.steel(),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 13, top: 32),
        child: Text(
          titleCaseCardLabel,
          style: foundation.body1().copyWith(
                color: Colors.black,
              ), //TODO need to change to info hierarchy when it makes it in to master
        ),
      ),
    );
  }
}
