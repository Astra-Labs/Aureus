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
  List<int> inputtedCode;

  NumberPadComponent(Key? key, {required this.inputtedCode}) : super(key: key);

  @override
  _NumberPadComponentState createState() => _NumberPadComponentState();
}

class _NumberPadComponentState extends State<NumberPadComponent> {
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
      widget.inputtedCode = [];
    });
  }

  void addDigit(int item) {
    setState(() {
      widget.inputtedCode.add(item);
    });
  }

  Widget createNumberButton(int number) {
    double responsiveNumButtonSize() {
      double responsiveSize = 0;
      var width = size.logicalWidth();

      if (width < 600 || width > 1000) {
        // Desktop & mobile sizing.
        responsiveSize = 80;
      } else if (width > 600) {
        responsiveSize = 100;
      }

      return responsiveSize;
    }

    var numberButton = Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
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
          widget.inputtedCode.add(number);
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
          child: HeadingFourText(
              widget.inputtedCode.join(), decorationPriority.standard)),
    );

    var column = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            createNumberButton(1),
            const Spacer(),
            createNumberButton(2),
            const Spacer(),
            createNumberButton(3),
          ],
        ),
        Row(
          children: [
            createNumberButton(4),
            const Spacer(),
            createNumberButton(5),
            const Spacer(),
            createNumberButton(6),
          ],
        ),
        Row(
          children: [
            createNumberButton(7),
            const Spacer(),
            createNumberButton(8),
            const Spacer(),
            createNumberButton(9),
          ],
        ),
        Center(child: createNumberButton(0)),
      ],
    );

    var mobileLayout = ContainerWrapperElement(
      children: [
        entryFieldBox,
        const SizedBox(height: 30.0),
        column,
        const SizedBox(height: 15.0),
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
          const SizedBox(height: 30.0),
          column,
        ],
      ),
    );

    return size.isDesktopDisplay() == true ? desktopLayout : mobileLayout;
  }
}
