import 'package:flutter/cupertino.dart';
import 'package:aureus/product.dart';
import 'package:aureus/foundation.dart';
import 'package:flutter/material.dart';

//A card that contains a badge and label to describe what the card represents
//Doc Link:

class BadgeCardElement extends StatelessWidget {
  final String cardLabel;
  final Icon cardIcon;

  BadgeCardElement(this.cardLabel, this.cardIcon);

  @override
  Widget build(BuildContext context) {
    UDSVariables udsVariables = new UDSVariables();
    return Container(
      height: 164,
      width: 144.12,
      child: Container(
        decoration: BoxDecoration(
          gradient: udsVariables.icyBoi1(),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
              15), //TODO need to confirm what the spacing is
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: udsVariables.melt(),
                  border: Border.all(
                    color: udsVariables.iron(),
                  ),
                ),
                width: 39,
                height: 39,
                child: Icon(cardIcon),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  cardLabel,
                  style: udsVariables.body2(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
