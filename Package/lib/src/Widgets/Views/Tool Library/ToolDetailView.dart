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
              mainAxisSize: MainAxisSize.max,
              children: [
                Spacer(),
                Align(
                  alignment: Alignment.topRight,
                  child: SecondaryIconButtonElement(
                      decorationVariant: decorationPriority.standard,
                      buttonIcon: Assets.no,
                      buttonTooltip: 'Exit ${tool.toolName} details',
                      buttonAction: () => {Navigator.pop(context)}),
                ),
                Spacer(),
                IconBadge(
                    badgeIcon: tool.toolIcon,
                    badgePriority: decorationPriority.important),
                SizedBox(height: 10.0),
                HeadingOneText(tool.toolName, decorationPriority.standard),
                SizedBox(height: 40.0),
                FloatingContainerElement(
                    child: Container(
                        height: size.layoutItemHeight(1, screenSize) * 0.6,
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
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Spacer(),
                              TabSubheaderElement(title: 'Description'),
                              SizedBox(height: 20.0),
                              Container(
                                padding: EdgeInsets.all(12.0),
                                decoration: LayerBackingDecoration(
                                        priority: decorationPriority.standard)
                                    .buildBacking(),
                                child: BodyOneText(tool.toolDescription,
                                    decorationPriority.standard),
                              ),
                              SizedBox(height: 20.0),
                              TabSubheaderElement(title: 'Used for'),
                              SizedBox(height: 20.0),
                              DetailCardCarouselComponent(
                                  cardDetailCarousel: tool.toolDetails),
                              Spacer(),
                            ],
                          ),
                        ))),
                Spacer(),
              ],
            ),
          ),
        ),
        Spacer(),
        FullWidthButtonElement(
            buttonTitle: 'Open ${tool.toolName}.',
            currentVariant: decorationPriority.important,
            buttonAction: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => toolNavigation.entryPoint,
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
