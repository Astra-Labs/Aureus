import 'package:aureus/aureus.dart';

/// {@category Objects}
/// {@image <image alt='' src=''>}

/// Description:
/// The top level class that contains all of the onboarding detail objects
///
/// Details:
/// -A minimum of 2 onboarding details are required to build an onboarding object.

class OnboardingObject {
  /// Items that hold information / photos for the user to experience on log-in
  final List<OnboardingDetail> onboardingItems;

  const OnboardingObject({required this.onboardingItems})
      : assert(onboardingItems.length >= 2);
}

/// Description:
/// An object that contains information to be shown in a category as a user is tabbing through the onboarding view.
///
/// Details:
/// -All variables are required to be passed as non-null in the constructor.

class OnboardingDetail {
  /// The title of your detail
  final String detailTitle;

  /// The body of the detail that provides a short pitch about it.
  final String detailBody;

  /// The image related to the detail.
  final Image detailImage;

  /// The icon related to the category.
  final IconData detailCategoryIcon;

  const OnboardingDetail(
      {required this.detailTitle,
      required this.detailBody,
      required this.detailImage,
      required this.detailCategoryIcon})
      : assert(detailTitle != ''),
        assert(detailBody != '');
}
