import 'package:aureus/aureus.dart';
import 'package:aureus/src/Widgets/Components/Input%20Forms/TextFieldComponent.dart';

//A text input and search button that constitutes a search bar
//Doc Link:

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
    return Container(
        constraints: BoxConstraints(
            minWidth: size.widthOf(weight: sizingWeight.w3),
            maxWidth: size.widthOf(weight: sizingWeight.w7),
            minHeight: size.heightOf(weight: sizingWeight.w0),
            maxHeight: size.widthOf(weight: sizingWeight.w3)),
        decoration: InputBackingDecoration().buildBacking(),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: PrimaryTextFieldComponent(
                    decorationVariant: decorationPriority.standard,
                    hintText: 'Search here.',
                    textFieldController: searchBarController),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SecondaryIconButtonElement(
                    buttonIcon: Icons.search,
                    buttonAction: widget.onSearch,
                    buttonTooltip: 'Search Button',
                    decorationVariant: decorationPriority.important),
              )
            ]));
  }
}
