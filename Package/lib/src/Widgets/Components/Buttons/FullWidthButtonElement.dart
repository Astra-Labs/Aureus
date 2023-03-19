import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/*--------- FULL WIDTH BUTTON ----------*/
/// A full width button that acts as the main CTA for a screen.

class FullWidthButtonElement extends StatefulWidget {
  /// The title of your button
  final String buttonTitle;

  /// What your button does. Used for tooltips / accessibility information.
  final String buttonHint;

  /// The current decoration priority of the button.
  final decorationPriority currentVariant;

  /// The action that your button completes.
  final VoidCallback buttonAction;

  const FullWidthButtonElement(
      {required this.buttonTitle,
      required this.buttonHint,
      required this.currentVariant,
      required this.buttonAction});

  @override
  _FullWidthButtonElementState createState() => _FullWidthButtonElementState();
}

class _FullWidthButtonElementState extends State<FullWidthButtonElement>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _gradient1;
  late Animation _gradient2;
  late decorationPriority buttonPriority;

  AureusStylization currentStyle = palette.brightness() == Brightness.light
      ? packageVariables.resourceBranding.lightModeStyle
      : packageVariables.resourceBranding.darkModeStyle;

  @override
  void initState() {
    buttonPriority = widget.currentVariant;

    sensation.prepare();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _controller.forward();
            }
          });

    _gradient1 = ColorTween(
            begin: currentStyle.contrastGradient.colors.first,
            end: coloration.accentColor())
        .animate(_controller);

    _gradient2 = ColorTween(
            begin: currentStyle.contrastGradient.colors.last,
            end: coloration.inactiveColor())
        .animate(_controller);

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    sensation.dispose();
    super.dispose();
  }

  //Switches decoration to active, and then returns it to current variant.
  void createButtonInteraction() {
    sensation.createSensation(sensationType.press);
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled =
        widget.currentVariant == decorationPriority.inactive ? false : true;

    //variables that change how the variants are displayed in build time
    BoxDecoration buttonDecoration = ButtonBackingDecoration(
            variant: buttonDecorationVariants.edgedRectangle,
            decorationVariant: buttonPriority)
        .buildBacking();

    var screenWidth = size.logicalWidth();

    Size minimumButtonTextSize = Accessibility.textStringSize(
        textInput: widget.buttonTitle,
        textStyle: button1(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    var fullWidthButtonContent = Container(
        constraints: BoxConstraints(
          minHeight: minimumButtonTextSize.height * 3,
          maxHeight: minimumButtonTextSize.height * 3,
          minWidth: screenWidth,
        ),
        decoration: widget.currentVariant == decorationPriority.important
            ? BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [_gradient1.value, _gradient2.value]),
                color: coloration.contrastColor())
            : buttonDecoration,
        child: Center(
            child: ButtonOneText(widget.buttonTitle, widget.currentVariant)));

    var fullWidthButtonInteractor = GestureDetector(
        onTap: () {
          if (isButtonEnabled == true) {
            createButtonInteraction();
            widget.buttonAction();
          }
        },
        child: PulseShadowElement(
          pulseWidth: screenWidth,
          isActive: widget.currentVariant == decorationPriority.important
              ? true
              : false,
          child: fullWidthButtonContent,
        ));

    return Semantics.fromProperties(
      properties: SemanticsWrapper.button(
          isEnabled: isButtonEnabled,
          label: widget.buttonTitle,
          hint: widget.buttonHint,
          isMutuallyExclusive: false),
      child: fullWidthButtonInteractor,
    );
  }
}
