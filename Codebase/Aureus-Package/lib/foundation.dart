import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//All Variables for the UDS Elements
//Doc Link:

//Global Foundational Enums go here since Dart doesn't support nested types
enum buttonVariants { inactive, lightActive, darkActive }

class UDSVariables {
//Global Product Variations

  final Color prodColor;
  final String prodName;
  final Gradient lightGrad;
  final Gradient mediumGrad;
  final Gradient darkGrad;

  const UDSVariables(
      {this.prodColor = const Color.fromRGBO(181, 190, 242, 1.0),
      this.prodName = 'Aureus',
      this.lightGrad = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Color.fromRGBO(227, 231, 248, 1.0),
          ]),
      this.mediumGrad = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(212, 219, 244, 1.0),
            Color.fromRGBO(184, 195, 236, 1.0),
          ]),
      this.darkGrad = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromRGBO(241, 243, 251, 1.0),
            const Color.fromRGBO(219, 225, 246, 1.0),
          ])});

//Global Gradients

  Gradient lightGradient() {
    return lightGrad;
  }

  Gradient mediumGradient() {
    return mediumGrad;
  }

  Gradient darkGradient() {
    return darkGrad;
  }

//Global Colors

  Color productColor() {
    return prodColor;
  }

  Color white() {
    return Color.fromRGBO(255, 255, 255, 1.0);
  }

  Color black() {
    return Color.fromRGBO(0, 0, 0, 1.0);
  }

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

// Global Text Styles
  TextStyle heading1() {
    return TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.2,
      fontFamily: "Exo",
    );
  }

  TextStyle heading2() {
    return TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.0,
      fontFamily: "Exo",
    );
  }

  TextStyle heading3() {
    return TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.0,
      fontFamily: "Exo",
    );
  }

  TextStyle heading4() {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.0,
      fontFamily: "Exo",
    );
  }

  TextStyle subheading() {
    return TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.2,
      fontFamily: "Exo",
    );
  }

  TextStyle body1() {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.2,
      fontFamily: "Exo",
    );
  }

  TextStyle body2() {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.2,
      fontFamily: "Exo",
    );
  }

  TextStyle button1() {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.0,
      fontFamily: "Exo",
    );
  }

  TextStyle button2() {
    return TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.0,
      fontFamily: "Exo",
    );
  }

  TextStyle tag1({color: Color}) {
    return TextStyle(
      color: color,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.5,
      fontFamily: "Exo",
    );
  }

  TextStyle tag2({color: Color}) {
    return TextStyle(
      color: color,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.0,
      fontFamily: "Exo",
    );
  }

  //Global Theme Data

  CupertinoThemeData cupertinoThemeData() {
    return CupertinoThemeData();
  }

  ThemeData productTheme() {
    return ThemeData();
  }
}
