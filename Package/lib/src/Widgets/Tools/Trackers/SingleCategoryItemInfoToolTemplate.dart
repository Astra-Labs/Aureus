import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class SingleCategoryItemInfoToolTemplate extends ToolNavigationPage {
  final CoreTool parentTool;

  SingleCategoryItemInfoToolTemplate({required this.parentTool})
      : super(
            parentTool: parentTool,
            pageBody: const ContainerWrapperElement(
                children: [], containerVariant: wrapperVariants.fullScreen));
}
