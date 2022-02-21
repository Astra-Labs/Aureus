import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class ToolNavigationPage {
  final CoreTool parentTool;
  final ContainerWrapperElement pageBody;
  const ToolNavigationPage({required this.parentTool, required this.pageBody});
}

class MultiCategoryItemInfoToolTemplate extends ToolNavigationPage {
  final CoreTool parentTool;
  final ContainerWrapperElement body = ContainerWrapperElement(
      children: [], containerVariant: wrapperVariants.fullScreen);

  const MultiCategoryItemInfoToolTemplate({required this.parentTool})
      : super(parentTool: parentTool, pageBody: body);
}
