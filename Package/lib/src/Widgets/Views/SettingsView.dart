import 'package:aureus/aureus.dart';

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
          buttonAction: () => {}),
      StandardButtonElement(
          decorationVariant: decorationPriority.standard,
          buttonTitle: 'Terms of Service',
          buttonAction: () => {}),
      StandardButtonElement(
          decorationVariant: decorationPriority.standard,
          buttonTitle: 'Privacy Policy',
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
              buttonTitle: 'use the help center.',
              buttonAction: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AureusValues().help!,
                        ))
                  }),
          const SizedBox(height: 10.0),
          StandardButtonElement(
              decorationVariant: decorationPriority.standard,
              buttonTitle: 'modify Safety Plan settings.',
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
              buttonAction: () => {showAboutDialog(context: context)})
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
