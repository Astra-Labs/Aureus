import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- SETTINGS VIEW ----------*/

class SettingsView extends StatefulWidget {
  /// A list of [SettingSection]s that build the settings page.
  final List<SettingSection> settingSections;
  const SettingsView({required this.settingSections});

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
    List<Widget> settingRows = [];

    for (var section in widget.settingSections) {
      List<Widget> sectionChildren = [];

      for (var sectionItem in section.sectionItems) {
        Widget child;

        switch (sectionItem.itemType) {
          case SettingItemType.standardButton:
            child = sectionItem.standardButton!;
            break;
          case SettingItemType.standardIconButton:
            child = sectionItem.standardIconButton!;
            break;
          case SettingItemType.switchComponent:
            child = sectionItem.switchComponent!;
            break;
        }

        sectionChildren.add(
          Padding(padding: const EdgeInsets.all(8), child: child),
        );
      }
      var sectionColumn = Column(children: [
        TabSubheaderElement(title: section.sectionTitle),
        const SizedBox(height: 10),
        Column(
          children: sectionChildren,
        )
      ]);
      settingRows.add(sectionColumn);
    }

    var standardButtonElement = StandardButtonElement(
        decorationVariant: decorationPriority.standard,
        buttonTitle:
            'learn more about ${packageVariables.resourceInformation.name}.',
        buttonHint:
            "Shows terms of service, licenses, developer information, and more.",
        buttonAction: () => {showAboutDialog(context: context)});

    var standardButtonElement2 = StandardButtonElement(
        decorationVariant: decorationPriority.standard,
        buttonTitle: 'modify Safety Plan settings.',
        buttonHint: "Takes you to modify your safety plan.",
        buttonAction: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SafetyPlanSettingsView(),
                  ))
            });

    var standardButtonElement3 = StandardButtonElement(
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
            });

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.stackScroll,
        children: [
          PageHeaderElement.withExit(
              pageTitle: 'Settings',
              onPageExit: () => {Navigator.pop(context)}),
          const SizedBox(height: 20.0),
          Column(
            children: settingRows,
          ),
          const SizedBox(height: 20.0),
          const TabSubheaderElement(title: 'I want to'),
          const SizedBox(height: 20.0),
          standardButtonElement3,
          const SizedBox(height: 10.0),
          standardButtonElement2,
          const SizedBox(height: 10.0),
          standardButtonElement
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
