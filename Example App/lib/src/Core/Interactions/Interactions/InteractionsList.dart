part of AureusTestingApp;

//where all backing / foundational variable items in aureus are initiated for testing

/*  ---------------------------------- BUTTON BACKING  ---------------------------------- */

Decoration _buttonBack1 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.circle,
        decorationVariant: decorationPriority.inactive)
    .buildBacking();

Decoration _buttonBack2 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.circle,
        decorationVariant: decorationPriority.standard)
    .buildBacking();

Decoration _buttonBack3 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.circle,
        decorationVariant: decorationPriority.important)
    .buildBacking();

Decoration _buttonBack4 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.edgedRectangle,
        decorationVariant: decorationPriority.inactive)
    .buildBacking();

Decoration _buttonBack5 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.edgedRectangle,
        decorationVariant: decorationPriority.standard)
    .buildBacking();

Decoration _buttonBack6 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.edgedRectangle,
        decorationVariant: decorationPriority.important)
    .buildBacking();

Decoration _buttonBack7 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedPill,
        decorationVariant: decorationPriority.inactive)
    .buildBacking();

Decoration _buttonBack8 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedPill,
        decorationVariant: decorationPriority.standard)
    .buildBacking();

Decoration _buttonBack9 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedPill,
        decorationVariant: decorationPriority.important)
    .buildBacking();

Decoration _buttonBack10 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedRectangle,
        decorationVariant: decorationPriority.inactive)
    .buildBacking();

Decoration _buttonBack11 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedRectangle,
        decorationVariant: decorationPriority.standard)
    .buildBacking();

Decoration _buttonBack12 = ButtonBackingDecoration(
        variant: buttonDecorationVariants.roundedRectangle,
        decorationVariant: decorationPriority.important)
    .buildBacking();

/*  ---------------------------------- LAYER BACKING  ---------------------------------- */

Decoration _layerBack1 =
    LayerBackingDecoration(decorationVariant: decorationPriority.standard)
        .buildBacking();

Decoration _layerBack2 =
    LayerBackingDecoration(decorationVariant: decorationPriority.inactive)
        .buildBacking();

Decoration _layerBack3 =
    LayerBackingDecoration(decorationVariant: decorationPriority.important)
        .buildBacking();

/*  ---------------------------------- CARD BACKING  ---------------------------------- */

Decoration _cardBack1 =
    CardBackingDecoration(decorationVariant: decorationPriority.inactive)
        .buildBacking();

Decoration _cardBack2 =
    CardBackingDecoration(decorationVariant: decorationPriority.standard)
        .buildBacking();

Decoration _cardBack3 =
    CardBackingDecoration(decorationVariant: decorationPriority.important)
        .buildBacking();

Decoration _cardBack4 =
    CardBackingDecoration(decorationVariant: decorationPriority.inactive)
        .buildBacking();

Decoration _cardBack5 =
    CardBackingDecoration(decorationVariant: decorationPriority.standard)
        .buildBacking();

Decoration _cardBack6 =
    CardBackingDecoration(decorationVariant: decorationPriority.important)
        .buildBacking();

/*  ---------------------------------- INPUT BACKING  ---------------------------------- */

Decoration _inputBack1 = InputBackingDecoration().buildBacking();

/*  ---------------------------------- TAB BACKING  ---------------------------------- */

Decoration _tabBack1 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.circle,
        decorationVariant: decorationPriority.inactive)
    .buildBacking();

Decoration _tabBack2 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.circle,
        decorationVariant: decorationPriority.standard)
    .buildBacking();

Decoration _tabBack3 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.circle,
        decorationVariant: decorationPriority.important)
    .buildBacking();

Decoration _tabBack4 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.roundedRectangle,
        decorationVariant: decorationPriority.inactive)
    .buildBacking();

Decoration _tabBack5 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.roundedRectangle,
        decorationVariant: decorationPriority.standard)
    .buildBacking();

Decoration _tabBack6 = TabItemBackingDecoration(
        variant: tabItemDecorationVariants.roundedRectangle,
        decorationVariant: decorationPriority.important)
    .buildBacking();

List<Decoration> _buttonBackings = [
  _buttonBack1,
  _buttonBack2,
  _buttonBack3,
  _buttonBack4,
  _buttonBack5,
  _buttonBack6,
  _buttonBack7,
  _buttonBack8,
  _buttonBack9,
  _buttonBack10,
  _buttonBack11,
  _buttonBack12
];

List<Decoration> _layerBackings = [
  _layerBack1,
  _layerBack2,
  _layerBack3,
];

List<Decoration> _cardBackings = [
  _cardBack1,
  _cardBack2,
  _cardBack3,
  _cardBack4,
  _cardBack5,
  _cardBack6
];

List<Decoration> _inputBackings = [_inputBack1];
List<Decoration> _tabBackings = [
  _tabBack1,
  _tabBack2,
  _tabBack3,
  _tabBack4,
  _tabBack5,
  _tabBack6
];

class InteractionBackings {
//24 options
  var buttonBackingTest = ListView.builder(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      itemCount: _buttonBackings.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 100,
          width: 350,
          child: Center(
              child: Container(
                  width: 350,
                  height: 50,
                  decoration: _buttonBackings[index],
                  child: Center(
                      child: BodyOneText(
                          'Button $index', decorationPriority.standard)))),
        );
      });

//4 options
  var layerBackingTest = ListView.builder(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      itemCount: _layerBackings.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          width: 350,
          child: Center(
              child: Container(
                  width: 350,
                  height: 50,
                  decoration: _layerBackings[index],
                  child: Center(
                      child: BodyOneText(
                          'Layer $index', decorationPriority.standard)))),
        );
      });

//12 options
  var cardBackingTest = ListView.builder(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      itemCount: _cardBackings.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          width: 350,
          child: Center(
              child: Container(
                  width: 350,
                  height: 50,
                  decoration: _cardBackings[index],
                  child: Center(
                      child: BodyOneText(
                          'Card $index', decorationPriority.standard)))),
        );
      });

//2 options
  var inputBackingTest = ListView.builder(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      itemCount: _inputBackings.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          width: 350,
          child: Center(
              child: Container(
                  width: 350,
                  height: 50,
                  decoration: _inputBackings[index],
                  child: Center(
                      child: BodyOneText(
                          'Input $index', decorationPriority.standard)))),
        );
      });

//12 options
  ListView tabBackingTest = ListView.builder(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      itemCount: _tabBackings.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          width: 350,
          child: Center(
              child: Container(
                  width: 350,
                  height: 50,
                  decoration: _tabBackings[index],
                  child: Center(
                      child: BodyOneText(
                          'Tab $index', decorationPriority.standard)))),
        );
      });
}
