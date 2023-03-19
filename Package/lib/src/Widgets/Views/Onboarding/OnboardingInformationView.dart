import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- ONBOARDING INFORMATION VIEW ----------*/
/// A view that shows an iterating component of [OnboardingDetail]s to give
/// the user information about the resource before signing up. This is where you
/// want to discuss features and cool things about your resources.

class OnboardingInformationView extends StatefulWidget {
  /// A list that contains Onboarding details to display information about
  /// the resource to the user.
  final List<OnboardingDetail> onboardingDetails;

  const OnboardingInformationView({required this.onboardingDetails});

  @override
  _OnboardingInformationViewState createState() =>
      _OnboardingInformationViewState();
}

class _OnboardingInformationViewState extends State<OnboardingInformationView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _selectedIndex = 0;
    var screenSize = size.logicalScreenSize();

    var currentItem = widget.onboardingDetails[_selectedIndex];

    Widget mobileInformationCard = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              constraints: BoxConstraints(
                  maxHeight: size.layoutItemHeight(2, screenSize)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: palette.universalBorder(),
                  image: DecorationImage(
                    image: currentItem.detailImage.image,
                    fit: BoxFit.cover,
                  ))),
          const SizedBox(height: 20),
          TagOneText(currentItem.detailTitle, decorationPriority.standard),
          const SizedBox(height: 10),
          BodyOneText(currentItem.detailBody, decorationPriority.standard),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButtonElement(
                decorationVariant: (_selectedIndex == 0)
                    ? decorationPriority.inactive
                    : decorationPriority.important,
                buttonIcon: Assets.back,
                buttonHint: 'Previous Item',
                buttonAction: () => {_onItemTapped(_selectedIndex -= 1)},
                buttonPriority: buttonSize.secondary,
              ),
              IconButtonElement(
                  decorationVariant:
                      (_selectedIndex > (widget.onboardingDetails.length - 2))
                          ? decorationPriority.inactive
                          : decorationPriority.important,
                  buttonIcon: Assets.next,
                  buttonHint: 'Next Item',
                  buttonAction: () => {_onItemTapped(_selectedIndex += 1)},
                  buttonPriority: buttonSize.secondary)
            ],
          )
        ]);

    Widget webInformationCard = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
                constraints: BoxConstraints(
                  maxWidth: size.layoutItemWidth(2, screenSize) * 0.7,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: palette.universalBorder(),
                    image: DecorationImage(
                      image: currentItem.detailImage.image,
                      fit: BoxFit.cover,
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: size.layoutItemWidth(2, screenSize),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(),
                  TagOneText(
                      currentItem.detailTitle, decorationPriority.standard),
                  BodyOneText(
                      currentItem.detailBody, decorationPriority.standard),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButtonElement(
                        decorationVariant: (_selectedIndex == 0)
                            ? decorationPriority.inactive
                            : decorationPriority.important,
                        buttonIcon: Assets.back,
                        buttonHint: 'Previous Item',
                        buttonAction: () => {
                          _onItemTapped(_selectedIndex -= 1),
                        },
                        buttonPriority: buttonSize.secondary,
                      ),
                      IconButtonElement(
                        decorationVariant: (_selectedIndex >
                                (widget.onboardingDetails.length - 2))
                            ? decorationPriority.inactive
                            : decorationPriority.important,
                        buttonIcon: Assets.next,
                        buttonHint: 'Next Item',
                        buttonAction: () => {
                          _onItemTapped(_selectedIndex += 1),
                        },
                        buttonPriority: buttonSize.secondary,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ]);

    Widget informationCard = FloatingContainerElement(
      child: Container(
          padding: EdgeInsets.all(size.widthOf(weight: sizingWeight.w0) / 2),
          decoration: CardBackingDecoration(
                  decorationVariant: decorationPriority.inactive)
              .buildBacking(),
          child: size.isDesktopDisplay()
              ? webInformationCard
              : mobileInformationCard),
    );

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.stackScroll,
      children: [
        Align(
            alignment: Alignment.topRight,
            child: IconButtonElement(
              decorationVariant: decorationPriority.standard,
              buttonIcon: Assets.no,
              buttonHint: 'Return to onboarding landing',
              buttonAction: () => {Navigator.pop(context)},
              buttonPriority: buttonSize.secondary,
            )),
        HeadingOneText(
            "Meet ${resourceValues.name}.", decorationPriority.standard),
        informationCard,
      ],
    );

    return ContainerView(
      decorationVariant: decorationPriority.important,
      builder: viewLayout,
      showQuickActionBar: false,
    );
  }
}
