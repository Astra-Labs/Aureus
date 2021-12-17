import 'package:aureus/aureus.dart';

//A full width button that acts as the main CTA
//Doc Link:

class FullWidthButtonElement extends StatefulWidget {
  final String buttonTitle;
  final decorationPriority currentVariant;
  final VoidCallback buttonAction;

  const FullWidthButtonElement(
      {required this.buttonTitle,
      required this.currentVariant,
      required this.buttonAction});

  @override
  _FullWidthButtonElementState createState() => _FullWidthButtonElementState();
}

class _FullWidthButtonElementState extends State<FullWidthButtonElement> {
  @override
  Widget build(BuildContext context) {
    //to fully have the custom functionality wanted, buttons needed to be a pressable container that holds a text button instead of a stock button widget.

    //variables that change how the variants are displayed in build time
    BoxDecoration buttonDecoration;
    bool isButtonEnabled;
    Color buttonTextColor;

    switch (widget.currentVariant) {
      case decorationPriority.inactive:

        //variables that define the variant 'inactive' for full width buttons
        isButtonEnabled = false;
        buttonTextColor = foundation.iron();
        buttonDecoration =
            BoxDecoration(color: foundation.melt().withOpacity(0.5));

        break;

      case decorationPriority.standard:

        //variables that define the variant 'light active' for full width buttons
        isButtonEnabled = true;
        buttonTextColor = foundation.carbon();
        buttonDecoration = BoxDecoration(
            border:
                Border(top: BorderSide(width: 1, color: foundation.steel())),
            gradient: foundation.mediumGradient());

        break;

      case decorationPriority.important:

        //variables that define the variant 'dark active' for full width buttons
        isButtonEnabled = true;
        buttonTextColor = foundation.melt();
        buttonDecoration = BoxDecoration(
            border:
                Border(top: BorderSide(width: 1, color: foundation.carbon())),
            gradient: foundation.darkGradient());

        break;
    }

    return Container(
        alignment: Alignment.bottomCenter,
        padding: size.universalPadding(),
        decoration: buttonDecoration,
        width: MediaQuery.of(context).size.width,
        height: (MediaQuery.of(context).size.height / 7),
        child: Expanded(
            child: TextButton(
                onPressed: isButtonEnabled ? widget.buttonAction : null,
                child: Text(widget.buttonTitle),
                style: TextButton.styleFrom(
                    textStyle:
                        foundation.button2().copyWith(color: buttonTextColor),
                    padding: size.universalPadding(),
                    enableFeedback: true))));
  }
}
