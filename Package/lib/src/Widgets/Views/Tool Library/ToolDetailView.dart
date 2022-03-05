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

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        SecondaryIconButtonElement(
            decorationVariant: decorationPriority.standard,
            buttonIcon: Assets.no,
            buttonTooltip: 'Exit ${tool.toolName} informa',
            buttonAction: () => {Navigator.pop(context)}),
        IconBadge(
            badgeIcon: tool.toolIcon,
            badgePriority: decorationPriority.important),
        HeadingOneText(tool.toolName, decorationPriority.standard),
        FloatingContainerElement(
            child: Container(
                constraints: BoxConstraints(),
                decoration: LayerBackingDecoration(
                        priority: decorationPriority.standard)
                    .buildBacking(),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Spacer(),
                      TagOneText('Description', decorationPriority.standard),
                      SizedBox(height: 20.0),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: LayerBackingDecoration(
                                priority: decorationPriority.standard)
                            .buildBacking(),
                        child: SingleChildScrollView(
                          child: Wrap(
                            children: [
                              BodyOneText(tool.toolDescription,
                                  decorationPriority.standard)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TagOneText('Used for', decorationPriority.standard),
                      SizedBox(height: 20.0),
                      DetailCardCarouselComponent(
                          cardDetailCarousel: tool.toolDetails),
                      Spacer()
                    ],
                  ),
                ))),
        FullWidthButtonElement(
            buttonTitle: 'Open ${tool.toolName}.',
            currentVariant: decorationPriority.important,
            buttonAction: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            tool.navigationContainer.entryPoint,
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
