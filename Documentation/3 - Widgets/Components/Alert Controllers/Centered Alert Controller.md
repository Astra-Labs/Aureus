# Centered Alert Controller
#### Last Updated: 1/20/2022
--------------------

### Description 
A centered alert controller that displays one action, or multiple actions. 

--------------------

#### Usage 
- Create a single (or set) of actions from AlertControllerAction. 
- Create an AlertControllerObject from the AlertControllerAction(s)
- Pass the AlertControllerObject to the CenteredAlertControllerComponent.

~~~

// an alert controller object that defines what goes into the controller. 

var testAlertControllerAction = AlertControllerAction(actionName: 'Yee the haw', actionSeverity: AlertControllerActionSeverity.confirm, onSelection: () => {print('yee haw!')});

var testAlertControllerAction2 = AlertControllerAction(actionName: 'Haw the yee',
actionSeverity: AlertControllerActionSeverity.destruct,
onSelection: () => {print('haw yee!')});

//Initializing an alert controller data object with one action.

late AlertControllerObject testAlertControllerObject =
AlertControllerObject.singleAction(
onCancellation: () => {print('cancelled')},
alertTitle: 'Would you like to yee?',
alertBody: 'Haw. Haw Haw Haw Haw.',
actions: [testAlertControllerAction],
alertIcon: Assets.expand);

//Initializing an alert controller data object with multiple actions.

AlertControllerObject multipleTestAlertControllerObject =
AlertControllerObject.multipleActions(
onCancellation: () => {print('cancelled')},
alertTitle: 'Would you like to yee?',
alertBody: 'Haw. Haw Haw Haw Haw.',
actions: [testAlertControllerAction, testAlertControllerAction2],
alertIcon: Assets.expand);

  
var alertController =
CenteredAlertControllerComponent(alertData: testAlertControllerObject);

~~~
