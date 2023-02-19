part of AureusTestingApp;

class AureusInteractionsView extends StatefulWidget {
  const AureusInteractionsView();

  @override
  _AureusInteractionsViewState createState() => _AureusInteractionsViewState();
}

class _AureusInteractionsViewState extends State<AureusInteractionsView> {
  List<Widget> viewGridCards = [];

  @override
  Widget build(BuildContext context) {
    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.fullScreen,
        children: [
          ArticleViewElement(
              title: "Interactions",
              subheader: "Meet the magic behind Aureus' sensations helper",
              body: "")
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.important, builder: viewLayout);
  }
}
