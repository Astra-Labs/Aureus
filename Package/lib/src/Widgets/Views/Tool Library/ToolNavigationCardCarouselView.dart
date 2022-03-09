import 'package:aureus/aureus.dart';

class ToolTemplateCardCarouselView extends StatefulWidget {
  final CoreTool parentTool;
  ToolTemplateCardCarouselView({required this.parentTool})
      : assert(parentTool.toolCards!.isNotEmpty == true,
            'ToolTemplateCardCarouselView requires the parent CoreTool to have tool cards in the navigation container.');

  @override
  _ToolTemplateCardCarouselViewState createState() =>
      _ToolTemplateCardCarouselViewState();
}

class _ToolTemplateCardCarouselViewState
    extends State<ToolTemplateCardCarouselView>
    with AureusToolTemplateObserver {
  late ToolNavigationContainer toolNavigation;

  //the index current card being shown
  int currentCardIndex = 0;

  @override
  void initState() {
    toolTemplateMaster.registerObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    toolTemplateMaster.unregisterObserver(this);
    super.dispose();
  }

  //implementation of Aureus Tool Template observer patterns
  @override
  void nextAction() {
    print(
        "current index is $currentCardIndex, length is ${widget.parentTool.toolCards!.length}");
    setState(() {
      if (currentCardIndex <= widget.parentTool.toolCards!.length) {
        print("card hasn't hit limit");
        currentCardIndex += 1;
      }
      if (currentCardIndex == (widget.parentTool.toolCards!.length)) {
        print("card has hit limit");
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  navigationContainer(widget.parentTool).summary!),
        );
      }
    });
  }

  //implementation of Aureus Tool Template observer patterns
  @override
  void previousAction() {
    print('Received previous card instructions from master.');
    setState(() {
      if (currentCardIndex != 0) {
        currentCardIndex -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //the current, visible active card.
    Widget activeCardItem = Container();
    //the summary of all of the previous cards and their answers
    List<Widget> summaryListView = [];

    var screenSize = size.logicalScreenSize();
    var children = widget.parentTool.toolCards!;
    toolNavigation = navigationContainer(widget.parentTool);

    children.forEach((element) {
      if (children.indexOf(element) == currentCardIndex) {
        print('is the active card');
        activeCardItem = element.returnActiveToolCard();
      } else if (children.indexOf(element) < currentCardIndex) {
        print('is the inactive card');
        summaryListView.insert(
            0,
            Padding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: element.returnTemplateSummary()));
      }
    });

    var summaryList = SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ListView(shrinkWrap: true, children: summaryListView));

    var carouselLayout = ContainerWrapperElement(
      children: [
        Center(
          child: SizedBox(
            width: size.layoutItemWidth(1, screenSize),
            height: size.layoutItemHeight(1, screenSize),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  PageHeaderElement.withExit(
                      pageTitle: widget.parentTool.toolName,
                      onPageExit: () => {Navigator.pop(context)}),
                  SizedBox(height: 30.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      activeCardItem,
                      SizedBox(height: 20.0),
                      summaryList,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingContainerElement(
              child: Container(
                  width: screenSize.width,
                  height: size.layoutItemHeight(6, screenSize),
                  decoration: LayerBackingDecoration(
                          priority: decorationPriority.inactive)
                      .buildBacking(),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProgressIndicatorElement(
                      value: (currentCardIndex /
                          widget.parentTool.toolCards!.length),
                    ),
                  )))),
        )
      ],
      containerVariant: wrapperVariants.fullScreen,
      takesFullWidth: true,
    );

    return ContainerView(
      decorationVariant: decorationPriority.important,
      builder: carouselLayout,
      takesFullWidth: true,
    );
  }
}
