import 'dart:math';

import 'package:aureus/aureus.dart';
import 'package:aureus/src/Widgets/Views/Tool%20Library/ToolDetailView.dart';
import 'package:aureus/src/Widgets/Views/Tool%20Library/ToolNextStepView.dart';
import 'package:aureus/src/Widgets/Views/Tool%20Library/ToolSummaryView.dart';

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
  final List<CoreTool> nextSteps;
  //Other tools people can use after they finish.
  //This gets populated in ToolNextStepsView.dart
  // ------------------------------

  const CoreTool(
      {required this.toolName,
      required this.toolDescription,
      required this.toolDetails,
      required this.navigationContainer,
      required this.toolIcon,
      required this.nextSteps});
}

/* ------------------ Tool Navigation Container -------------------- */
/*

*/

class ToolNavigationContainer {
  ToolDetailView details;
  Widget entryPoint;
  ToolNextStepsView nextSteps;
  ToolSummaryView summary;
  ToolNavigationCardCarousel? cardCarousel;

  ToolNavigationContainer(this.cardCarousel,
      {required this.details,
      required this.entryPoint,
      required this.nextSteps,
      required this.summary});
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
  final List<ToolCardTemplate> toolCards;
  const ToolNavigationCardCarousel(
      {required this.parentTool, required this.toolCards});

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

    var children = widget.toolCards;

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
    throw ('onNextCard needs to be overriden by the parent navigation controller to manage card states.');
  }

  void onPreviousCard() {
    throw ('onNextCard needs to be overriden by the parent navigation controller to manage card states.');
  }

  Widget returnActiveToolCard() {
    throw ('Should be overriden by the child tool template.');
  }

  Widget returnTemplateSummary() {
    throw ('Should be overriden by the child tool template.');
  }
}
