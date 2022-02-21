import 'package:aureus/aureus.dart';

/* ------------------ CORE TOOL -------------------- */
/*

*/

class CoreTool {
  final String toolName;
  final List<String> toolDescription;
  final ToolNavigationContainer navigationContainer;
  final IconData toolIcon;
  final Widget entrySource;
  final Widget exitSource;
  final List<CoreTool> nextSteps;

  const CoreTool(
      {required this.toolName,
      required this.toolDescription,
      required this.navigationContainer,
      required this.toolIcon,
      required this.entrySource,
      required this.exitSource,
      required this.nextSteps});
}

/* ------------------ Tool Navigation Container -------------------- */
/*

*/

class ToolNavigationContainer {
  final CoreTool toolParent;
  final Widget exitPoint;
  final ContainerWrapperElement widgetChild;

  const ToolNavigationContainer(
      {required this.toolParent,
      required this.exitPoint,
      required this.widgetChild});
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

  @override
  Widget build(BuildContext context) {
    var carouselLayout = ContainerWrapperElement(
        children: [], containerVariant: wrapperVariants.fullScreen);

    return ContainerView(
        decorationVariant: decorationPriority.standard,
        builder: carouselLayout);
  }
}

/* ------------------ Tool Card Template -------------------- */
/*

-------

*/

class ToolCardTemplate {
  final String templatePrompt;
  final List<Widget> templateItems;
  final IconData badgeIcon;

  const ToolCardTemplate(
      {required this.templatePrompt,
      required this.templateItems,
      required this.badgeIcon});

  Widget returnActiveToolCard() {
    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: templateItems);
  }

  Widget returnTemplateSummary() {
    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: templateItems);
  }
}
