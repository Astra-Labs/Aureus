import 'package:aureus/aureus.dart';

class SignInView extends StatefulWidget {
  final VoidCallback onSignIn;
  final VoidCallback onSignup;
  final VoidCallback onResetInformation;

  const SignInView(
      {required this.onSignIn,
      required this.onSignup,
      required this.onResetInformation});

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              HeadingTwoText("Sign In", decorationPriority.standard),
              Container(
                  height: 65.0,
                  width: 65.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: coloration.resourceLogo().image,
                    fit: BoxFit.cover,
                  ))),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        const DividerElement(),
        const Spacer(),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SingleDataTypeUserInputElement(dataPlaceholder: "Username"),
              const SizedBox(height: 5.0),
              SingleDataTypeUserInputElement(dataPlaceholder: "Password"),
              const SizedBox(height: 5.0),
              StandardButtonElement(
                  decorationVariant: decorationPriority.important,
                  buttonTitle: "Sign In",
                  buttonHint: "Authenticates your credentials to log you in.",
                  buttonAction: widget.onSignIn)
            ],
          ),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              SmolButtonElement(
                  decorationVariant: decorationPriority.standard,
                  buttonTitle: "Sign Up",
                  buttonHint:
                      'Takes you to the sign up view to create an account.',
                  buttonAction: widget.onSignup),
              const SizedBox(width: 20.0),
              SmolButtonElement(
                  decorationVariant: decorationPriority.standard,
                  buttonTitle: "Reset Password",
                  buttonHint:
                      'Takes you to the reset password view to recover your password.',
                  buttonAction: widget.onResetInformation),
            ],
          ),
        )
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.important, builder: viewLayout);
  }
}
