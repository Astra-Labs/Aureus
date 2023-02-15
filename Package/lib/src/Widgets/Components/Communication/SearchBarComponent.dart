import 'package:aureus/aureus.dart';

/*--------- SEARCH BAR COMPONENT ----------*/

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

    const errorOutlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide:
            BorderSide(color: Color.fromRGBO(255, 178, 178, 1.0), width: 1.0));

    var standardOutlineInputBorder = OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
            color: coloration
                .decorationColor(decorationVariant: decorationPriority.standard)
                .withOpacity(0.3),
            width: 1.0));

    var importantOutlineInputBorder = OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: coloration.accentColor(), width: 1.0));

    var searchBarIcon = Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButtonElement(
        buttonIcon: Assets.next,
        buttonAction: widget.onSearch,
        buttonHint: 'Searches for the term you enter.',
        decorationVariant: decorationPriority.standard,
        buttonPriority: buttonSize.secondary,
      ),
    );

    var inputDecoration = InputDecoration(
        fillColor: coloration.contrastColor().withOpacity(0.15),
        filled: true,
        suffixIcon: searchBarIcon,
        border: InputBorder.none,
        focusedBorder: importantOutlineInputBorder,
        enabledBorder: standardOutlineInputBorder,
        errorBorder: errorOutlineInputBorder,
        disabledBorder: InputBorder.none,
        hintStyle: body2()
            .copyWith(color: coloration.contrastColor().withOpacity(0.7)),
        hintText: "Search here");

    var searchBarContainer = SizedBox(
        width: size.layoutItemWidth(1, screenSize),
        height: size.layoutItemHeight(6, screenSize),
        child: FloatingContainerElement(
          child: TextFormField(
              style: body2().copyWith(
                  color: coloration.decorationColor(
                      decorationVariant: decorationPriority.standard)),
              controller: searchBarController,
              decoration: inputDecoration,
              autocorrect: false,
              textAlign: TextAlign.left,
              keyboardType: TextInputType.text),
        ));

    return searchBarContainer;
  }
}
