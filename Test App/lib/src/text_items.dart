import 'package:aureus/aureus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//where all text related items in aureus are initiated for testing

Text text1 = HeadingOneText('Text goes here!', decorationPriority.standard);
Text text2 = HeadingTwoText('Text goes here!', decorationPriority.standard);
Text text3 = HeadingThreeText('Text goes here!', decorationPriority.standard);
Text text4 = HeadingFourText('Text goes here!', decorationPriority.standard);
Text text5 = SubheaderText('Text goes here!', decorationPriority.standard);
Text text6 = BodyOneText('Text goes here!', decorationPriority.standard);
Text text7 = BodyTwoText('Text goes here!', decorationPriority.standard);
Text text8 = ButtonOneText('Text goes here!', decorationPriority.standard);
Text text9 = ButtonTwoText('Text goes here!', decorationPriority.standard);
Text text10 = TagOneText('Text goes here!', decorationPriority.standard);
Text text11 = TagTwoText('Text goes here!', decorationPriority.standard);

List<Text> textTesting = [
  text1,
  text2,
  text3,
  text4,
  text5,
  text6,
  text7,
  text8,
  text9,
  text10,
  text11
];

//12 options
var textTestListView = ListView.separated(
  padding: const EdgeInsets.all(8),
  shrinkWrap: true,
  itemCount: textTesting.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
        height: 50,
        width: 350,
        child: Center(
          child: Container(
              width: 350, height: 50, child: Center(child: textTesting[index])),
        ));
  },
  separatorBuilder: (BuildContext context, int index) => const Divider(),
);
