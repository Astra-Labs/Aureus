library AureusTestingApp;

// IMPORTS <- (owo)
import 'package:aureus/aureus.dart';
import 'package:url_launcher/url_launcher.dart';

// EXPORTS (owo) ->
export 'package:aureus/aureus.dart';

// CORE -------------------------

//  ------------------------- COMPONENTS
part 'src/Core/Components/ComponentsList.dart';
part 'src/Core/Components/ComponentsView.dart';

//  ------------------------- ELEMENTS
part 'src/Core/Elements/ElementsList.dart';
part 'src/Core/Elements/ElementsView.dart';

//  ------------------------- INTERACTIONS
part 'src/Core/Interactions/InteractionsList.dart';
part 'src/Core/Interactions/InteractionsView.dart';

//  ------------------------- TOOLS
part 'src/Core/Tools/ToolsList.dart';
part 'src/Core/Tools/ToolsView.dart';

//  ------------------------- VIEWS
part 'src/Core/Views/ViewsList.dart';
part 'src/Core/Views/ViewsView.dart';

//  ------------------------- LANDING
part 'src/Core/Landing/HomeNavigation.dart';
part 'src/Core/Landing/LandingPageView.dart';
part 'src/Core/Landing/Resource Generation/GenerationTool.dart';
part 'src/Core/Landing/Resource Generation/GenerationLandingView.dart';

// SUPPORTING -------------------------
part 'src/Supporting/ViewSupportingObjects.dart';
part 'src/Supporting/FillerData.dart';
part 'src/Supporting/IteratingViewComponent.dart';
