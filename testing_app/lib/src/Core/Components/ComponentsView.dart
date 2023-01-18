part of AureusTestingApp;

/*  COMPONENTS  */

class AureusComponentsView extends StatefulWidget {
  const AureusComponentsView();

  @override
  _AureusComponentsViewState createState() => _AureusComponentsViewState();
}

class _AureusComponentsViewState extends State<AureusComponentsView> {
  @override
  Widget build(BuildContext context) {
    var component = IteratingComponent(
        itemTitles: aureusComponents.keys.toList(),
        itemWidgets: aureusComponents.values.toList());

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.stackScroll,
        children: [
          HeadingOneText('Components', decorationPriority.standard),
          SizedBox(height: 10.0),
          Divider(),
          SizedBox(height: 10.0),
          component
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.important, builder: viewLayout);
  }
}
