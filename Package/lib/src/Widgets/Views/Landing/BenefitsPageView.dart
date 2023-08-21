import 'dart:async';
import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- BENEFITS VIEW ----------*/
///

class BenefitsPageView extends StatefulWidget {
  final Map<IconData, String> benefits;

  const BenefitsPageView({
    required this.benefits,
  });

  @override
  _BenefitsPageViewState createState() => _BenefitsPageViewState();
}

class _BenefitsPageViewState extends State<BenefitsPageView> {
  var benefitCards = [];

  Widget benefitCard(String title, IconData icon) {
    return CategoryIconDetailCardElement(
      decorationVariant: decorationPriority.standard,
      cardLabel: title,
      cardBody: "",
      cardIcon: icon,
    );
  }

  @override
  void initState() {
    widget.benefits.forEach((title, icon) {
      benefitCards.add(benefitCard(icon, title));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [],
    );

    return ContainerView(
      decorationVariant: decorationPriority.important,
      builder: viewLayout,
      showQuickActionBar: false,
    );
  }
}
