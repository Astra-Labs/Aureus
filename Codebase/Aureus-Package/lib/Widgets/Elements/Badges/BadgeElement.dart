import 'package:flutter/cupertino.dart';
import 'package:aureus/foundation.dart';

//A circle with an icon that is meant to act as a category label, but not as a button.
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/4%20-%20Elements%20(Materials)/Badges/All.md

class BadgeElementDarkWhite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: foundation.white(),
      ),
      width: 157,
      height: 156,
    );
  }
}

class BadgeElementLightIcyBoi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: foundation.lightGradient(),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(184, 195, 236, 0.51),
            spreadRadius: 5,
            blurRadius: 50,
            offset: Offset(0, 9),
          ),
        ],
      ),
      width: 159,
      height: 155,
    );
  }
}

class BadgeElementCarbon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: foundation.carbon(),
      ),
      width: 157,
      height: 155,
    );
  }
}

class BadgeElementDarkIcyBoi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: foundation.darkGradient(),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(113, 136, 218, 0.4),
            blurRadius: 43,
            offset: Offset(0, 5),
          ),
        ],
      ),
      width: 159,
      height: 155,
    );
  }
}
