part of AureusTestingApp;

class AureusElementsView extends StatefulWidget {
  const AureusElementsView();

  @override
  _AureusElementsViewState createState() => _AureusElementsViewState();
}

class _AureusElementsViewState extends State<AureusElementsView> {
  @override
  Widget build(BuildContext context) {
    var component = IteratingComponent(
        itemTitles: aureusElements.keys.toList(),
        itemWidgets: aureusElements.values.toList());

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.stackScroll,
        children: [
          HeadingOneText('Elements', decorationPriority.standard),
          SizedBox(height: 10.0),
          Divider(),
          SizedBox(height: 10.0),
          component
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.important, builder: viewLayout);
  }
}
