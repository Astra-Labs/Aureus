import 'package:flutter/cupertino.dart';
import 'package:aureus/product.dart';
import 'package:aureus/foundation.dart';
import 'package:flutter/material.dart';

//A card that contains a badge and label to describe what the card represents
//Doc Link:

class BadgeCardElement extends StatelessWidget {
  final String cardLabel;
  final Icon cardIcon;
  final foundation = UDSVariables();

  BadgeCardElement(this.cardLabel, this.cardIcon);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 164,
      width: 144.12,
      child: Container(
        decoration: BoxDecoration(
          gradient: foundation.icyBoi1(),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Color.fromRGBO(184, 192, 214, 1.0),
          ),
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
                  color: foundation.melt(),
                  border: Border.all(
                    color: foundation.iron(),
                  ),
                ),
                width: 39,
                height: 39,
                child: cardIcon,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 10), //TODO need to confirm the padding here
                child: Text(
                  //TODO waiting until info hierarchy makes in to update
                  cardLabel,
                  style: foundation.body1(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
