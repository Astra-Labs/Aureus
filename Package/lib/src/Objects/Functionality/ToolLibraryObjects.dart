import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class CoreTool {
  final String toolName;
  final List<String> toolDescription;
  final List<ToolTemplate> toolCards;
  final IconData toolIcon;
  final Widget entrySource;
  final Widget exitSource;

  const CoreTool(
      {required this.toolName,
      required this.toolDescription,
      required this.toolCards,
      required this.toolIcon,
      required this.entrySource,
      required this.exitSource});
}

class ToolTemplate {
  final String templatePrompt;
  final List<Widget> templateItems;
  final IconData badgeIcon;

  const ToolTemplate(
      {required this.templatePrompt,
      required this.templateItems,
      required this.badgeIcon});

  Widget returnTemplateSummary() {
    // returns card that shows under tool to be used as summary card
    throw ('Inactive template summary not implemented by child class.');
  }

  Widget returnActiveToolCard() {
    // returns active card that takes user input.
    throw ('Active template card not overriden by child class.');
  }
}
