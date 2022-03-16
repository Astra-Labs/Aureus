import 'package:aureus/aureus.dart';

// Shows a content warning with a blur over the content behind the item.

class ContentWarningComponent extends StatelessWidget {
  final String warningDescription;
  final Widget entryPoint;

  const ContentWarningComponent(
      {required this.warningDescription, required this.entryPoint});

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    var warningLayout = FloatingContainerElement(
      child: Container(
        constraints: BoxConstraints(
            minHeight: screenSize.height,
            maxHeight: screenSize.height,
            minWidth: screenSize.width,
            maxWidth: screenSize.width),
        decoration:
            LayerBackingDecoration(priority: decorationPriority.inactive)
                .buildBacking(),
        child: Center(
          child: Container(
              constraints: BoxConstraints(
                  minHeight: size.layoutItemHeight(1, screenSize) * 0.7,
                  maxHeight: size.layoutItemHeight(1, screenSize) * 0.7,
                  minWidth: size.layoutItemWidth(1, screenSize),
                  maxWidth: size.layoutItemWidth(1, screenSize)),
              decoration:
                  LayerBackingDecoration(priority: decorationPriority.inactive)
                      .buildBacking(),
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Spacer(),
                      const IconBadge(
                          badgeIcon: Assets.alertmessage,
                          badgePriority: decorationPriority.important),
                      const SizedBox(height: 15.0),
                      HeadingThreeText(
                          "Content Warning", decorationPriority.standard),
                      const SizedBox(height: 15.0),
                      BodyOneText(
                          warningDescription, decorationPriority.standard),
                      const Spacer(),
                      StandardIconButtonElement(
                          decorationVariant: decorationPriority.standard,
                          buttonTitle: 'Continue',
                          buttonIcon: Assets.next,
                          buttonAction: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => entryPoint,
                                    ))
                              }),
                      const SizedBox(height: 15.0),
                      StandardIconButtonElement(
                          decorationVariant: decorationPriority.standard,
                          buttonTitle: 'Go back',
                          buttonIcon: Assets.no,
                          buttonAction: () => {Navigator.pop(context)}),
                      const Spacer()
                    ]),
              )),
        ),
      ),
    );

    return ContainerView(
        decorationVariant: decorationPriority.important,
        takesFullWidth: true,
        builder: ContainerWrapperElement(
          takesFullWidth: true,
          containerVariant: wrapperVariants.fullScreen,
          children: [warningLayout],
        ));
  }
}
