import 'package:aureus/aureus.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView();

  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  Widget build(BuildContext context) {
    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.fullScreen, children: []);

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
