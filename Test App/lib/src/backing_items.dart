import 'package:aureus/aureus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//where all backing / foundational variable items in aureus are initiated for testing

/*  ---------------------------------- BUTTON BACKING  ---------------------------------- */
Decoration buttonBack1 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.circle,
        priority: decorationPriority.inactive)
    .buildBacking();

Decoration buttonBack2 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.circle,
        priority: decorationPriority.standard)
    .buildBacking();

Decoration buttonBack3 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.circle,
        priority: decorationPriority.important)
    .buildBacking();

Decoration buttonBack4 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.edgedRectangle,
        priority: decorationPriority.inactive)
    .buildBacking();

Decoration buttonBack5 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.edgedRectangle,
        priority: decorationPriority.standard)
    .buildBacking();

Decoration buttonBack6 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.edgedRectangle,
        priority: decorationPriority.important)
    .buildBacking();

Decoration buttonBack7 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedPill,
        priority: decorationPriority.inactive)
    .buildBacking();

Decoration buttonBack8 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedPill,
        priority: decorationPriority.standard)
    .buildBacking();

Decoration buttonBack9 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedPill,
        priority: decorationPriority.important)
    .buildBacking();

Decoration buttonBack10 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedRectangle,
        priority: decorationPriority.inactive)
    .buildBacking();

Decoration buttonBack11 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedRectangle,
        priority: decorationPriority.standard)
    .buildBacking();

Decoration buttonBack12 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedRectangle,
        priority: decorationPriority.important)
    .buildBacking();

//DARK MODE BUTTONS

Decoration buttonBack13 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.circle,
        priority: decorationPriority.inactive)
    .buildBacking();

Decoration buttonBack14 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.circle,
        priority: decorationPriority.standard)
    .buildBacking();

Decoration buttonBack15 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.circle,
        priority: decorationPriority.important)
    .buildBacking();

Decoration buttonBack16 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.edgedRectangle,
        priority: decorationPriority.inactive)
    .buildBacking();

Decoration buttonBack17 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.edgedRectangle,
        priority: decorationPriority.standard)
    .buildBacking();

Decoration buttonBack18 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.edgedRectangle,
        priority: decorationPriority.important)
    .buildBacking();

Decoration buttonBack19 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedPill,
        priority: decorationPriority.inactive)
    .buildBacking();

Decoration buttonBack20 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedPill,
        priority: decorationPriority.standard)
    .buildBacking();

Decoration buttonBack21 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedPill,
        priority: decorationPriority.important)
    .buildBacking();

Decoration buttonBack22 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedRectangle,
        priority: decorationPriority.inactive)
    .buildBacking();

Decoration buttonBack23 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedRectangle,
        priority: decorationPriority.standard)
    .buildBacking();

Decoration buttonBack24 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedRectangle,
        priority: decorationPriority.important)
    .buildBacking();

/*  ---------------------------------- LAYER BACKING  ---------------------------------- */

Decoration layerBack1 =
    LayerBackingDecoration(priority: decorationPriority.standard)
        .buildBacking();

Decoration layerBack2 =
    LayerBackingDecoration(priority: decorationPriority.inactive)
        .buildBacking();

Decoration layerBack3 =
    LayerBackingDecoration(priority: decorationPriority.important)
        .buildBacking();

// DARK MODE LAYERS

Decoration layerBack4 =
    LayerBackingDecoration(priority: decorationPriority.standard)
        .buildBacking();

Decoration layerBack5 =
    LayerBackingDecoration(priority: decorationPriority.inactive)
        .buildBacking();

Decoration layerBack6 =
    LayerBackingDecoration(priority: decorationPriority.important)
        .buildBacking();

/*  ---------------------------------- CARD BACKING  ---------------------------------- */

Decoration cardBack1 =
    CardBackingDecoration(priority: decorationPriority.inactive).buildBacking();

Decoration cardBack2 =
    CardBackingDecoration(priority: decorationPriority.standard).buildBacking();

Decoration cardBack3 =
    CardBackingDecoration(priority: decorationPriority.important)
        .buildBacking();

Decoration cardBack4 =
    CardBackingDecoration(priority: decorationPriority.inactive).buildBacking();

Decoration cardBack5 =
    CardBackingDecoration(priority: decorationPriority.standard).buildBacking();

Decoration cardBack6 =
    CardBackingDecoration(priority: decorationPriority.important)
        .buildBacking();

// DARK MODE

Decoration cardBack7 =
    CardBackingDecoration(priority: decorationPriority.inactive).buildBacking();

Decoration cardBack8 =
    CardBackingDecoration(priority: decorationPriority.standard).buildBacking();

Decoration cardBack9 =
    CardBackingDecoration(priority: decorationPriority.important)
        .buildBacking();

Decoration cardBack10 =
    CardBackingDecoration(priority: decorationPriority.inactive).buildBacking();

Decoration cardBack11 =
    CardBackingDecoration(priority: decorationPriority.standard).buildBacking();

Decoration cardBack12 =
    CardBackingDecoration(priority: decorationPriority.important)
        .buildBacking();

/*  ---------------------------------- INPUT BACKING  ---------------------------------- */

