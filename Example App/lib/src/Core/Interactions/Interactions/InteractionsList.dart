part of AureusTestingApp;

//where all backing / foundational variable items in aureus are initiated for testing

/*  ---------------------------------- BUTTON BACKING  ---------------------------------- */
Decoration buttonBack1 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.circle,
        decorationVariant: decorationPriority.inactive)
    .buildBacking();

Decoration buttonBack2 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.circle,
        decorationVariant: decorationPriority.standard)
    .buildBacking();

Decoration buttonBack3 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.circle,
        decorationVariant: decorationPriority.important)
    .buildBacking();

Decoration buttonBack4 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.edgedRectangle,
        decorationVariant: decorationPriority.inactive)
    .buildBacking();

Decoration buttonBack5 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.edgedRectangle,
        decorationVariant: decorationPriority.standard)
    .buildBacking();

Decoration buttonBack6 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.edgedRectangle,
        decorationVariant: decorationPriority.important)
    .buildBacking();

Decoration buttonBack7 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedPill,
        decorationVariant: decorationPriority.inactive)
    .buildBacking();

Decoration buttonBack8 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedPill,
        decorationVariant: decorationPriority.standard)
    .buildBacking();

Decoration buttonBack9 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedPill,
        decorationVariant: decorationPriority.important)
    .buildBacking();

Decoration buttonBack10 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedRectangle,
        decorationVariant: decorationPriority.inactive)
    .buildBacking();

Decoration buttonBack11 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedRectangle,
        decorationVariant: decorationPriority.standard)
    .buildBacking();

Decoration buttonBack12 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedRectangle,
        decorationVariant: decorationPriority.important)
    .buildBacking();

/*  ---------------------------------- LAYER BACKING  ---------------------------------- */

Decoration layerBack1 =
    LayerBackingDecoration(decorationVariant: decorationPriority.standard)
        .buildBacking();

Decoration layerBack2 =
    LayerBackingDecoration(decorationVariant: decorationPriority.inactive)
        .buildBacking();

Decoration layerBack3 =
    LayerBackingDecoration(decorationVariant: decorationPriority.important)
        .buildBacking();

/*  ---------------------------------- CARD BACKING  ---------------------------------- */

Decoration cardBack1 =
    CardBackingDecoration(decorationVariant: decorationPriority.inactive)
        .buildBacking();

Decoration cardBack2 =
    CardBackingDecoration(decorationVariant: decorationPriority.standard)
        .buildBacking();

Decoration cardBack3 =
    CardBackingDecoration(decorationVariant: decorationPriority.important)
        .buildBacking();

Decoration cardBack4 =
    CardBackingDecoration(decorationVariant: decorationPriority.inactive)
        .buildBacking();

Decoration cardBack5 =
    CardBackingDecoration(decorationVariant: decorationPriority.standard)
        .buildBacking();

Decoration cardBack6 =
    CardBackingDecoration(decorationVariant: decorationPriority.important)
        .buildBacking();

/*  ---------------------------------- INPUT BACKING  ---------------------------------- */

Decoration inputBack1 = InputBackingDecoration().buildBacking();

/*  ---------------------------------- TAB BACKING  ---------------------------------- */

Decoration tabBack1 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.circle,
        decorationVariant: decorationPriority.inactive)
    .buildBacking();

Decoration tabBack2 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.circle,
        decorationVariant: decorationPriority.standard)
    .buildBacking();

Decoration tabBack3 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.circle,
        decorationVariant: decorationPriority.important)
    .buildBacking();

Decoration tabBack4 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.roundedRectangle,
        decorationVariant: decorationPriority.inactive)
    .buildBacking();

Decoration tabBack5 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.roundedRectangle,
        decorationVariant: decorationPriority.standard)
    .buildBacking();

Decoration tabBack6 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.roundedRectangle,
        decorationVariant: decorationPriority.important)
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
  buttonBack12
];

List<Decoration> layerBackings = [layerBack1, layerBack2, layerBack3];

List<Decoration> cardBackings = [
  cardBack1,
  cardBack2,
  cardBack3,
  cardBack4,
  cardBack5,
  cardBack6
];

List<Decoration> inputBackings = [inputBack1];
List<Decoration> tabBackings = [
  tabBack1,
  tabBack2,
  tabBack3,
  tabBack4,
  tabBack5,
  tabBack6
];

//24 options
var buttonBackingTest = ListView.builder(
    padding: const EdgeInsets.all(8),
    shrinkWrap: true,
    itemCount: buttonBackings.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 100,
        width: 350,
        child: Center(
            child: Container(
                width: 350,
                height: 50,
                decoration: buttonBackings[index],
                child: Center(
                    child: BodyOneText(
                        'Button $index', decorationPriority.standard)))),
      );
    });

//4 options
var layerBackingTest = ListView.builder(
    padding: const EdgeInsets.all(8),
    shrinkWrap: true,
    itemCount: layerBackings.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 50,
        width: 350,
        child: Center(
            child: Container(
                width: 350,
                height: 50,
                decoration: layerBackings[index],
                child: Center(
                    child: BodyOneText(
                        'Layer $index', decorationPriority.standard)))),
      );
    });

//12 options
var cardBackingTest = ListView.builder(
    padding: const EdgeInsets.all(8),
    shrinkWrap: true,
    itemCount: cardBackings.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 50,
        width: 350,
        child: Center(
            child: Container(
                width: 350,
                height: 50,
                decoration: cardBackings[index],
                child: Center(
                    child: BodyOneText(
                        'Card $index', decorationPriority.standard)))),
      );
    });

//2 options
var inputBackingTest = ListView.builder(
    padding: const EdgeInsets.all(8),
    shrinkWrap: true,
    itemCount: inputBackings.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 50,
        width: 350,
        child: Center(
            child: Container(
                width: 350,
                height: 50,
                decoration: inputBackings[index],
                child: Center(
                    child: BodyOneText(
                        'Input $index', decorationPriority.standard)))),
      );
    });

//12 options
ListView tabBackingTest = ListView.builder(
    padding: const EdgeInsets.all(8),
    shrinkWrap: true,
    itemCount: tabBackings.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 50,
        width: 350,
        child: Center(
            child: Container(
                width: 350,
                height: 50,
                decoration: tabBackings[index],
                child: Center(
                    child: BodyOneText(
                        'Tab $index', decorationPriority.standard)))),
      );
    });
