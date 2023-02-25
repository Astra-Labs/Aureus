import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- DATA OPT-IN VIEW ----------*/
/// This view requests permissions from the user,
/// you set what permissions you want in your [AureusInformation]
/// object of the [packageVariables] for your application.

class DataOptInView extends StatefulWidget {
  /// What you want to happen once the user clicks the next button
  /// on the bottom of the page.
  final VoidCallback onFinish;

  const DataOptInView({required this.onFinish});

  @override
  _DataOptInViewState createState() => _DataOptInViewState();
}

class _DataOptInViewState extends State<DataOptInView> {
  @override
  Widget build(BuildContext context) {
    var permissionItems = resourceValues.dataPermissions;

    var align = Align(
      alignment: Alignment.bottomRight,
      child: IconButtonElement(
        decorationVariant: decorationPriority.important,
        buttonIcon: Assets.next,
        buttonHint: 'Go to next page',
        buttonAction: () => {widget.onFinish()},
        buttonPriority: buttonSize.primary,
      ),
    );

    var listView = ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: permissionItems.length,
        itemBuilder: (BuildContext context, int index) {
          var currentItem = permissionItems[index];

          return Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
            child: ComplexSwitchCardElement(
              cardLabel: currentItem.permissionName,
              cardBody: currentItem.permissionDescription,
              cardIcon: currentItem.permissionIcon,
              onEnable: () => {currentItem.onPermissionOptIn()},
              onDisable: () => {},
            ),
          );
        });

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.stackScroll,
      children: [
        const DividingHeaderElement(
            headerText: 'Data Opt In',
            subheaderText:
                'Your consent is important to us. Please review the permissions below that we would like to have access to.'),
        listView,
        align
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
