import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class ToolDetailView extends StatefulWidget {
  final CoreTool parentTool;

  const ToolDetailView({required this.parentTool});

  @override
  _ToolDetailViewState createState() => _ToolDetailViewState();
}

class _ToolDetailViewState extends State<ToolDetailView> {
  @override
  Widget build(BuildContext context) {
    var tool = widget.parentTool;
    var toolNavigation = navigationContainer(tool);
    var screenSize = size.logicalScreenSize();

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      takesFullWidth: true,
      children: [
        Center(
          child: SizedBox(
            width: size.layoutItemWidth(1, screenSize),
            height: size.layoutItemHeight(1, screenSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.topRight,
                  child: SecondaryIconButtonElement(
                      decorationVariant: decorationPriority.standard,
                      buttonIcon: Assets.no,
                      buttonHint: 'Exit ${tool.toolName} details',
                      buttonAction: () => {Navigator.pop(context)}),
                ),
                const Spacer(),
                IconBadge(
                    badgeIcon: tool.toolIcon,
                    badgePriority: decorationPriority.important),
                const SizedBox(height: 15.0),
                HeadingOneText(tool.toolName, decorationPriority.standard),
                const SizedBox(height: 40.0),
                FloatingContainerElement(
                    child: Container(
                        width: size.layoutItemWidth(1, screenSize),
                        decoration: LayerBackingDecoration(
                                priority: decorationPriority.standard)
                            .buildBacking(),
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 20.0),
                              const TabSubheaderElement(title: 'Description'),
                              const SizedBox(height: 20.0),
                              Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: LayerBackingDecoration(
                                        priority: decorationPriority.standard)
                                    .buildBacking(),
                                child: BodyOneText(tool.toolDescription,
                                    decorationPriority.standard),
                              ),
                              const SizedBox(height: 20.0),
                              const TabSubheaderElement(title: 'Used for'),
                              const SizedBox(height: 20.0),
                              DetailCardCarouselComponent(
                                  cardDetailCarousel: tool.toolDetails),
                              const SizedBox(height: 20.0),
                            ],
                          ),
                        ))),
                const Spacer(),
              ],
            ),
          ),
        ),
        const Spacer(),
        FullWidthButtonElement(
            buttonTitle: 'Use tool.',
            buttonHint: 'Starts ${tool.toolName}.',
            currentVariant: decorationPriority.important,
            buttonAction: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => toolNavigation.entryPoint!,
                      ))
                })
      ],
    );

    return ContainerView(
      decorationVariant: decorationPriority.standard,
      builder: viewLayout,
      takesFullWidth: true,
    );
  }
}
