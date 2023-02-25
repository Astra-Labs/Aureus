# Aureus
#### (In beta) open-source design system library for user safety critical applications.

[![Hippocratic License HL3-CL-ECO-EXTR-FFD-MEDIA-MIL-SOC-SV](https://img.shields.io/static/v1?label=Hippocratic%20License&message=HL3-CL-ECO-EXTR-FFD-MEDIA-MIL-SOC-SV&labelColor=5e2751&color=bc8c3d)](https://firstdonoharm.dev/version/3/0/cl-eco-extr-ffd-media-mil-soc-sv.html)

Meet Aureus, a privacy, accessibility, and safety-focused design system built in Flutter for non-profit software development. 

Originally developed for internal use at Astra Labs, Aureus is designed to quickly build quality software that serves vulnerable communities. In our years of developing at Astra, we've run into crucial problems designing for specifically at-risk populations.

When you're working in tough / crisis situations, a lot of industry design patterns do not truly take into account the fragility and level of caution required. Our goal is to help build some insight into how our resources work, and to hopefully be a good example of scalable, high-impact, and ethical software.

---------------------

### For our future, today. 
* Developed specifically for resource constrained non-profits and beginner developers, we made building an app with Aureus as easy as possible so you can build your own software, and your own movements.

### Reach everyone, everywhere. 
* Utilizing the scale of Flutter allows for Aureus Resources to be used on web, mobile, tablets, desktop, and more. For those with limited budgets, this allows the most amount of reach for the least amount of development costs.
* The massive cross-platform capability of Flutter means almost anyone with a device on the internet can use a Flutter application.

### Built for beginners. 
* Aureus is incredibly human-readable, and beginner friendly for new developers.
* We aim to not only build strong documentation, but a strong directory to direct people on where to go when first learning how to code.
* Astra has also taken the initiative to develop a resource library on our website, where we explain more about product, software, and strategy development for user safety critical applications. 

### Design for safety, not for subscriptions.
* Aureus prioritizes user safety and trust above everything else. It not only pre-creates elements for use in emergency situations, but allows developers to build custom safety plans for their users to opt-in to during onboarding. These safety features are automatically handled within the templates, leaving you to focus on feature development and community engagement. 

### Accessibility as a promise, not an afterthought. 
* Aureus is built around accessibility, not tacking it on after. Every custom Aureus component has the proper semantics labeling and focus nodes for use with assistive technology.
* Aureus directly links into the user’s accessibility settings, and automatically turns off animations, auto-scales text, provides high contrast, and more.
* We also have semantic wrappers that can easily be used to extend accessibility to custom components built outside of the library, making accessibility easier to adopt.

---------------------
### Running the documentation
Since Aureus is in beta, you will need to download a local copy of the package onto your computer, and run the documentation on a local server. This will be fixed later, and hosted online. 

1) Navigate to the Package folder of the directory to be within the codebase 
2) In the terminal, run the command: 

dart pub global run dhttpd --path doc/api

3) Open your preferred browser, and enter the URL as http://localhost:8080/

---------------------

It contains 
* 100+ out of the box components, elements, and templated views that automatically adjust to light / dark mode, and desktop / tablet / mobile usage to make it deployable across all platforms and modes. 
* pre-integrated safety functionality, permissions & data handling, and accessibility support that will hopefully meet Level AA compliance with WCAG 2.1. 
* implementation guides & documentation for easy understanding. 

---------------------

# Getting Started with Aureus 

### Adding the proper libraries 
Go to pub.dev and download Material, and the Aureus package. Although material is used within Aureus, it does not export it. 

Import the packages in your library file, or in any file that you will be using Aureus in. 

```
import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';
```

### Supporting Flutter Secure Storage 
Aureus uses the pub.dev package Flutter Secure Storage, to manage the user’s Safety Plan settings without your input. However, there is still some work that needs to be done to make sure the Safety Plan works in your application. 

You do not need to import or export the library, but you do need to configure the settings on specific platforms to make sure it can run. You do not need to configure these settings immediately if you are just using the iOS simulator, but this should be done before any pre-launch QA testing. 

If you are releasing Aureus on 
- Android
- Linux 
- MacOS
- Web

Then you must go read the flutter_secure_storage documentation to properly configure support before launch. You can find the platform dependent documentation here: https://github.com/mogol/flutter_secure_storage 

### Building your Aureus resource

Before you use any of the items in Aureus, you have to initialize your packageVariables in your main.dart file, before the application is run. You can learn more about each of the parameters in the Aureus documentation. 

```

void main() {
 var resourceBranding = AureusBranding(
     fontFamily: fontFamily,
     lightModeStyle: lightModeStyle,
     darkModeStyle: darkModeStyle);


 var resourceInformation = AureusInformation(
     name: name,
     mission: mission,
     safetySettings: safetySettings,
     developerName: developerName,
     developerEmail: developerEmail,
     userSupportURL: userSupportURL,
     requestedDataPermissions: requestedDataPermissions,
     termsOfService: termsOfService,
     privacyPolicy: privacyPolicy);


 var resourceNavigation = AureusNavigationTree(
     splashScreen: splashScreen,
     homeScreen: homeScreen,
     settings: settings,
     onboardingLanding: onboardingLanding,
     onboardingDemo: onboardingDemo,
     onboardingInformation: onboardingInformation,
     termsOfService: termsOfService,
     privacyPolicy: privacyPolicy,
     signIn: signIn,
     signUp: signUp,
     helpCenter: helpCenter,
     contactSupport: contactSupport);


 packageVariables = AureusResource(
     resourceBranding: resourceBranding,
     resourceInformation: resourceInformation,
     resourceNavigation: resourceNavigation);

 runApp(AureusTestApp());
}

```

---------------------

# Links

* [You can find Aureus' example app running here](https://withaureus.org/)
* [You can learn more about Astra here](https://www.withastra.org)
* [Learn about the origins and goals behind Aureus](https://codingiswhyicry.medium.com/on-aureus-creating-a-digital-refuge-1-5-63d14300bf3b)