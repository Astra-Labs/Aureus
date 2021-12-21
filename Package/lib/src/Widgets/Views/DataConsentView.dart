import 'package:aureus/aureus.dart';

//
//Doc Link:

class DataOptInView extends StatefulWidget {
  const DataOptInView();

  @override
  _DataOptInViewState createState() => _DataOptInViewState();
}

class _DataOptInViewState extends State<DataOptInView> {
  @override
  Widget build(BuildContext context) {
    LayoutBuilder viewLayout = LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container();
    });

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
