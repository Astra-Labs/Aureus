import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class MultiCategoryTrackerToolTemplate extends ToolNavigationPage {
  @override
  final CoreTool parentTool;

  MultiCategoryTrackerToolTemplate({required this.parentTool})
      : super(
            parentTool: parentTool,
            pageBody: ContainerWrapperElement(
                children: [], containerVariant: wrapperVariants.fullScreen));
}
