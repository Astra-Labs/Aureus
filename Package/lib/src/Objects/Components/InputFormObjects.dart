import 'package:aureus/aureus.dart';

class BaseUserInputObject {
  final String placeholder;
  final String accessibilityHint;
  final TextInputType textInputType;
  final userInputType dataTypeInputVariance;
  final TextEditingController textEditingController;

  const BaseUserInputObject(
      {required this.placeholder,
      required this.accessibilityHint,
      required this.textInputType,
      required this.dataTypeInputVariance,
      required this.textEditingController})
      : assert(placeholder != ''),
        assert(accessibilityHint != '');
}

class SingleUserInputTypeObject extends BaseUserInputObject {
  userInputType typeVariance = userInputType.singleDataType;

  SingleUserInputTypeObject(placeholder, accessibilityHint, textInputType,
      typeVariance, textEditingController)
      : super(
            placeholder: placeholder,
            accessibilityHint: accessibilityHint,
            textInputType: textInputType,
            dataTypeInputVariance: typeVariance,
            textEditingController: textEditingController);
}

class MultiUserInputTypeObject extends BaseUserInputObject {
  final String dataLabel;

  const MultiUserInputTypeObject(
      {required this.dataLabel,
      required placeholder,
      required accessibilityHint,
      required textInputType,
      required textEditingController})
      : assert(dataLabel != ''),
        super(
            placeholder: placeholder,
            accessibilityHint: accessibilityHint,
            textInputType: textInputType,
            dataTypeInputVariance: userInputType.multiDataType,
            textEditingController: textEditingController);
}

class LongInputFormGroupingObject {
  final String sectionHeader;
  final userInputType typeVariance;
  final List<BaseUserInputObject> inputObjects;

  const LongInputFormGroupingObject(
      {required this.sectionHeader,
      required this.typeVariance,
      required this.inputObjects})
      : assert(sectionHeader != ''),
        assert(inputObjects.length >= 2);
}
