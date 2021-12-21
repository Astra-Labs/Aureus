import 'package:aureus/aureus.dart';

class DetailCardObject {
  String cardLabel;
  IconData cardIcon;
  VoidCallback cardAction;

  DetailCardObject(
      {required this.cardLabel,
      required this.cardIcon,
      required this.cardAction});
}

class StandardCardObject {
  String cardLabel;
  VoidCallback cardAction;

  StandardCardObject({required this.cardLabel, required this.cardAction});
}

class BadgeCardObject {
  String cardLabel;
  IconData cardIcon;
  VoidCallback cardAction;

  BadgeCardObject(
      {required this.cardLabel,
      required this.cardIcon,
      required this.cardAction});
}

class InformationDetailCardObject {
  String cardLabel;
  String cardBody;
  VoidCallback cardAction;

  InformationDetailCardObject(
      {required this.cardLabel,
      required this.cardBody,
      required this.cardAction});
}
