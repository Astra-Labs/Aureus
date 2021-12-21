import 'package:aureus/aureus.dart';

//
//Doc Link:

class SingleDataTypeUserInputElement extends StatefulWidget {
  final String dataPlaceholder;
  final TextInputType dataTextType;

  const SingleDataTypeUserInputElement(
      {required this.dataPlaceholder, required this.dataTextType});

  @override
  _SingleDataTypeUserInputElementState createState() =>
      _SingleDataTypeUserInputElementState();
}

class _SingleDataTypeUserInputElementState
    extends State<SingleDataTypeUserInputElement> {
  BoxDecoration userInputBacking = InputBackingDecoration().buildBacking();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 1,
      child: Container(
          decoration: userInputBacking,
          child: Center(
              child: Padding(
            padding: size.universalPadding(),
            child: TextFormField(
                style: foundation
                    .heading2()
                    .copyWith(color: coloration.contrastColor()),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintStyle: foundation.body1(),
                    hintText: widget.dataPlaceholder),
                autocorrect: false,
                textAlign: TextAlign.left,
                keyboardType: widget.dataTextType),
          ))),
    );
  }
}
