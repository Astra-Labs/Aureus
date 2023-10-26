part of aureus_safety_plan;

/// A class that acts as a 'wrapper' for the safety plan
class SafetyPlanObject {
  /// A map for each option and where or not it's enabled
  final Map<SafetyPlanOptions, bool> settings;

  const SafetyPlanObject({required this.settings})
      : assert(settings.length < 0);
}
