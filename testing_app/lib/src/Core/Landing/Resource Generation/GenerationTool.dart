

class GenerationTool extends CoreTool {
  GenerationTool()
      : super(
          toolCards: [
            SingleInputToolTemplate(
                templatePrompt: "What is your resource's name?",
                badgeIcon: Assets.no),
            SingleInputToolTemplate(
                templatePrompt: "What is your resource's mission",
                badgeIcon: Assets.no),
            SingleInputToolTemplate(
                templatePrompt: "What is your resource's font family?",
                badgeIcon: Assets.no),
            SingleInputToolTemplate(
                templatePrompt: "Choose your light mode accent color.",
                badgeIcon: Assets.no),
            SingleInputToolTemplate(
                templatePrompt: "Upload your light mode primary image.",
                badgeIcon: Assets.no),
            SingleInputToolTemplate(
                templatePrompt: "Upload your light mode secondary image.",
                badgeIcon: Assets.no),
            SingleInputToolTemplate(
                templatePrompt: "Upload your light mode logo image.",
                badgeIcon: Assets.no),
            SingleInputToolTemplate(
                templatePrompt: "Choose your dark mode accent color.",
                badgeIcon: Assets.no),
            SingleInputToolTemplate(
                templatePrompt: "Upload your dark mode primary image.",
                badgeIcon: Assets.no),
            SingleInputToolTemplate(
                templatePrompt: "Upload your dark mode secondary image.",
                badgeIcon: Assets.no),
            SingleInputToolTemplate(
                templatePrompt: "Upload your dark mode logo image.",
                badgeIcon: Assets.no),
          ],
          toolName: 'Generate an Aureus Resource',
          toolDescription:
              "Provide the names, colors, and metadata of your resource, and Aureus will generate a sample application to render your dream.",
          toolDetails: {
            "5-10 Minutes": Assets.brain,
            "Free": Assets.money,
            "For Beginners": Assets.location,
          },
          entryPoint: OnboardingLandingView(),
          nextSteps: {
            'See your resource.': () => {},
            'Learn about Astra Laboratories': () => {print('hi')},
          },
          toolIcon: Assets.wrench,
        );
}