import 'package:aureus/aureus.dart';

class SearchBarComponent extends StatefulWidget {
  final VoidCallback onSearch;

  const SearchBarComponent({required this.onSearch});

  @override
  _SearchBarComponentState createState() => _SearchBarComponentState();
}

class _SearchBarComponentState extends State<SearchBarComponent> {
  TextEditingController searchBarController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    return Container(
      constraints: BoxConstraints(
          minHeight: size.layoutItemHeight(6, screenSize),
          maxHeight: size.layoutItemHeight(5, screenSize),
          maxWidth: size.layoutItemWidth(1, screenSize)),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                width: size.layoutItemWidth(1, screenSize) * 0.75,
                child: SingleDataTypeUserInputElement(
                    dataPlaceholder: 'Search here.')),
            const Spacer(),
            SecondaryIconButtonElement(
                buttonIcon: Assets.next,
                buttonAction: widget.onSearch,
                buttonHint: 'Searches for the term you enter.',
                decorationVariant: decorationPriority.important)
          ]),
    );
  }
}
