import 'package:aureus/aureus.dart';
import 'package:aureus/src/Widgets/Elements/Cards/ComplexSwitchCardComponent.dart';

//
//Doc Link:

class DataOptInView extends StatefulWidget {
  final List<DataPermissionObject> permissionItems;

  const DataOptInView({required this.permissionItems});

  @override
  _DataOptInViewState createState() => _DataOptInViewState();
}

class _DataOptInViewState extends State<DataOptInView> {
  @override
  Widget build(BuildContext context) {
    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.stackScroll,
      children: [
        HeadingTwoText('Data opt in', decorationPriority.standard),
        BodyTwoText(
            'Your consent is important to us. Please review the permissions below that we want to have access to.',
            decorationPriority.standard),
        ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: widget.permissionItems.length,
            itemBuilder: (BuildContext context, int index) {
              var currentItem = widget.permissionItems[index];

              return Padding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: ComplexSwitchCardElement(
                    cardLabel: currentItem.permissionName,
                    cardBody: currentItem.permissionDescription,
                    cardIcon: currentItem.permissionIcon),
              );
            }),
        Align(
          alignment: Alignment.bottomRight,
          child: PrimaryIconButtonElement(
              decorationVariant: decorationPriority.important,
              buttonIcon: Icons.navigate_next_outlined,
              buttonTooltip: 'Go to next page',
              buttonAction: () => {print("go to next!")}),
        )
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
