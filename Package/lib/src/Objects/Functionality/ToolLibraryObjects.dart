import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Objects}
/// {@image <image alt='' src=''>}

/// A set of objects that makes a 'tool'. Within Astra, we use this to develop
/// user flows for collecting incident log information, to build mental health
/// exercises, or to add a contact. A CoreTool can be any sort of flow or resource
/// for the end user.
class CoreTool {
  /// The name of your tool
  final String toolName;

  /// Description of your tool to be shown in ToolDetailView
  final String toolDescription;

  /// Information & Icons to represent important information about
  /// your tool. To be used in ToolDetailView.
  final Map<String, IconData> toolDetails;

  /// Specific icon for your tool.
  final IconData toolIcon;

  /// A map of a string (which describes action to the user),
  /// and a corresponding VoidCallback which completes that
  /// action if the item is pressed that will be shown
  /// at the end of a tool flow.
  final Map<String, VoidCallback> nextSteps;

  /// The list of tool cards that you use within the flow of a Core Tool
  /// This allows Aureus to auto-generate a flow for you, and to
  /// carry the template data from usage to summary.
  List<ToolCardTemplate>? toolCards;

  CoreTool({
    required this.toolName,
    required this.toolDescription,
    required this.toolDetails,
    required this.toolIcon,
    required this.nextSteps,
    this.toolCards,
  });
}

/* ------------------ Tool Navigation Container -------------------- */
/// Where you set all of the points of navigation & metadata
/// for your tool to be accessed and to go through the tool flow.

class ToolNavigationContainer {
  /// An instance of ToolDetailView for this tool.
  ToolDetailView? details;

  /// The widget where your tool starts. This is usually a
  /// ToolNavigationPage, or a ToolCardCarousel.
  Widget? entryPoint;

  /// The page users go to after they finish using the tool.
  /// This is what the summary view sends people to when done.
  ToolNextStepsView? nextSteps;

  /// The summary view that gives the user an overview
  /// of everything they've said. Optional, since it
  /// requires toolCards below to be initialized.
  ToolSummaryView? summary;

  ToolNavigationContainer({
    this.summary,
    this.entryPoint,
    this.details,
    this.nextSteps,
  });
}

/// An observer pattern that the ToolTemplateCardCarouselView
/// uses to receive instructions from the ToolTemplateCards on moving
/// forward / going backward, depending on the interaction that the
/// user takes on the card.

class AureusToolTemplateMaster {
  final List<AureusToolTemplateObserver> _observers = [];
  adaptiveInput inputType = adaptiveInput.text;

  void resetObservers() {
    _observers.clear();
  }

  void registerObserver(AureusToolTemplateObserver observer) {
    _observers.add(observer);
  }

  void unregisterObserver(AureusToolTemplateObserver observer) {
    _observers.remove(observer);
  }

  void notifyObserverForward() {
    for (var observer in _observers) {
      observer.nextAction();
    }
  }

  void notifyObserverBackward() {
    for (var observer in _observers) {
      observer.previousAction();
    }
  }

  void updateAdaptiveInput(adaptiveInput input) {
    for (var observer in _observers) {
      observer.retrieveAdaptiveInput(input);
    }
  }

  void retrieveAdaptiveInput(adaptiveInput input) {
    for (var observer in _observers) {
      observer.retrieveAdaptiveInput(input);
    }
  }
}

mixin AureusToolTemplateObserver {
  void nextAction() {}
  void previousAction() {}
  void updateAdaptiveInput(adaptiveInput input) {}
  void retrieveAdaptiveInput(adaptiveInput input) {}
}

var toolTemplateMaster = AureusToolTemplateMaster();
/* ------------------ Tool Card Template -------------------- */
/// A base class for all Tool Card Templates to inherit from.

class ToolCardTemplate {
  /// The string describing what to input into a tool
  final String templatePrompt;

  /// The badge associated with a tool input card
  final IconData badgeIcon;

  const ToolCardTemplate(
      {required this.templatePrompt, required this.badgeIcon});

  void onNextCard() {
    toolTemplateMaster.notifyObserverForward();
  }

  void onPreviousCard() {
    toolTemplateMaster.notifyObserverBackward();
  }

  Widget returnActiveToolCard() {
    throw ('Should be overriden by the child tool template.');
  }

  Widget returnTemplateSummary() {
    throw ('Should be overriden by the child tool template.');
  }
}
