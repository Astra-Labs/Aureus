import 'dart:async';
import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- SPLASH SCREEN VIEW ----------*/
/// A templatized splash screen view. This is the first view your users should
/// see, and where you should run any downloading / onboarding logic checks.

class BenefitsPageView extends StatefulWidget {
  /// A function that the splash screen should run after the animation has completed.
  /// This should be where you navigate to the next page, and do any logic in determing
  /// if the user has completed the onboarding process or not.
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
