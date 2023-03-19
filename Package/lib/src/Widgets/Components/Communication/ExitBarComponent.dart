import 'dart:io';

import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/*--------- EXIT BAR ----------*/
/// An exit bar that stays at the top of the user's screen and exits the
/// screen when pressed.
///
/// This is not able to be controlled by a developer, as this is a user
/// setting that someone can enable for any AureusResource in their
/// safety plan. Whether or not a user wants to see an ExitBar is
/// handled by Aureus and the ContainerView. You don't need to
/// worry about manual implementation.

class ExitBarComponent extends StatefulWidget {
  const ExitBarComponent();

  @override
  _ExitBarComponentState createState() => _ExitBarComponentState();
}

class _ExitBarComponentState extends State<ExitBarComponent> {
  @override
  Widget build(BuildContext context) {
    //because the bar breaks from current backing build conventions due
    //to safety reasons, we have a custom variable that simply returns a
    //color instead of .buildBacking();
    Color barBacking() {
      return palette.brightness() == Brightness.light
          ? palette.white()
          : palette.black();
    }

    Alignment barAlignment() {
      //centers items on bottom if the user is on a mobile device

      var currentPlatform = Theme.of(context).platform;

      if (currentPlatform == TargetPlatform.android ||
          currentPlatform == TargetPlatform.iOS) {
        return Alignment.bottomCenter;
      }

      //centers items on center if the user is on a website

      return Alignment.center;
    }

    var screenSize = size.logicalScreenSize();
    var screenWidth = size.logicalWidth();

    Size accessibilitySizing = Accessibility.textStringSize(
        textInput: 'Tap the button to quickly exit.',
        textStyle: body1(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    var exitBarRow = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          BodyOneText('Tap the button to exit.', decorationPriority.standard),
          SmolButtonElement(
              decorationVariant: decorationPriority.important,
              buttonTitle: 'Exit now.',
              buttonHint: 'Closes ',
              buttonAction: () => {exit(1)})
        ]);

    var exitBarContainer = Container(
        constraints: BoxConstraints(
            minHeight: accessibilitySizing.height * 3, minWidth: screenWidth),
        child: Align(
          alignment: barAlignment(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: accessibilitySizing.height * 2,
                minWidth: size.layoutItemWidth(1, screenSize),
                maxWidth: size.layoutItemWidth(1, screenSize)),
            child: exitBarRow,
          ),
        ),
        decoration: BoxDecoration(
          color: barBacking(),
          border: Border(
              bottom: BorderSide(
                  color: palette.steel().withOpacity(0.3), width: 1)),
        ));

    return Semantics.fromProperties(
      properties: SemanticsWrapper.customItem(
          isEnabled: true,
          label: 'Exit Bar',
          hint:
              'Has an exit bar that allows you to quickly leave ${resourceValues.name} by changing the screen.',
          isFocusable: true,
          isEditable: false),
      child: exitBarContainer,
    );
  }
}
