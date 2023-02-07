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
    var screenSize = size.logicalScreenSize();

    setState(() {
      viewGridCards.clear();

      aureusViews.forEach((key, value) {
        viewGridCards.add(InkWell(
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => value,
                ))
          },
          child: GridCardElement(
            decorationVariant: decorationPriority.standard,
            cardLabel: key,
            gridSize: Size(size.layoutItemWidth(1, screenSize),
                size.layoutItemHeight(1, screenSize)),
          ),
        ));
      });
    });

    Wrap viewsCardList = Wrap(
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.spaceEvenly,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      runSpacing: 15,
      children: viewGridCards,
    );

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.fullScreen,
        children: [
          HeadingOneText('Safety', decorationPriority.standard),
          SizedBox(height: 10.0),
          Divider(),
          SizedBox(height: 10.0),
          Center(
            child: SizedBox(
              height: size.layoutItemHeight(1, screenSize),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: viewsCardList,
              ),
            ),
          )
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.important, builder: viewLayout);
  }
}