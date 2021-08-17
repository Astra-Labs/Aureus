import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//A blank card that is a pastel version of the product color
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/4%20-%20Elements%20(Materials)/Cards/Pastel%20Cards.md

class PastelCardElement extends StatelessWidget {
  final String _cardLabel;

  PastelCardElement(this._cardLabel);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 192,
      width: 189,
      decoration: BoxDecoration(
        gradient: foundation.mediumGradient(),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          color: foundation.steel(),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 13, top: 35),
        child: BodyOneText(_cardLabel, Colors.black),
      ),
    );
  }
}
