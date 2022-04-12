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
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          //resets the container after the animation is reversed
          setState(() {});
        }
      });

    _offset = Tween<Offset>(
            begin: const Offset(0.0, 0.0), end: const Offset(0.0, 0.0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

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
    print(
        "current index is $currentCardIndex, length is ${widget.parentTool.toolCards!.length}");
    setState(() {
      _offset = Tween<Offset>(
              begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0))
          .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
      //_controller.forward();

      if (currentCardIndex <= toolChildren.length) {
        print("card hasn't hit limit");
        currentCardIndex += 1;
      }
      if (currentCardIndex == (toolChildren.length)) {
        print("card has hit limit");
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  navigationContainer(widget.parentTool).summary!),
        );
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
                value: summaryListView.isNotEmpty == true
                    ? (currentCardIndex / widget.parentTool.toolCards!.length)
                    : 0.1,
              ),
            ))));

    var carouselLayout = ContainerWrapperElement(
      children: [
        PageHeaderElement.withExit(
            pageTitle: widget.parentTool.toolName,
            onPageExit: () => {Navigator.pop(context)}),
        const SizedBox(height: 10.0),
        const Spacer(),
        activeCardItem,
        const Spacer(),
        const SizedBox(height: 10.0),
        progressBar
      ],
      containerVariant: wrapperVariants.fullScreen,
      takesFullWidth: false,
    );

    return ContainerView(
      decorationVariant: decorationPriority.important,
      builder: carouselLayout,
      takesFullWidth: false,
    );
  }
}
