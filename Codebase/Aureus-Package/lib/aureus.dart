library aureus;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//All Variables for the UDS Elements

class UDSVariables {

  Gradient icyBoi1() {
    return LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white,
          Color.fromRGBO(227, 231, 248, 1.0),
        ]);
  }

  Gradient icyBoi2() {
    return LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromRGBO(212, 219, 244, 1.0),
          Color.fromRGBO(184, 195, 236, 1.0),
        ]);
  }

  Gradient icyBoi3() {
    return LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          ice(),
          Color.fromRGBO(219, 225, 246, 1.0),
        ]);
  }

  Gradient darkIcyBoi() {
    return LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromRGBO(129, 134, 150, 1.0),
          Color.fromRGBO(51, 61, 98, 1.0),
        ]);
  }

//Colors

  Color ice() {
    return Color.fromRGBO(241, 243, 251, 1.0);
  }

  Color melt() {
    return Color.fromRGBO(234, 237, 250, 1.0);
  }

  Color frost() {
    return Color.fromRGBO(214, 215, 222, 1.0);
  }

  Color steel() {
    return Color.fromRGBO(184, 192, 214, 1.0);
  }

  Color iron() {
    return Color.fromRGBO(110, 115, 128, 1.0);
  }

  Color carbon() {
    return Color.fromRGBO(77, 79, 90, 1.0);
  }

//Text Styles
  TextStyle heading1() {
    return TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w300,
      letterSpacing: 1.5,
      fontFamily: "Exo",
    );
  }

  TextStyle heading2() {
    return TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
      fontFamily: "Exo",
    );
  }

  TextStyle heading3() {
    return TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.5,
      fontFamily: "Exo",
    );
  }

  TextStyle heading4() {
    return TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.5,
      fontFamily: "Exo",
    );
  }

  TextStyle body1() {
    return TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.2,
      fontFamily: "Exo",
    );
  }

  TextStyle body2() {
    return TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.2,
      fontFamily: "Exo",
    );
  }

  TextStyle subheading() {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.5,
      fontFamily: "Exo",
    );
  }
}


