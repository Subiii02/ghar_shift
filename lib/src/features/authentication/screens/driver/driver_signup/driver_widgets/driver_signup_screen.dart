import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghar_shift/src/features/authentication/screens/login/login_screen.dart'; // Import the LoginScreen
import 'package:ghar_shift/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';
import '../../../../../../common_widgets/fade_in_animation/form/form_header_widget.dart';
import '../../../../../../constants/image_strings.dart';
import '../../../../../../constants/size.dart';
import '../../../../../../constants/text_strings.dart';

class DriverSignupScreen extends StatelessWidget {
  static const String routeName = '/labor_signup';
  const DriverSignupScreen({super.key});

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
                const SizedBox(height: SDefaultSize),

                // Signup Form Widget
                LaborSignUpFormWidget(),

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
