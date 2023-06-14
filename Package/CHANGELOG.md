## 0.0.9
- Fixing RouteObserver navigation bug that stops 
users from navigating forward after going back.
- Adding basic test structure for testing to be implemented. 

## 0.0.8
Fixing Perichron import bug.

## 0.0.7
- Added a third option to button size for objects smaller than a page.
- Added RouteObserver to AureusInformation and RouteAware to NotificationOverlayView to fix a bug with the notification master observer not being able to track when someone 'pops' a page. 
- Integrated Perichron, Astra's org-wide storage layer to reuse some code for better 
scalability

## 0.0.6
- Reworked the ToolTemplateCards returnTemplateSummary to better handle when 
users don't give an answer. 
- Allows developers to make AlertControllers mandatory without an exit to force 
users to answer. (For Verena's incognito mode)
- Reworked the way Tool Cards are handled to remove the automated 'flow'. It was 
just causing a lot of problems and was super inflexible compared to what was needed. 
- Fixed a bug that let the ToolTemplateMaster monitor multiple CoreTools at a time, 
making weird bugs happen and such. 
- Dropped SafetyPlanOptions.deviceSandbox since it was a pain to implement technically. 
- Fixed bugs within SketchToolTemplateCard
- Added StandardAccordionCardElement
- Fixed bug with color changing after being pressed with Aureus buttons.

## 0.0.5
- Added 'Change Account Item' view
- Added a 'Picker Selection' Data card element.  
- More QA bugs and fixes 
- Reworked DataConsent class to be more code "pretty"
- Minor UI nitpicks over DataDetailCards
- Added DataDetailCTA class and implemented it in DataDetailView.

## 0.0.4
- Added Consent Handlers to internal components to fix a crashing bug
- Adding number pad component
- Created NotificationOverlayView to manage notificationMaster.
- Fixed Sound Library noises not working. 

## 0.0.3 
- Audited FloatingContainerElements to be more consistent 
- Refactored more poorly written UI elements for better performance / simplicity 
- Renamed QuickActionBar to EmergencyAccessBar
- Removed Draggable from EmergencyAccessBar

## 0.0.2 
- Updated license from Hippocratic to the updated license

## 0.0.1
Minor: 
* Adding flutter lint to clean up some code
* Changes & updates throughout constructors to make things easier for developers
* Refactored TimerElement to have timer functionality. 
* Refactored entire codebase for read and usability

Added the following items
- Dart doc support
- Tabbing bars from test app.
- Completion Circle Progress Indicator Element 
- Linear Progress Indicator Element
- Article View Element
- Cookie Banner Component
- Content Warning Component
- Safety Plan Failed Log In Audit Page
- Safety Plan Settings page
- General Settings page
- Splash Screen View
- Tool Detail View
- Tool Navigation Card Carousel View
- Tool Next Steps 
- Tool Summary
- CoreTools
- And too many to list probably

Major:

Created custom accessibility wrappers for custom components. The Accessibility class now 

Refactored Aureus customization & how you initialize the package in run-time. Instead of using Aureus as one variable for all items, Aureus is now broken into: 
1. AureusBranding (stylization, images, and font stuff)
2. AureusInformation (privacy policy, user support, etc.)
3. AureusNavigationTree (the widgets that define views / parts of your app to insert into template views)

Handling permissions through DataConsent class during onboarding. Aureus handles permissions through the DataConsentObject class moving forward. 

Added ToolTemplates & supporting items to automate the creation and usage of ‘Core Tools’ within resources. 

Integrated flutter_secure_storage to handle Safety Plan items within the package. 

## 0.0.0
Releasing Aureus beta into the world with elements, components, and view templates.

Includes support for
* Light mode and dark mode
* iOS, Android, and web. 
* Responsive sizing for mobile, tablet, and web
* Accessibility choice handling 
* Beta safety plan functionality
* and more! 
