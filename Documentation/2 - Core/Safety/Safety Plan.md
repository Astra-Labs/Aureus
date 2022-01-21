# Safety Plan
#### Last Updated: 1/20/2022
--------------------

## Introduction

Safety Plan is a functionality within Aureus that holds the users' safety preferences that are given during onboarding. 

You initialize a Safety object by showing the relevant views during onboarding that allows the user to create a SafetyPlan. 

Safety plan options the user can choose are are: 

| Option | Description | Baseline? |
|--------|-------------|----------|
|   .disableNotifications     |    Doesn't allow app to send push notifications         |          |
|   .disableBiometrics     |      Disables biometrics as a log-in method       |          |
|   .enable2FA     |      Enables 2FA with a additional passcode       |          | 
|   .onlyNeccessaryEmails   |     Opts out of emails unrelated to urgent account information        |          | 
|   .localDataStorage     |      Asks to store data locally instead of on a server       |          | 
|   .failedPasscodeDataDeletion    |       Deletes user data after 10 failed passcode attempts      |          | 
|   .exitBar    |     Shows a permanent exit bar on the screen that shuts down when pressed        |          | 
|   .disableScreenshots    |     Stops screen recordings and screenshots        |          | 
|   .deviceSandbox     |      Stops the resources from using other features on the device that can be logged (e.g: opening a browser or sending a message)       |          | 
|   .logFailedAttempts    |      Keeps track of all of the failed log in attempts for the user to review.       |          | 

To change the users' safety preferences, navigate them to the Safety settings screen, that will handle storing and updating on your behalf. If you don't specifically use the pre-designed template screens, there is no way to create / update a safety plan.

--------------------
## Details

To prevent abuse, SP information is not given directly to the developer. Aureus will hold and encrypt it on the users' local device, and will run the alternate code on your behalf when it can. 

The package fully handles some components, other Aureus components automatically handle Safety Plan functionality, and some explicitly ask for alternate implementations. 

You handle interacting with safety plan through fallbacks, handlers, and safety checks. Those go more in depth below.

--------------------
## Usage

If you build an item that is interactable, you're required to tell Aureus if it inferes with SP functionality, and pass a fallback option (if it does interfere). A fallback option is an alternate piece of code that runs if the option is enabled.

You can either write a custom action, or you can have Aureus show an alert controller that tells the user the action cannot be completed due to their Safety Plan settings. 

Sometimes, you'll build custom elements that may complete the action without using Aureus. In that case, call Safety.fallbackHandling() and pass it the option that you would like to check, with alternate code to run. 

If you use a templated item that has built in functionality, you're required to write alternate methods of handling to make sure the plan is complied with. 