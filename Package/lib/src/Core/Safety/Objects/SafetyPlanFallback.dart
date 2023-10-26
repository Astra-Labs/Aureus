part of aureus_safety_plan;

/// A class that creates a 'fallback'. This is what you give to the Safety Plan
/// to execute code on your behalf, depending on the user's safety settings.
class SafetyPlanFallback {
  /// Describes what option you may be 'violating'
  final SafetyPlanOptions safetyOption;

  /// How you want to handle that violation
  final SafetyFallBackOptions fallbackOption;

  /// If you want to use the alternate code error option, this is
  /// the code that will alternatively be run.
  final VoidCallback? fallbackCode;

  const SafetyPlanFallback(this.safetyOption, this.fallbackOption,
      [this.fallbackCode])
      : assert(fallbackOption == SafetyFallBackOptions.alternateCode ||
            fallbackOption == SafetyFallBackOptions.errorController);
}
