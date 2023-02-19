import 'package:aureus/aureus.dart';

/// {@category Widgets}
/// {@subCategory Tools}
/// {@image <image alt='' src=''>}

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
