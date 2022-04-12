import 'package:aureus/aureus.dart';

/*--------- LEVEL 0 --------*/
/*

Description: 
The top level class that contains all of the onboarding detail objects

Details:
-A minimum of 2 onboarding details are required to build an onboarding object. 

*/

class OnboardingObject {
  final List<OnboardingDetail> onboardingItems;
  // Items that hold information / photos for the user to experience on log-in
  // ------------------------------

  const OnboardingObject({required this.onboardingItems})
      : assert(onboardingItems.length >= 2);
}

/*--------- LEVEL 1 --------*/
/*

Description: 
An object that contains information to be shown in a category as a user is tabbing through the onboarding view. 

Details:
-All variables are required to be passed as non-null in the constructor. 

*/

class OnboardingDetail {
  final String detailTitle;
  // The title of your detail
  // ------------------------------
  final String detailBody;
  // The body of the detail that provides a short pitch about it.
  // ------------------------------
  final Image detailImage;
  // The image related to the detail.
  // ------------------------------
  final IconData detailCategoryIcon;
  // The icon related to the category.
  // ------------------------------

  const OnboardingDetail(
      {required this.detailTitle,
      required this.detailBody,
      required this.detailImage,
      required this.detailCategoryIcon})
      : assert(detailTitle != ''),
        assert(detailBody != '');
}
