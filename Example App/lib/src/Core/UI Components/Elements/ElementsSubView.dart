part of AureusTestingApp;

/*--------- ELEMENTS SUBVIEW ----------*/

class ElementsSubview extends StatefulWidget {
  const ElementsSubview();

  @override
  _ElementsSubviewState createState() => _ElementsSubviewState();
}

class _ElementsSubviewState extends State<ElementsSubview> {
  @override
  Widget build(BuildContext context) {
    var elementsList = ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: aureusElements.length,
        itemBuilder: (BuildContext context, int index) {
          var currentWidget = aureusElements.values.elementAt(index);
          var currentValue = aureusElements.keys.elementAt(index);

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
      HeadingOneText("Elements", decorationPriority.standard),
      SizedBox(height: 10),
      elementsList
    ], containerVariant: wrapperVariants.stackScroll);

    return ContainerView(
      decorationVariant: decorationPriority.standard,
      builder: viewBuilder,
      showQuickActionBar: false,
    );
  }
}
