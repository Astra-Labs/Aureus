import 'package:aureus/aureus.dart';

/* ------------------ CORE TOOL -------------------- */
/*

*/

class CoreTool {
  final String toolName;
  //The name of your tool
  // ------------------------------
  final String toolDescription;
  //Description of your tool to be shown in ToolDetailView
  // ------------------------------
  final Map<String, IconData> toolDetails;
  //Information & Icons to represent important information about
  //your tool. To be used in ToolDetailView.
  // ------------------------------
  final ToolNavigationContainer navigationContainer;
  //The navigation container that holds your tool functionality.
  // ------------------------------
  final IconData toolIcon;
  //Specific icon for your tool.
  // ------------------------------

  const CoreTool(
      {required this.toolName,
      required this.toolDescription,
      required this.toolDetails,
      required this.navigationContainer,
      required this.toolIcon});
}

/* ------------------ Tool Navigation Container -------------------- */
/*

Where you set all of the points of navigation & metadata
for your tool to be accessed and to go through the tool flow.

*/

class ToolNavigationContainer {
  ToolDetailView details;
  // An instance of ToolDetailView for this tool.
  // ------------------------------
  Widget entryPoint;
  // The widget where your tool starts. This is usually a
  // ToolNavigationPage, or a ToolCardCarousel.
  // ------------------------------
  ToolNextStepsView nextSteps;
  // The page users go to after they finish using the tool.
  // This is what the summary view sends people to when done.
  // ------------------------------
  ToolSummaryView? summary;
  // The summary view that gives the user an overview
  // of everything they've said. Optional, since it
  // requires toolCards below to be initialized.
  // ------------------------------
  List<ToolCardTemplate>? toolCards;
  // All of the tool card templates used within the view.
  // The ToolSummaryView & ToolCardCarouselView use this
  // to be able to read & write data across the screens.
  // ------------------------------

  ToolNavigationContainer(this.toolCards, this.summary,
      {required this.details,
      required this.entryPoint,
      required this.nextSteps});
}

/* ------------------ Tool Navigation Page -------------------- */
/*

*/

class ToolNavigationPage {
  final CoreTool parentTool;
  final ContainerWrapperElement pageBody;
  const ToolNavigationPage({required this.parentTool, required this.pageBody});
}

class ToolNavigationCardCarousel extends StatefulWidget {
  final CoreTool parentTool;
  ToolNavigationCardCarousel({required this.parentTool})
      : assert(parentTool.navigationContainer.toolCards!.isNotEmpty == true,
            'ToolNavigationCardCarousel requires the parent CoreTool to have tool cards in the navigation container.');

  @override
  _ToolNavigationCardCarouselState createState() =>
      _ToolNavigationCardCarouselState();
}

class _ToolNavigationCardCarouselState
    extends State<ToolNavigationCardCarousel> {
  void nextCard() {}
  void previousCard() {}
  void returnHome() {
    Navigator.pop(context);
  }

  void finishTool() {}

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    //the current, visible active card.
    Widget activeCardItem = Container();
    //the summary of all of the previous cards and their answers
    List<Widget> summaryListView = [];
    //the index current card being shown
    int currentCardIndex = 0;
    //the highest progress point reached in the tool.
    int toolProgressIndicator = 0;

    var children = widget.parentTool.navigationContainer.toolCards!;

    children.forEach((element) {
      if (children.indexOf(element) == currentCardIndex) {
        activeCardItem = element.returnActiveToolCard();
        toolProgressIndicator >= currentCardIndex
            ? toolProgressIndicator = currentCardIndex
            : toolProgressIndicator = toolProgressIndicator;
      } else if (children.indexOf(element) != currentCardIndex) {
        summaryListView.add(element.returnTemplateSummary());
      }
    });

    var summaryList = SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ListView(children: summaryListView));

    var carouselLayout = ContainerWrapperElement(children: [
      PageHeaderElement.withExit(
          pageTitle: widget.parentTool.toolName, onPageExit: () => {}),
      SizedBox(height: 35.0),
      Column(
        children: [
          activeCardItem,
          SizedBox(height: 20.0),
          summaryList,
        ],
      ),
      Spacer(),
      FloatingContainerElement(
          child: Container(
              width: size.layoutItemWidth(1, screenSize),
              height: size.layoutItemHeight(6, screenSize),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: LinearProgressIndicator(),
              )))
    ], containerVariant: wrapperVariants.fullScreen);

    return ContainerView(
        decorationVariant: decorationPriority.important,
        builder: carouselLayout);
  }
}

/* ------------------ Tool Card Template -------------------- */
/*

-------

*/

class ToolCardTemplate {
  final String templatePrompt;
  final IconData badgeIcon;

  const ToolCardTemplate(
      {required this.templatePrompt, required this.badgeIcon});

  void onNextCard() {
    print('requests move to next card');
    //throw ('onNextCard needs to be overriden by the parent navigation controller to manage card states.');
  }

  void onPreviousCard() {
    print('requests return to previous card');
    //throw ('onNextCard needs to be overriden by the parent navigation controller to manage card states.');
  }

  Widget returnActiveToolCard() {
    throw ('Should be overriden by the child tool template.');
  }

  Widget returnTemplateSummary() {
    throw ('Should be overriden by the child tool template.');
  }
}
