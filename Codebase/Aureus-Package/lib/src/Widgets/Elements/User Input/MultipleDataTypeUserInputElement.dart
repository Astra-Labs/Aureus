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
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: size.universalPadding(),
          child: TabSubheaderElement(title: widget.dataLabel)),
      Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
            width: 250,
            height: 60,
            decoration: BoxDecoration(
              border: foundation.universalBorder(),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: foundation.ice(),
            ),
            child: Center(
                child: Padding(
              padding: size.universalPadding(),
              child: TextFormField(
                  style:
                      foundation.heading2().copyWith(color: foundation.black()),
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
      ),
    ]);
  }
}
