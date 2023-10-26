part of AureusTestingApp;

class GenerationLandingPage extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var generationToolCarousel = ToolDetailView(
      parentTool: GenerationTool(),
      onUseTool: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ToolTemplateCardCarouselView(
                parentTool: GenerationTool(), onFinish: () {}),
          ),
        );
      },
    );

    List<StandardIconButtonElement> buttonItems = [
      StandardIconButtonElement(
          decorationVariant: decorationPriority.standard,
          buttonHint: "Create your Aureus resource.",
          buttonTitle: "Generate a resource.",
          buttonIcon: Assets.window,
          buttonAction: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ToolDetailView(
                              parentTool: GenerationTool(),
                              onUseTool: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            generationToolCarousel));
                              },
                            )))
              }),
    ];

    Image landingUIOverlayImage() {
      if (palette.brightness() == Brightness.light) {
        return Image(image: AssetImage('assets/Light Mode - Preview.png'));
      } else if (palette.brightness() == Brightness.dark) {
        return Image(image: AssetImage('assets/Dark Mode - Preview.png'));
      }
      throw ('Unexpected platform brightness issue. Please check the implementation.');
    }

    return Container();
  }
}
