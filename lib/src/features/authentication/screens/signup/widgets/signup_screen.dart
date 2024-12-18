import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_shift/src/features/authentication/screens/google_signin/google_signin.dart';
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
    final controller =Get.put(GoogleAuthService());
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
                const SizedBox(height: SDefaultSize),

                // Signup Form Widget
                 SignUpFormWidget(),

                const SizedBox(height: SDefaultSize),

                // Divider Section with "OR"
                const Column(
                  children: [
                    Divider(thickness: 1),
                    Text(
                      "OR",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Divider(thickness: 1),
                    SizedBox(height: SDefaultSize / 2),
                  ],
                ),

                // Google Sign-In Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      controller.signInWithGoogle();
                    },
                    icon: const Image(
                      image: AssetImage(SGoogleLogoImage),
                      width: 20.0,
                    ),
                    label: Text(SSignInWithGoogle.toUpperCase()),
                  ),
                ),

                const SizedBox(height: SDefaultSize),

                // Already Have an Account Section
                Center(
                  child: TextButton(
                    onPressed: () {
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
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
