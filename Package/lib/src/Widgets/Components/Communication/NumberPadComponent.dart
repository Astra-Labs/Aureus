import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/*--------- NUMBER PAD COMPONENT ----------*/
/// A component to manage numbers being inputted.

// ignore: must_be_immutable
class NumberPadComponent extends StatefulWidget {
  /// A List that contains the numbers actively in the pad. Keeping
  /// items in a list as opposed to one int solves
  /// issues with numbers between web / mobile. To reset the number pad, set
  /// the inputted code to be an empty array.
  List<int>? inputtedCode;

  @override
  _NumberPadComponentState createState() => _NumberPadComponentState();
}

class _NumberPadComponentState extends State<NumberPadComponent> {
  var entryText = '';
  var digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  void initState() {
    sensation.prepare();
    super.initState();
  }

  @override
  void dispose() {
    sensation.dispose();
    super.dispose();
  }

  void resetPad() {
    setState(() {
      entryText = "";
    });
  }

  void addDigit(String item) {
    setState(() {
      entryText = entryText + item;
    });
  }

  Widget createNumberButton(int number) {
    double responsiveNumButtonSize() {
      double responsiveSize = 0;
      var width = size.logicalWidth();

      if (width < 330 || width > 1000) {
        // Desktop & mobile sizing.
        responsiveSize = 80;
      } else if (width > 600) {
        responsiveSize = 100;
      }

      return responsiveSize;
    }

    var numberButton = Padding(
      padding: EdgeInsets.all(size.responsiveSize(17.0)),
      child: Container(
        width: responsiveNumButtonSize(),
        height: responsiveNumButtonSize(),
        decoration: ButtonBackingDecoration(
                variant: buttonDecorationVariants.circle,
                decorationVariant: decorationPriority.standard)
            .buildBacking(),
        child: Center(
          child: HeadingThreeText("$number", decorationPriority.standard),
        ),
      ),
    );

    return GestureDetector(
      onTap: () {
        setState(() {
          var newEntry = entryText + number.toString();
          entryText = newEntry;
        });
      },
      child: numberButton,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> digitButtons = [];

    for (var element in digits) {
      digitButtons.add(createNumberButton(element));
    }

    var entryFieldBox = FloatingContainerElement(
        child: Container(
            decoration: InputBackingDecoration().buildBacking(),
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: HeadingFourText(entryText, decorationPriority.standard)));

    var column = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            createNumberButton(1),
            createNumberButton(2),
            createNumberButton(3),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            createNumberButton(4),
            createNumberButton(5),
            createNumberButton(6),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            createNumberButton(7),
            createNumberButton(8),
            createNumberButton(9),
          ],
        ),
        Center(child: createNumberButton(0)),
      ],
    );

    var mobileLayout = ContainerWrapperElement(
      children: [
        entryFieldBox,
        const SizedBox(height: 40.0),
        const Spacer(),
        column,
        const Spacer(),
        const SizedBox(height: 40.0),
      ],
      containerVariant: wrapperVariants.fullScreen,
      takesFullWidth: false,
    );

    var desktopLayout = SizedBox(
      height: size.layoutItemHeight(1, size.logicalScreenSize()),
      width: size.layoutItemWidth(2, size.logicalScreenSize()) * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          entryFieldBox,
          const Spacer(),
          column,
          const Spacer(),
        ],
      ),
    );

    return size.isDesktopDisplay() == true ? desktopLayout : mobileLayout;
  }
}
