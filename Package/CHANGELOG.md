## 0.0.4
- Added Consent Handlers to internal components to fix a crashing bug
- Adding number pad 

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
