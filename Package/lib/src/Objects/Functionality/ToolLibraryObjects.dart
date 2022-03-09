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
  final IconData toolIcon;
  //Specific icon for your tool.
  // ------------------------------
  final Widget entryPoint;
  // The widget that's the entry point for actually using your tool.
  // If you're using tool card templates, it's recommended
  // to make the entry point a ToolNavigationCardCarousel
  // ------------------------------
  final Map<String, VoidCallback> nextSteps;
  // A map of a string (which describes action to the user),
  // and a corresponding VoidCallback which completes that
  // action if the item is pressed that will be shown
  // at the end of a tool flow.
  //----------------------------------------
  List<ToolCardTemplate>? toolCards;
  // The list of tool cards that you use within the flow of a Core Tool
  // This allows Aureus to auto-generate a flow for you, and to
  // carry the template data from usage to summary.

  CoreTool(this.toolCards,
      {required this.toolName,
      required this.toolDescription,
      required this.toolDetails,
      required this.toolIcon,
      required this.entryPoint,
      required this.nextSteps});
}

// The navigation container that holds your tool functionality.
// This is initialized for you based on whether or not you provide
// tool cards within the CoreTool constructor.
ToolNavigationContainer navigationContainer(CoreTool tool) {
  return ToolNavigationContainer(tool.toolCards!.isEmpty ? [] : tool.toolCards,
      tool.toolCards!.isNotEmpty ? ToolSummaryView(parentTool: tool) : null,
      details: ToolDetailView(parentTool: tool),
      entryPoint: tool.toolCards!.isEmpty
          ? tool.entryPoint
          : ToolTemplateCardCarouselView(parentTool: tool),
      nextSteps:
          ToolNextStepsView(parentTool: tool, nextSteps: tool.nextSteps));
}

// ------------------------------
// Dev note from Amanda (3/8/2022): it's currently initalized
// within a function because implementing this
// as a variable of the CoreTool class
// caused a 'maximum call stack' error.
// Maybe in the future a better developer than me (Amanda)
// can figure out a more elegant solution to having a navigation
// container being initialized like this, but I've been
// hard pressed to find another way.

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

// An observer pattern that the ToolTemplateCardCarouselView
// uses to receive instructions from the ToolTemplateCards on moving
// forward / going backward, depending on the interaction that the
// user takes on the card.

class AureusToolTemplateMaster {
  List<AureusToolTemplateObserver> _observers = [];

  void registerObserver(AureusToolTemplateObserver observer) {
    print('observer registered');
    _observers.add(observer);
  }

  void unregisterObserver(AureusToolTemplateObserver observer) {
    print('observer unregistered :-(');
    _observers.remove(observer);
  }

  void notifyObserverForward() {
    print('notifying observers about moving forward');
    for (var observer in _observers) {
      observer.nextAction();
    }
  }

  void notifyObserverBackward() {
    print('notifying observers about going backwards');
    for (var observer in _observers) {
      observer.previousAction();
    }
  }
}

mixin AureusToolTemplateObserver {
  void nextAction() {}
  void previousAction() {}
}

var toolTemplateMaster = AureusToolTemplateMaster();
/* ------------------ Tool Card Template -------------------- */

class ToolCardTemplate {
  final String templatePrompt;
  final IconData badgeIcon;

  const ToolCardTemplate(
      {required this.templatePrompt, required this.badgeIcon});

  void onNextCard() {
    print('requests move to next card');
    toolTemplateMaster.notifyObserverForward();
  }

  void onPreviousCard() {
    print('requests return to previous card');
    toolTemplateMaster.notifyObserverBackward();
  }

  Widget returnActiveToolCard() {
    throw ('Should be overriden by the child tool template.');
  }

  Widget returnTemplateSummary() {
    throw ('Should be overriden by the child tool template.');
  }
}
