import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghar_shift/src/features/authentication/screens/login/login_screen.dart'; // Import the LoginScreen
import 'package:ghar_shift/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';
import '../../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/size.dart';
import '../../../../../constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = '/signup';
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(SDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start
              children: [
                // Header Widget
                const FormHeaderWidget(
                  image: SWelcomeScreenImage,
                  title: SSignUpTitle,
                  subTitle: SSignUpSubTitle,
                ),
                const SizedBox(height: SDefaultSize), // Add spacing between widgets

                // Signup Form Widget
                const SignUpFormWidget(),

                const SizedBox(height: SDefaultSize), // Add spacing before "OR" section

                // Divider Section with "OR"
                Column(
                  children: [
                    const Divider(thickness: 1), // Horizontal divider line
                    const Text(
                      "OR",
                      style: TextStyle(fontWeight: FontWeight.bold), // Make "OR" bold for better visibility
                    ),
                    const Divider(thickness: 1), // Another divider
                    const SizedBox(height: SDefaultSize / 2),
                  ],
                ),

                // Google Sign-In Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // TODO: Implement Google Sign-In logic
                      debugPrint('Google Sign-In pressed');
                    },
                    icon: const Image(
                      image: AssetImage(SGoogleLogoImage),
                      width: 20.0,
                    ),
                    label: Text(SSignInWithGoogle.toUpperCase()),
                  ),
                ),

                const SizedBox(height: SDefaultSize), // Add spacing before "Already have an account" section

                // Already Have an Account Section
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Navigate to Login Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: SAlreadyHaveAnAccount,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          TextSpan(
                            text: SLogin.toUpperCase(),
                            style: const TextStyle(fontWeight: FontWeight.bold), // Make login bold
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
