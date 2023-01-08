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

    return SizedBox(
        width: size.layoutItemWidth(1, screenSize),
        height: size.layoutItemHeight(6, screenSize),
        child: FloatingContainerElement(
          child: TextFormField(
              style: body2().copyWith(
                  color: coloration.decorationColor(
                      decorationVariant: decorationPriority.standard)),
              controller: searchBarController,
              decoration: InputDecoration(
                  fillColor: coloration.contrastColor().withOpacity(0.15),
                  filled: true,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButtonElement(
                      buttonIcon: Assets.next,
                      buttonAction: widget.onSearch,
                      buttonHint: 'Searches for the term you enter.',
                      decorationVariant: decorationPriority.standard,
                      buttonPriority: buttonSize.secondary,
                    ),
                  ),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: coloration.accentColor(), width: 1.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: coloration
                              .decorationColor(
                                  decorationVariant:
                                      decorationPriority.standard)
                              .withOpacity(0.3),
                          width: 1.0)),
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(255, 178, 178, 1.0),
                          width: 1.0)),
                  disabledBorder: InputBorder.none,
                  hintStyle: body2().copyWith(
                      color: coloration.contrastColor().withOpacity(0.7)),
                  hintText: "Search here"),
              autocorrect: false,
              textAlign: TextAlign.left,
              keyboardType: TextInputType.text),
        ));
  }
}
