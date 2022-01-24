import 'package:aureus/aureus.dart';
import 'dart:ui';

/* ------------------ SIZING -------------------- */
/*

This sizing class is the backbone of Aureus - it dynamically 
keeps track of the screen's sizes, and resizes it appropriately to fit 
almost any web / mobile / tablet screen. 

*/

class Sizing {
  //Pixel Ratio of a given device
  final pixelRatio = window.devicePixelRatio;

  //Size in physical pixels
  final physicalScreenSize = window.physicalSize;

  late var physicalWidth = physicalScreenSize.width;
  late var physicalHeight = physicalScreenSize.height;

  //Size in logical pixels
  late var logicalScreenSize = window.physicalSize / pixelRatio;
  late var logicalWidth = logicalScreenSize.width;
  late var logicalHeight = logicalScreenSize.height;

  bool isDesktopDisplay() {
    if (logicalScreenSize.width >= logicalScreenSize.height) {
      return false;
    } else if (logicalScreenSize.width < logicalScreenSize.height) {
      return true;
    }

    throw ('An impossible ratio was returned when determining isDesktopDisplay');
  }

  //Creates a text scale factor to adjust for size differences between
  //mobile, tablet, and web.
  double responsiveTextSize(double base) {
    double scaleFactor = 0.0;
    double shortSide = logicalScreenSize.shortestSide;

    if (shortSide < 550) {
      //needs mobile phone scale
      scaleFactor = 1.0;
    } else if (shortSide >= 550 && shortSide < 900) {
      //needs tablet scale
      scaleFactor = 1.15;
    } else if (shortSide >= 900) {
      //needs web phone scale
      scaleFactor = 1.30;
    }

    return scaleFactor * base;
  }

  // Basic padding that can be used for anything.
  EdgeInsets universalPadding() {
    return EdgeInsets.fromLTRB(20, 10, 20, 10);
  }

  // Returns the % of screen height for the weight passed
  // as a double so it can be used for layout purposes.

  double heightOf({weight: sizingWeight}) {
    double screenWeightedHeight = 0.0;

    switch (weight) {

      //MINIMUM HEIGHT OF ITEM - 5%
      case sizingWeight.w0:
        screenWeightedHeight = (logicalHeight) * 0.05;
        break;

      //10% of screen height
      case sizingWeight.w1:
        screenWeightedHeight = (logicalHeight) * 0.1;
        break;

      //20% of screen height
      case sizingWeight.w2:
        screenWeightedHeight = (logicalHeight) * 0.2;
        break;

      //30% of screen height
      case sizingWeight.w3:
        screenWeightedHeight = (logicalHeight) * 0.3;
        break;

      //40% of screen height
      case sizingWeight.w4:
        screenWeightedHeight = (logicalHeight) * 0.4;
        break;

      //50% of screen height
      case sizingWeight.w5:
        screenWeightedHeight = (logicalHeight) * 0.5;
        break;

      //60% of screen height
      case sizingWeight.w6:
        screenWeightedHeight = (logicalHeight) * 0.6;
        break;

      //70% of screen height
      case sizingWeight.w7:
        screenWeightedHeight = (logicalHeight) * 0.7;
        break;

      //80% of screen height
      case sizingWeight.w8:
        screenWeightedHeight = (logicalHeight) * 0.8;
        break;

      //90% of screen height
      case sizingWeight.w9:
        screenWeightedHeight = (logicalHeight) * 0.9;
        break;

      //100% of screen height
      case sizingWeight.w10:
        screenWeightedHeight = (logicalHeight);
        break;
    }

    return screenWeightedHeight;
  }

