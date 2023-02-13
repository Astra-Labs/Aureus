import 'package:aureus/aureus.dart';

/*--------- SETTINGS VIEW ----------*/

class SettingsView extends StatefulWidget {
  const SettingsView();

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  var aboutDialogue = AboutDialog(
    applicationName: packageVariables.resourceInformation.name,
    applicationLegalese:
        'Developed by ${packageVariables.resourceInformation.developerName},',
    children: [
      StandardButtonElement(
          decorationVariant: decorationPriority.standard,
          buttonTitle: 'Contact Support',
          buttonHint:
              'Brings you to contact support for ${resourceValues.name}',
          buttonAction: () => {}),
      StandardButtonElement(
          decorationVariant: decorationPriority.standard,
          buttonTitle: 'Terms of Service',
          buttonHint: 'Shows Terms of Service',
          buttonAction: () => {}),
      StandardButtonElement(
          decorationVariant: decorationPriority.standard,
          buttonTitle: 'Privacy Policy',
          buttonHint: 'Shows Privacy Policy',
          buttonAction: () => {})
    ],
  );

  @override
  Widget build(BuildContext context) {
    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.stackScroll,
        children: [
          PageHeaderElement.withExit(
              pageTitle: 'Settings',
              onPageExit: () => {Navigator.pop(context)}),
          const SizedBox(height: 20.0),
          const TabSubheaderElement(title: 'I want to'),
          const SizedBox(height: 20.0),
          StandardButtonElement(
              decorationVariant: decorationPriority.standard,
              buttonTitle: 'Use the help center.',
              buttonHint:
                  "Takes you to the help center to find more information about ${resourceValues.name}",
              buttonAction: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => resourceValues.help,
                        ))
                  }),
          const SizedBox(height: 10.0),
          StandardButtonElement(
              decorationVariant: decorationPriority.standard,
              buttonTitle: 'modify Safety Plan settings.',
              buttonHint: "Takes you to modify your safety plan.",
              buttonAction: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SafetyPlanSettingsView(),
                        ))
                  }),
          const SizedBox(height: 10.0),
          StandardButtonElement(
              decorationVariant: decorationPriority.standard,
              buttonTitle:
                  'learn more about ${packageVariables.resourceInformation.name}.',
              buttonHint:
                  "Shows terms of service, licenses, developer information, and more.",
              buttonAction: () => {showAboutDialog(context: context)})
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
