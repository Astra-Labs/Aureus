import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- SIGN IN VIEW ----------*/
/// A templatized sign in view.

class SignInView extends StatefulWidget {
  /// A VoidCallback to run when the user presses Sign In. This is where you should
  /// check the sign in credentials and do success / error handling
  final VoidCallback onSignIn;

  /// A Callback to run when the user presses Sign Up.
  final VoidCallback onSignup;

  /// A Callback for when the user wants to reset their information.
  final VoidCallback onResetInformation;

  /// These controllers allow you to access the text editing controllers, to check for the correct
  /// username and password.
  final TextEditingController usernameTextController;
  final TextEditingController passwordTextController;

  const SignInView(
      {required this.onSignIn,
      required this.onSignup,
      required this.onResetInformation,
      required this.usernameTextController,
      required this.passwordTextController});

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    var topRow = Row(
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
    );

    var middleRow = Column(
      children: [
        StandardTextFieldComponent(
          hintText: "Username",
          textFieldController: widget.usernameTextController,
          isEnabled: true,
          decorationVariant: decorationPriority.standard,
        ),
        const SizedBox(height: 5.0),
        StandardTextFieldComponent(
          hintText: "Password",
          textFieldController: widget.passwordTextController,
          isEnabled: true,
          decorationVariant: decorationPriority.standard,
        ),
        const SizedBox(height: 5.0),
        StandardButtonElement(
            decorationVariant: decorationPriority.important,
            buttonTitle: "Sign In",
            buttonHint: "Authenticates your credentials to log you in.",
            buttonAction: widget.onSignIn)
      ],
    );

    var bottomRow = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Spacer(),
        SmolButtonElement(
            decorationVariant: decorationPriority.standard,
            buttonTitle: "Sign Up",
            buttonHint: 'Takes you to the sign up view to create an account.',
            buttonAction: widget.onSignup),
        const SizedBox(width: 30),
        SmolButtonElement(
            decorationVariant: decorationPriority.standard,
            buttonTitle: "Reset Password",
            buttonHint:
                'Takes you to the reset password view to recover your password.',
            buttonAction: widget.onResetInformation),
        const Spacer(),
      ],
    );

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [topRow, const Spacer(), middleRow, const Spacer(), bottomRow],
    );

    return ContainerView(
      decorationVariant: decorationPriority.important,
      builder: viewLayout,
      showQuickActionBar: false,
    );
  }
}
