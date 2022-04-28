// ignore_for_file: must_be_immutable

import 'package:aureus/aureus.dart';

class ToolTemplateCardCarouselView extends StatefulWidget {
  final CoreTool parentTool;
  List<ToolCardTemplate> customCards;
  ToolTemplateCardCarouselView(
      {Key? key, required this.parentTool, this.customCards = const []})
      : assert(
            parentTool.toolCards!.isNotEmpty == true ||
                customCards.isNotEmpty == true,
            'ToolTemplateCardCarouselView requires the parent CoreTool to have tool cards in the navigation container, or to pass cards through the constructor.'),
        super(key: key);

  @override
  _ToolTemplateCardCarouselViewState createState() =>
      _ToolTemplateCardCarouselViewState();
}

class _ToolTemplateCardCarouselViewState
    extends State<ToolTemplateCardCarouselView>
    with AureusToolTemplateObserver, TickerProviderStateMixin {
  late ToolNavigationContainer toolNavigation;
  List<ToolCardTemplate> toolChildren = [];
  late AnimationController _controller;
  late Animation<Offset> _offset;

  //the index current card being shown
  int currentCardIndex = 0;

  @override
  void initState() {
    toolTemplateMaster.registerObserver(this);
    toolChildren = widget.customCards.isEmpty
        ? widget.parentTool.toolCards!
        : widget.customCards;

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //resets the container after the animation is reversed
          setState(() {
            if (currentCardIndex == (toolChildren.length - 1)) {
              print("card has hit limit");
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        navigationContainer(widget.parentTool).summary!),
              );
            } else {
              currentCardIndex += 1;
              _controller.reverse();
            }
          });
        }
      });

    _offset = Tween<Offset>(
            begin: const Offset(0.0, 0.35), end: const Offset(0.0, 2.0))
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.decelerate));

    super.initState();
  }

  @override
  void dispose() {
    toolTemplateMaster.unregisterObserver(this);
    _controller.dispose();
    super.dispose();
  }

  //implementation of Aureus Tool Template observer patterns
  @override
  void nextAction() {
    setState(() {
      if (currentCardIndex < toolChildren.length) {
        print("card hasn't hit limit");
        _controller.forward();
      }
    });
  }

  //implementation of Aureus Tool Template observer patterns
  @override
  void previousAction() {
    print('Received previous card instructions from master.');
    setState(() {
      _controller.reverse();
      if (currentCardIndex != 0) {
        currentCardIndex -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //the current, visible active card.
    Widget activeCardItem = Container();

    //the summary of all of the previous cards and their answers
    List<Widget> summaryListView = [];

    var screenSize = size.logicalScreenSize();
    toolNavigation = navigationContainer(widget.parentTool);

    for (var element in toolChildren) {
      if (toolChildren.indexOf(element) == currentCardIndex) {
        print('is the active card');
        activeCardItem = element.returnActiveToolCard();
      } else if (toolChildren.indexOf(element) < currentCardIndex) {
        print('is the inactive card');
        summaryListView.insert(
            0,
            Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: element.returnTemplateSummary()));
      }
    }

    var progressBar = FloatingContainerElement(
        child: Container(
            width: screenSize.width,
            decoration:
                LayerBackingDecoration(priority: decorationPriority.inactive)
                    .buildBacking(),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ProgressIndicatorElement(
                value: currentCardIndex == 0
                    ? 0.1
                    : (currentCardIndex / toolChildren.length),
              ),
            ))));

    var carouselLayout = ContainerWrapperElement(
      children: [
        SizedBox(
          width: size.layoutItemWidth(1, size.logicalScreenSize()),
          height: size.layoutItemHeight(1, size.logicalScreenSize()),
          child: Stack(alignment: Alignment.center, children: [
            Positioned(
                top: _offset.value.dy * (size.logicalWidth()),
                left: _offset.value.dx * (size.logicalHeight()),
                child: activeCardItem),
            Column(
              children: [
                PageHeaderElement.withExit(
                    pageTitle: widget.parentTool.toolName,
                    onPageExit: () => {Navigator.pop(context)}),
                const Spacer(),
                progressBar,
                const SizedBox(height: 10.0)
              ],
            ),
          ]),
        )
      ],
      containerVariant: wrapperVariants.fullScreen,
      takesFullWidth: true,
    );

    return ContainerView(
      decorationVariant: decorationPriority.important,
      builder: carouselLayout,
      takesFullWidth: false,
    );
  }
}
