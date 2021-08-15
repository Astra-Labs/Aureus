import 'package:flutter/cupertino.dart';
import 'package:aureus/foundation.dart';
import 'package:flutter/material.dart';

//A card that contains a badge and label to describe what the card represents
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/4%20-%20Elements%20(Materials)/Cards/Badge%20Cards.md

class BadgeCardElement extends StatelessWidget {
  final String cardLabel;
  final IconData cardIcon;
  final foundation = UDSVariables();

  BadgeCardElement(this.cardLabel, this.cardIcon);

  @override
  Widget build(BuildContext context) {
    String titleCaseLabel = TitleCase.convertToTitleCase(cardLabel);

    return Container(
      height: 164,
      width: 144.12,
      child: Container(
        decoration: BoxDecoration(
          gradient: foundation.lightGradient(),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: foundation.steel(),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: foundation.melt(),
                  border: Border.all(
                    color: foundation.iron(),
                  ),
                ),
                width: 39,
                height: 39,
                child: Icon(cardIcon),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 13),
                child: BodyOneText(titleCaseLabel, Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
