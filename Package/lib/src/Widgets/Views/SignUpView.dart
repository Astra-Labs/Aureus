import 'package:aureus/aureus.dart';

//
//Doc Link:

class SignUpView extends StatefulWidget {
  const SignUpView();

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    LayoutBuilder viewLayout = LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container();
    });

    return ContainerView(
        decorationVariant: decorationPriority.important, builder: viewLayout);
  }
}
