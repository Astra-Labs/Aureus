library AureusTestingApp;

// IMPORTS <- (owo)
import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';
import 'package:test_app/main.dart';
import 'package:url_launcher/url_launcher.dart';

// EXPORTS (owo) ->
export 'package:aureus/aureus.dart';
export 'package:flutter/material.dart';
export 'package:url_launcher/url_launcher.dart';

// CORE -------------------------

//  ------------------------- UI COMPS
part 'src/Core/UI Components/Views/ViewsList.dart';
part 'src/Core/UI Components/Views/ViewSubView.dart';
part 'src/Core/UI Components/Elements/ElementsList.dart';
part 'src/Core/UI Components/Elements/ElementsSubView.dart';
part 'src/Core/UI Components/Components/ComponentsList.dart';
part 'src/Core/UI Components/Components/ComponentsSubView.dart';
part 'src/Core/UI Components/UIComponentsView.dart';

//  ------------------------- INTERACTIONS
part 'src/Core/Interactions/Interactions/InteractionsList.dart';
part 'src/Core/Interactions/InteractionsView.dart';
part 'src/Core/Interactions/Sensations/SensationActionsList.dart';
part 'src/Core/Interactions/Actions/ContainerActionsList.dart';

//  ------------------------- DATA DETAIL
part 'src/Core/Data Detail/DataDetailList.dart';
part 'src/Core/Data Detail/DataDetailView.dart';

//  ------------------------- SAFETY
part 'src/Core/Safety/SafetyList.dart';
part 'src/Core/Safety/SafetyView.dart';

//  ------------------------- TOOLS
part 'src/Core/Tools/ToolsList.dart';

//  ------------------------- LANDING
part 'src/Core/Landing/HomeNavigation.dart';
part 'src/Core/Landing/LandingPageView.dart';
part 'src/Core/Landing/Resource Generation/GenerationTool.dart';
part 'src/Core/Landing/Resource Generation/GenerationLandingView.dart';

// SUPPORTING -------------------------
part 'src/Supporting/ViewSupportingObjects.dart';
part 'src/Supporting/FillerData.dart';
part 'src/Supporting/IteratingViewComponent.dart';