  // Returns the % of screen width for the weight passed
  // as a double so it can be used for layout purposes.
  double widthOf({weight: sizingWeight}) {
    double screenWeightedWidth = 0.0;

    switch (weight) {

      //MINIMUM WIDTH OF ITEM - 5%
      case sizingWeight.w0:
        screenWeightedWidth = (logicalWidth) * 0.05;
        break;

      //10% of width
      case sizingWeight.w1:
        screenWeightedWidth = (logicalWidth) * 0.1;
        break;

      //20% of width
      case sizingWeight.w2:
        screenWeightedWidth = (logicalWidth) * 0.2;
        break;

      //30% of width
      case sizingWeight.w3:
        screenWeightedWidth = (logicalWidth) * 0.3;
        break;

      //40% of width
      case sizingWeight.w4:
        screenWeightedWidth = (logicalWidth) * 0.4;
        break;

      //50% of width
      case sizingWeight.w5:
        screenWeightedWidth = (logicalWidth) * 0.5;
        break;

      //60% of width
      case sizingWeight.w6:
        screenWeightedWidth = (logicalWidth) * 0.6;
        break;

      //70% of width
      case sizingWeight.w7:
        screenWeightedWidth = (logicalWidth) * 0.7;
        break;

      //80% of width
      case sizingWeight.w8:
        screenWeightedWidth = (logicalWidth) * 0.8;
        break;

      //90% of width
      case sizingWeight.w9:
        screenWeightedWidth = (logicalWidth) * 0.9;
        break;

      //100% of width
      case sizingWeight.w10:
        screenWeightedWidth = (logicalWidth);
        break;
    }

    return screenWeightedWidth;
  }

  // Returns a maximum width accounting for padding,
  // given how many rows, and depending on device type.
  double layoutItemWidth(int sections, Size area) {
    double sizingWidth = 0.0;

    if (sections == 1) {
      //item needs to be full width with w1 padding

      isDesktopDisplay()
          ? sizingWidth = area.width * 0.90
          : sizingWidth = area.width * 0.60;
    } else if (sections == 2) {
      //item needs to be 1/2 width for 2 sections

      isDesktopDisplay()
          ? sizingWidth = area.width * 0.45
          : sizingWidth = area.width * 0.30;
    } else if (sections == 3) {
      //item needs to be 1/3 width for 3 sections
      isDesktopDisplay()
          ? sizingWidth = area.width * 0.33
          : sizingWidth = area.width * 0.12;
    } else if (sections == 4) {
      //item needs to be 1/4 width for 4 sections
      isDesktopDisplay()
          ? sizingWidth = area.width * 0.24
          : sizingWidth = area.width * 0.092;
    } else if (sections == 5) {
      //item needs to be 1/5 width for 5 sections
      isDesktopDisplay()
          ? sizingWidth = area.width * 0.21
          : sizingWidth = area.width * 0.080;
    }
    return sizingWidth;
  }

  // returns a maximum height accounting for padding, given how many columns,
  // and depending on device type.
  double layoutItemHeight(int sections, Size area) {
    double sizingHeight = 0.0;

    if (sections == 1) {
      //item needs to be full height with w1 padding

      isDesktopDisplay()
          ? sizingHeight = area.height * 0.89
          : sizingHeight = area.height * 0.806;
    } else if (sections == 2) {
      //item needs to be 1/2 height for 2 sections

      isDesktopDisplay()
          ? sizingHeight = area.height * 0.43
          : sizingHeight = area.height * 0.397;
    } else if (sections == 3) {
      //item needs to be 1/3 height for 3 sections
      isDesktopDisplay()
          ? sizingHeight = area.height * 0.287
          : sizingHeight = area.height * 0.264;
    } else if (sections == 4) {
      //item needs to be 1/4 height for 4 sections
      isDesktopDisplay()
          ? sizingHeight = area.height * 0.216
          : sizingHeight = area.height * 0.195;
    } else if (sections == 5) {
      //item needs to be 1/5 height for 5 sections
      isDesktopDisplay()
          ? sizingHeight = area.height * 0.168
          : sizingHeight = area.height * 0.155;
    } else if (sections <= 6) {
      //item needs to be 1/5 height for 5 sections

      isDesktopDisplay()
          ? sizingHeight = area.height * 0.100
          : sizingHeight = area.height * 0.097;
    }

    return sizingHeight;
  }
}
