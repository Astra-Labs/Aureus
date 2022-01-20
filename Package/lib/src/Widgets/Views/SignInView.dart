import 'package:aureus/aureus.dart';

//
//Doc Link:

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
        Spacer(),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SingleDataTypeUserInputElement(dataPlaceholder: "Username"),
              SizedBox(height: 8.0),
              SingleDataTypeUserInputElement(dataPlaceholder: "Password"),
              SizedBox(height: 20.0),
              StandardButtonElement(
                  decorationVariant: decorationPriority.important,
                  buttonTitle: "Sign In",
                  buttonAction: widget.onSignIn)
            ],
          ),
        ),
        Spacer(),
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
                  buttonAction: widget.onSignup),
              SizedBox(width: 20.0),
              SmolButtonElement(
                  decorationVariant: decorationPriority.standard,
                  buttonTitle: "Reset Password",
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
