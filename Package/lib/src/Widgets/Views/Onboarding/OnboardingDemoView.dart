import 'package:aureus/aureus.dart';

class OnboardingDemoView extends StatefulWidget {
  final List<CoreTool> toolItems;
  final Widget exitPoint;

  const OnboardingDemoView({required this.toolItems, required this.exitPoint});

  @override
  _OnboardingDemoViewState createState() => _OnboardingDemoViewState();
}

class _OnboardingDemoViewState extends State<OnboardingDemoView> {
  @override
  Widget build(BuildContext context) {
    List<Widget> cardItems = [];

    for (var item in widget.toolItems) {
      cardItems.add(Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
        child: CategoryIconDetailCardElement(
            decorationVariant: decorationPriority.standard,
            cardLabel: item.toolName,
            cardBody: item.toolDescription[0],
            cardIcon: item.toolIcon),
      ));
    }

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        PageHeaderElement.withExit(
            pageTitle: "${packageVariables.prodName}'s Tools",
            onPageExit: () => {}),
        Spacer(),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: cardItems))
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.important, builder: viewLayout);
  }
}
