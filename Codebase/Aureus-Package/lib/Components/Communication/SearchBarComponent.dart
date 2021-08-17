import 'package:flutter/cupertino.dart';
import 'package:aureus/foundation.dart';
import 'package:flutter/material.dart';

//A text input and search button that constitutes a search bar
//Doc Link:

class SearchBarComponent extends StatefulWidget {
  final VoidCallback onSearch;

  const SearchBarComponent({required this.onSearch});

  @override
  _SearchBarComponentState createState() => _SearchBarComponentState();
}

class _SearchBarComponentState extends State<SearchBarComponent> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 585 / 73,
        child: Container(
            width: 585,
            height: 73,
            child: Row(children: [
              Container(
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: foundation.steel(), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: foundation.ice(),
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintStyle: foundation.body1(),
                            hintText: 'Search here.'),
                        autocorrect: false,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text),
                  ))),
              Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: foundation.mediumGradient()),
                  width: 73.0,
                  height: 73.0,
                  child: Expanded(
                      child: IconButton(
                          icon: Image.asset(''),
                          iconSize: 50,
                          color: foundation.black(),
                          tooltip: 'Search Button',
                          onPressed: widget.onSearch)))
            ])));
  }
}
