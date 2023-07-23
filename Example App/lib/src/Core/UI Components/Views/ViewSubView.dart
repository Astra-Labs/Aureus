part of AureusTestingApp;

/*--------- VIEWS SUBVIEW ----------*/

class ViewsSubview extends StatefulWidget {
  const ViewsSubview();

  @override
  _ViewsSubviewState createState() => _ViewsSubviewState();
}

class _ViewsSubviewState extends State<ViewsSubview> {
  Widget viewList() {
    List<Widget> logRow = [];

    for (var viewRow in aureusViewsCategory.entries) {
      List<Widget> tempCards = [];

      // Iterating through the top level of categories to make a sub-carousel
      for (var viewData in viewRow.value) {
        var cardElement = Focus(
            child: GestureDetector(
                onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => viewData.view,
                          ))
                    },
                child: StandardCardElement(
                    decorationVariant: decorationPriority.standard,
                    cardLabel: viewData.viewTitle)));

        tempCards
            .add(Padding(padding: EdgeInsets.all(8.0), child: cardElement));
      }
      // Adding the sub-carousel into the main list view.
      var rowItem = Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            TabSubheaderElement(title: viewRow.key),
            const SizedBox(height: 10.0),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: tempCards)),
            const SizedBox(height: 10.0),
            DividerElement()
          ],
        ),
      );

      logRow.add(rowItem);
    }

    return SizedBox(
      height: size.layoutItemHeight(1, MediaQuery.of(context).size),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: logRow,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var viewBuilder = ContainerWrapperElement(children: [
      HeadingOneText("Views", decorationPriority.standard),
      SizedBox(height: 10),
      viewList(),
    ], containerVariant: wrapperVariants.stackScroll);

    return ContainerView(
      decorationVariant: decorationPriority.important,
      builder: viewBuilder,
      showQuickActionBar: false,
      shouldManageNotifications: false,
    );
  }
}
