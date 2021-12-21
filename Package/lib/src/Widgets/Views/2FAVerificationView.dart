import 'package:aureus/aureus.dart';

//
//Doc Link:

class TFAVerificationView extends StatefulWidget {
  final modeVariants modeVariant;
  final deviceVariants deviceType;

  const TFAVerificationView(
      {required this.modeVariant, required this.deviceType});

  @override
  _TFAVerificationViewState createState() => _TFAVerificationViewState();
}

class _TFAVerificationViewState extends State<TFAVerificationView> {
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
