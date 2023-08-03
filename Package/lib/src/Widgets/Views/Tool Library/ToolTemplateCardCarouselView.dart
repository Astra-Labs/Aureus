// ignore_for_file: must_be_immutable

import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- TOOL TEMPLATE CARD CAROUSEL VIEW ----------*/
/// A view that manages and displays any Tool Templates from a [CoreTool]

class ToolTemplateCardCarouselView extends StatefulWidget {
  /// The tool that contains the data to be used in this template.
  final CoreTool parentTool;

  /// What you want to do when the user finishes the tool cards.
  final VoidCallback onFinish;

  /// Custom cards that are separate from the [parentTool]'s cards. This parameter
  /// overrides and will be shown over any parentTool cards.
  List<ToolCardTemplate>? customCards;

  ToolTemplateCardCarouselView({
    required this.parentTool,
    required this.onFinish,
    this.customCards,
  })  : assert(
            parentTool.toolCards!.isNotEmpty == true ||
                customCards?.isNotEmpty == true,
            'ToolTemplateCardCarouselView requires the parent CoreTool to have tool cards in the navigation container, or to pass cards through the constructor.'),
        super();

  @override
  _ToolTemplateCardCarouselViewState createState() =>
      _ToolTemplateCardCarouselViewState();
}

class _ToolTemplateCardCarouselViewState
    extends State<ToolTemplateCardCarouselView>
    with AureusToolTemplateObserver, TickerProviderStateMixin {
  List<ToolCardTemplate> toolChildren = [];
  bool _visible = false;

  //the index current card being shown
  int currentCardIndex = 0;

  @override
  void initState() {
    toolTemplateMaster.registerObserver(this);

    toolChildren = widget.customCards == null
        ? widget.parentTool.toolCards!
        : widget.customCards!;

    _visible = true;

    super.initState();
  }

  @override
  void dispose() {
    toolTemplateMaster.unregisterObserver(this);
    super.dispose();
  }

  //implementation of Aureus Tool Template observer patterns
  @override
  void nextAction() {
    setState(() {
      if (currentCardIndex < toolChildren.length) {
        _visible = false;

        if (currentCardIndex == (toolChildren.length - 1)) {
          toolTemplateMaster.resetObservers();
          widget.onFinish();
        } else {
          currentCardIndex += 1;
          _visible = true;
        }
      }
    });
  }

  //implementation of Aureus Tool Template observer patterns
  @override
  void previousAction() {
    setState(() {
      _visible = false;
      if (currentCardIndex != 0) {
        currentCardIndex -= 1;
        _visible = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //the current, visible active card.
    Widget activeCardItem = Container();

    var screenSize = MediaQuery.of(context).size;

    for (var element in toolChildren) {
      if (toolChildren.indexOf(element) == currentCardIndex) {
        activeCardItem = element.returnActiveToolCard();
      }
    }

    var progressBar = FloatingContainerElement(
        child: Container(
            width: screenSize.width,
            decoration: LayerBackingDecoration(
                    decorationVariant: decorationPriority.inactive)
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
          width: size.layoutItemWidth(1, MediaQuery.of(context).size),
          height: size.layoutItemHeight(1, MediaQuery.of(context).size),
          child: Column(
            children: [
              PageHeaderElement.withExit(
                  pageTitle: widget.parentTool.toolName,
                  onPageExit: () => {
                        Navigator.pop(context),
                      }),
              const Spacer(),
              AnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: activeCardItem),
              const Spacer(),
              progressBar,
              const SizedBox(height: 10.0)
            ],
          ),
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
