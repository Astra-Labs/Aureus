import 'package:aureus/aureus.dart';

//
//Doc Link:

class MultipleDataTypeUserInputElement extends StatefulWidget {
  final String dataLabel;
  final String dataPlaceholder;
  final TextInputType dataTextType;

  const MultipleDataTypeUserInputElement(
      {required this.dataLabel,
      required this.dataPlaceholder,
      required this.dataTextType});

  @override
  _MultipleDataTypeUserInputElementState createState() =>
      _MultipleDataTypeUserInputElementState();
}

class _MultipleDataTypeUserInputElementState
    extends State<MultipleDataTypeUserInputElement> {
  BoxDecoration userInputBacking = InputBackingDecoration().buildBacking();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: size.universalPadding(),
          child: TabSubheaderElement(title: widget.dataLabel)),
      Padding(
        padding: size.universalPadding(),
        child: AspectRatio(
          aspectRatio: 4 / 1,
          child: Container(
              decoration: userInputBacking,
              child: Center(
                  child: Padding(
                padding: size.universalPadding(),
                child: TextFormField(
                    style:
                        heading2().copyWith(color: coloration.contrastColor()),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintStyle: body1(),
                        hintText: widget.dataPlaceholder),
                    autocorrect: false,
                    textAlign: TextAlign.left,
                    keyboardType: widget.dataTextType),
              ))),
        ),
      ),
    ]);
  }
}
