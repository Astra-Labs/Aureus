## 0.0.1
Minor: 
* Adding flutter lint to clean up some code
* Changes & updates throughout constructors to make things easier for developers
* Refactored TimerElement to have timer functionality. 

Added the following items
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
