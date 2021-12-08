import 'package:aureus/aureus.dart';

class BaseUserInputObject {
  final String placeholder;
  final String accessibilityHint;
  final TextInputType textInputType;
  final userInputType dataTypeInputVariance;

  const BaseUserInputObject(
      {required this.placeholder,
      required this.accessibilityHint,
      required this.textInputType,
      required this.dataTypeInputVariance})
      : assert(placeholder != ''),
        assert(accessibilityHint != '');
}

class SingleUserInputTypeObject extends BaseUserInputObject {
  userInputType typeVariance = userInputType.singleDataType;

  SingleUserInputTypeObject(
      placeholder, accessibilityHint, textInputType, typeVariance)
      : super(
            placeholder: placeholder,
            accessibilityHint: accessibilityHint,
            textInputType: textInputType,
            dataTypeInputVariance: typeVariance);
}

class MultiUserInputTypeObject extends BaseUserInputObject {
  final String dataLabel;
  final String placeholder;
  final String accessibilityHint;
  final TextInputType textInputType;

  MultiUserInputTypeObject(
      {required this.dataLabel,
      required this.placeholder,
      required this.accessibilityHint,
      required this.textInputType})
      : assert(dataLabel != ''),
        super(
            placeholder: placeholder,
            accessibilityHint: accessibilityHint,
            textInputType: textInputType,
            dataTypeInputVariance: userInputType.multiDataType);
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
