import 'package:aureus/aureus.dart';
import 'package:flutter/scheduler.dart';

final titleCase = TitleCase();
final coloration = Coloration();
final size = Sizing();
late Aureus apiVariables;

// Returns the given 'mode' (light or dark) for the device that Aureus is running on.
Brightness brightness() {
  return SchedulerBinding.instance!.window.platformBrightness;
}

/* ------------------ GLOBAL VARIABLES -------------------- */

/* 

The Aureus class contains custom variables that are used throughout the rest of the 
UI items to customize them to the given project. It's initalized with fallback variables
if the developer forgets to implement. 

This is also where you set the Safety Object that governs what settings your users choose
for their safety plan (if they opt in). 

*/

class Aureus {
  Color prodColor = lavender();
  String prodName = 'Aureus';
  String missionTagline = 'Lorem ipsum dolor sit amet';
  Safety safetyObject = Safety(
      frequencyUsage: SafetyPlanFrequency.singleUse, eligiblePlanOptions: []);
  Image? darkFluidImage = Image.network(
      'https://github.com/Astra-Labs/Aureus/blob/Amanda-Stable/Package/lib/assets/Dark%20Fluid%20-%20Portrait.png?raw=true');
  Image? lightFluidImage = Image.network(
      'https://github.com/Astra-Labs/Aureus/blob/Amanda-Stable/Package/lib/assets/Light%20Fluid%20-%20Portrait.png?raw=true');
  Image? darkBlurImage = Image.network(
      'https://github.com/Astra-Labs/Aureus/blob/Amanda-Stable/Package/lib/assets/Dark%20Blur%20-%20Portrait.png?raw=true');
  Image? lightBlurImage = Image.network(
      'https://github.com/Astra-Labs/Aureus/blob/Amanda-Stable/Package/lib/assets/Light%20Blur%20-%20Portrait.png?raw=true');
  Image? lightLogo = Image.network(
      'https://github.com/Astra-Labs/Aureus/blob/Amanda-Stable/Package/lib/assets/Icon%20-%20Dark%20Mode.png?raw=true');
  Image? darkLogo = Image.network(
      'https://github.com/Astra-Labs/Aureus/blob/Amanda-Stable/Package/lib/assets/Icon%20-%20Light%20Mode.png?raw=true');

  Aureus(
      {required this.prodColor,
      required this.prodName,
      required this.missionTagline,
      required this.safetyObject,
      required this.darkFluidImage,
      this.lightFluidImage,
      this.darkBlurImage,
      this.lightBlurImage,
      this.lightLogo,
      this.darkLogo});
}
