import 'package:flutter/cupertino.dart';

//A blank card that looks like a "pane" of glass
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/4%20-%20Elements%20(Materials)/Cards/Glass%20Cards.md

class GlassCardElement extends StatelessWidget {
  BoxDecoration _createBoxDecoration(List<Color> colorsArray) {
    return BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(27),
      ),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: colorsArray,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            //the "card" for the border
            child: Container(
              height: 192,
              width: 189,
              decoration: _createBoxDecoration([
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(255, 255, 255, 0.17),
              ]),
            ),
          ),
          Positioned(
            //the "card" for the inner
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                  height: 190,
                  width: 187,
                  decoration: _createBoxDecoration([
                    Color.fromRGBO(255, 255, 255, 0.15),
                    Color.fromRGBO(255, 255, 255, 0),
                  ])),
            ),
          ),
        ],
      ),
    );
  }
}
