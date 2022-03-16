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
            pageBody: const ContainerWrapperElement(
                children: [], containerVariant: wrapperVariants.fullScreen));
}
