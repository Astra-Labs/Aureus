part of AureusTestingApp;

class AureusSafetyView extends StatefulWidget {
  const AureusSafetyView();

  @override
  _AureusSafetyViewState createState() => _AureusSafetyViewState();
}

class _AureusSafetyViewState extends State<AureusSafetyView> {
  List<Widget> viewGridCards = [];

  @override
  Widget build(BuildContext context) {
    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.fullScreen,
        children: [
          ArticleViewElement(title: "Safety", subheader: "", body: "")
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.important, builder: viewLayout);
  }
}
