part of AureusTestingApp;

/*--------- COMPONENTS SUBVIEW ----------*/

class ComponentsSubview extends StatefulWidget {
  const ComponentsSubview();

  @override
  _ComponentsSubviewState createState() => _ComponentsSubviewState();
}

class _ComponentsSubviewState extends State<ComponentsSubview> {
  @override
  Widget build(BuildContext context) {
    var componentList = ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: aureusComponents.length,
        itemBuilder: (BuildContext context, int index) {
          var currentWidget = aureusComponents.values.elementAt(index);
          var currentValue = aureusComponents.keys.elementAt(index);

          var itemWidget = Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              BodyOneText(currentValue, decorationPriority.standard),
              const SizedBox(height: 30),
              currentWidget,
              const SizedBox(height: 30),
              DividerElement(),
              const SizedBox(height: 30),
            ],
          );

          return itemWidget;
        });

    var viewBuilder = ContainerWrapperElement(children: [
      HeadingOneText("Components", decorationPriority.standard),
      SizedBox(height: 10),
      componentList
    ], containerVariant: wrapperVariants.stackScroll);

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewBuilder);
  }
}
