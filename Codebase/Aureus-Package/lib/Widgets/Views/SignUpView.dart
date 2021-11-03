import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//
//Doc Link:

class SignUpView extends StatefulWidget {
  final modeVariants viewMode;
  final deviceVariants deviceType;

  const SignUpView({required this.viewMode, required this.deviceType});

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  modeVariants _getPillModeVariant() {
    switch (widget.viewMode) {
      case modeVariants.light:
        {
          return modeVariants.dark;
        }
      case modeVariants.dark:
        {
          return modeVariants.light;
        }
    }
  }

  Color _setColourScheme() {
    switch (widget.viewMode) {
      case modeVariants.light:
        {
          return Colors.white;
        }
      case modeVariants.dark:
        {
          return Color.fromRGBO(
              16, 16, 16, 1); //no "obsidian" in foundation colours
        }
    }
  }

  Color _setHeadingColour() {
    switch (widget.viewMode) {
      case modeVariants.light:
        {
          return Colors.black;
        }
      case modeVariants.dark:
        {
          return Colors.white;
        }
    }
  }

  Container _getLabelPill(MediaQueryData mediaQueryData) {
    return Container(
      width: Sizing.widthOf(context: mediaQueryData, weight: sizingWeight.w3),
      height: mediaQueryData.size.height *
          0.035, //cannot fit into any standardized sizing
      decoration: ButtonBackingDecoration(
              variant: buttonDecorationVariants.roundedPill,
              priority: decorationPriority.standard,
              mode: _getPillModeVariant())
          .buildBacking(),
      child: Center(
        child: TagOneText("subcontext", _setColourScheme()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Container(
      decoration: BoxDecoration(color: _setColourScheme()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Sizing.heightOf(
                  context: mediaQueryData, weight: sizingWeight.w0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: HeadingTwoText("SIGN UP", _setHeadingColour()),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 5,
                      top: mediaQueryData.size.height * 0.025,
                      bottom: mediaQueryData.size.height * 0.015),
                  child: _getLabelPill(mediaQueryData),
                ),
                Container(
                  height: mediaQueryData.size.height * 0.212,
                  width: Sizing.widthOf(
                      weight: sizingWeight.w8, context: mediaQueryData),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return SingleDataTypeUserInputElement(
                          //temporarily using this with no dark mode
                          dataPlaceholder: "item 2",
                          dataTextType: TextInputType.text);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 5,
                    top: Sizing.heightOf(
                        weight: sizingWeight.w0, context: mediaQueryData),
                    bottom: Sizing.heightOf(
                        weight: sizingWeight.w0, context: mediaQueryData),
                  ),
                  child: Container(
                    width: Sizing.widthOf(
                        context: mediaQueryData, weight: sizingWeight.w8),
                    height: 1,
                    color: foundation.steel(),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 5, bottom: mediaQueryData.size.height * 0.015),
                    child: _getLabelPill(mediaQueryData)),
                Container(
                  height: Sizing.heightOf(
                      weight: sizingWeight.w2, context: mediaQueryData),
                  width: Sizing.widthOf(
                      weight: sizingWeight.w8, context: mediaQueryData),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return SingleDataTypeUserInputElement(
                          dataPlaceholder: "item 2",
                          dataTextType: TextInputType.text);
                    },
                  ),
                ),
              ],
            ),
          ),
          FullWidthButtonElement(
            buttonTitle: "SIGN UP",
            currentVariant: buttonVariants.lightActive,
            buttonAction: () {},
          ),
        ],
      ),
    );
  }
}
