import 'package:flutter/cupertino.dart';

//A blank card that looks like a "pane" of glass
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/4%20-%20Elements%20(Materials)/Cards/Glass%20Cards.md

class GlassCardElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: 192,
              width: 189,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(27),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(255, 255, 255, 1),
                    Color.fromRGBO(255, 255, 255, 0.17),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                height: 190,
                width: 187,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.15),
                      Color.fromRGBO(255, 255, 255, 0),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(27),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
