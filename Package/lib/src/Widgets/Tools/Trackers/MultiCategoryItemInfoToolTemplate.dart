import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class MultiCategoryItemInfoToolTemplate extends ToolNavigationPage {
  final CoreTool parentTool;

  MultiCategoryItemInfoToolTemplate({required this.parentTool})
      : super(
            parentTool: parentTool,
            pageBody: ContainerWrapperElement(
                children: [], containerVariant: wrapperVariants.fullScreen));
}
