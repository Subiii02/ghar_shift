import 'package:flutter/material.dart';
import 'package:ghar_shift/src/common_widgets/fade_in_animation/form/form_header_widget.dart';
import 'package:ghar_shift/src/constants/colors.dart';
import 'package:ghar_shift/src/constants/image_strings.dart';
import 'package:ghar_shift/src/constants/size.dart';
import 'package:ghar_shift/src/constants/text_strings.dart';
import 'package:ghar_shift/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';
import 'package:ghar_shift/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(SDefaultSize),
            child: Column(
              children: [
                const FormHeaderWidget(
                    image: SWelcomeScreenImage,
                    title: SSignUpTitle,
                    subTitle: SSignUpSubTitle,
                ),
                const SignUpFormWidget(),
                Column(
                  children: [
                    const Text("OR"),
                   SizedBox(
                     width: double.infinity,
                     child: OutlinedButton.icon(
                         onPressed: () {},
                         icon: const Image(image: AssetImage(SGoogleLogoImage) width: 20.0 ),
                       label: Text(SSignInWithGoogle.toUppercase()),
                     ),
                   ),
                    TextButton(
                        onPressed: () {},
                        child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: SAlreadyHaveAnAccount,style: Theme.of(context).textTheme.bodySmall),
                                TextSpan(text: SLogin.toUpperCase()),
                              ]
                            )

                        )


                          )
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

