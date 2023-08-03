import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- STANDARD ACCORDION CARD ----------*/
/// A standard card that contains hidden children that can be 'expanded' out

// ignore: must_be_immutable
class StandardAccordionCardElement extends StatefulWidget {
  /// The text for the main header of the card.
  final String cardLabel;

  /// The icon for the card
  final IconData cardBadge;

  /// The accordion children, to be shown when fully expanded.
  final List<Widget> cardChildren;

  const StandardAccordionCardElement({
    required this.cardLabel,
    required this.cardBadge,
    required this.cardChildren,
  });

  @override
  _StandardAccordionCardElementState createState() =>
      _StandardAccordionCardElementState();
}

class _StandardAccordionCardElementState
    extends State<StandardAccordionCardElement> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onItemTapped() {
    setState(() {
      if (isExpanded == false) {
        isExpanded = true;
      } else if (isExpanded == true) {
        isExpanded = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    var unexpandedChild = Row(
      children: [
        TagTwoText(widget.cardLabel, decorationPriority.standard),
        const Spacer(),
        IconBadge(
            badgeIcon: widget.cardBadge,
            badgePriority: decorationPriority.standard)
      ],
    );

    var expandedChild = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            TagTwoText(widget.cardLabel, decorationPriority.standard),
            const Spacer(),
            IconBadge(
                badgeIcon: widget.cardBadge,
                badgePriority: decorationPriority.standard)
          ],
        ),
        const SizedBox(height: 5.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.layoutItemWidth(1, screenSize),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.spaceEvenly,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  spacing: 10,
                  runSpacing: 15,
                  children: widget.cardChildren,
                ),
              ),
            ),
          ],
        ),
      ],
    );

    var accordionCard = FloatingContainerElement(
      child: Container(
        width: size.layoutItemWidth(1, screenSize),
        decoration: CardBackingDecoration(
                decorationVariant: decorationPriority.standard)
            .buildBacking(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
            child: AnimatedCrossFade(
              firstChild: unexpandedChild,
              secondChild: expandedChild,
              crossFadeState: isExpanded == false
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(seconds: 1),
            ),
          ),
        ),
      ),
    );

    return GestureDetector(onTap: _onItemTapped, child: accordionCard);
  }
}