Decoration inputBack1 = InputBackingDecoration().buildBacking();

//DARK MODE

Decoration inputBack2 = InputBackingDecoration().buildBacking();

/*  ---------------------------------- TAB BACKING  ---------------------------------- */

Decoration tabBack1 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.circle,
        priority: decorationPriority.inactive)
    .buildBacking();

Decoration tabBack2 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.circle,
        priority: decorationPriority.standard)
    .buildBacking();

Decoration tabBack3 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.circle,
        priority: decorationPriority.important)
    .buildBacking();

Decoration tabBack4 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.roundedRectangle,
        priority: decorationPriority.inactive)
    .buildBacking();

Decoration tabBack5 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.roundedRectangle,
        priority: decorationPriority.standard)
    .buildBacking();

Decoration tabBack6 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.roundedRectangle,
        priority: decorationPriority.important)
    .buildBacking();

//DARK MODE

Decoration tabBack7 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.circle,
        priority: decorationPriority.inactive)
    .buildBacking();

Decoration tabBack8 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.circle,
        priority: decorationPriority.standard)
    .buildBacking();

Decoration tabBack9 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.circle,
        priority: decorationPriority.important)
    .buildBacking();

Decoration tabBack10 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.roundedRectangle,
        priority: decorationPriority.inactive)
    .buildBacking();

Decoration tabBack11 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.roundedRectangle,
        priority: decorationPriority.standard)
    .buildBacking();

Decoration tabBack12 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.roundedRectangle,
        priority: decorationPriority.important)
    .buildBacking();

List<Decoration> buttonBackings = [
  buttonBack1,
  buttonBack2,
  buttonBack3,
  buttonBack4,
  buttonBack5,
  buttonBack6,
  buttonBack7,
  buttonBack8,
  buttonBack9,
  buttonBack10,
  buttonBack11,
  buttonBack12,
  buttonBack13,
  buttonBack14,
  buttonBack15,
  buttonBack16,
  buttonBack17,
  buttonBack18,
  buttonBack19,
  buttonBack20,
  buttonBack21,
  buttonBack22,
  buttonBack23,
  buttonBack24
];

List<Decoration> layerBackings = [
  layerBack1,
  layerBack2,
  layerBack3,
  layerBack4,
  layerBack5,
  layerBack6
];

List<Decoration> cardBackings = [
  cardBack1,
  cardBack2,
  cardBack3,
  cardBack4,
  cardBack5,
  cardBack6,
  cardBack7,
  cardBack8,
  cardBack9,
  cardBack10,
  cardBack11,
  cardBack12
];

List<Decoration> inputBackings = [inputBack1, inputBack2];
List<Decoration> tabBackings = [
  tabBack1,
  tabBack2,
  tabBack3,
  tabBack4,
  tabBack5,
  tabBack6,
  tabBack7,
  tabBack8,
  tabBack9,
  tabBack10,
  tabBack11,
  tabBack12
];

//24 options
var buttonBackingTest = ListView.separated(
  padding: const EdgeInsets.all(8),
  shrinkWrap: true,
  itemCount: buttonBackings.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 50,
      width: 350,
      child: Center(
          child: Container(
              width: 350,
              height: 50,
              decoration: buttonBackings[index],
              child: Center(child: Text('$index', style: foundation.body1())))),
    );
  },
  separatorBuilder: (BuildContext context, int index) => const Divider(),
);

//4 options
var layerBackingTest = ListView.separated(
  padding: const EdgeInsets.all(8),
  shrinkWrap: true,
  itemCount: layerBackings.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 50,
      width: 350,
      child: Center(
          child: Container(
              width: 350,
              height: 50,
              decoration: layerBackings[index],
              child: Center(child: Text('$index', style: foundation.body1())))),
    );
  },
  separatorBuilder: (BuildContext context, int index) => const Divider(),
);

//12 options
var cardBackingTest = ListView.separated(
  padding: const EdgeInsets.all(8),
  shrinkWrap: true,
  itemCount: cardBackings.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 50,
      width: 350,
      child: Center(
          child: Container(
              width: 350,
              height: 50,
              decoration: cardBackings[index],
              child: Center(child: Text('$index', style: foundation.body1())))),
    );
  },
  separatorBuilder: (BuildContext context, int index) => const Divider(),
);

//2 options
var inputBackingTest = ListView.separated(
  padding: const EdgeInsets.all(8),
  shrinkWrap: true,
  itemCount: inputBackings.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 50,
      width: 350,
      child: Center(
          child: Container(
              width: 350,
              height: 50,
              decoration: inputBackings[index],
              child: Center(child: Text('$index', style: foundation.body1())))),
    );
  },
  separatorBuilder: (BuildContext context, int index) => const Divider(),
);

//12 options
ListView tabBackingTest = ListView.separated(
  padding: const EdgeInsets.all(8),
  shrinkWrap: true,
  itemCount: tabBackings.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 50,
      width: 350,
      child: Center(
          child: Container(
              width: 350,
              height: 50,
              decoration: tabBackings[index],
              child: Center(child: Text('$index', style: foundation.body1())))),
    );
  },
  separatorBuilder: (BuildContext context, int index) => const Divider(),
);
