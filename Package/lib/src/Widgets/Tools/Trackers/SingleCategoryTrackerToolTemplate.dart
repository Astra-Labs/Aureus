import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class SingleCategoryTrackerToolTemplate extends ToolNavigationPage {
  final CoreTool parentTool;

  SingleCategoryTrackerToolTemplate({required this.parentTool})
      : super(
            parentTool: parentTool,
            pageBody: const ContainerWrapperElement(
                children: [], containerVariant: wrapperVariants.fullScreen));
}
