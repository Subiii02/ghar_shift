import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/form/form_header_widget.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/size.dart';
import '../../../../constants/text_strings.dart';
import 'login_footer_widget.dart';
import 'login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the user type passed from the previous screen


    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(SDefaultSize),
            child: Column(
              children: [
                FormHeaderWidget(
                  image: SWelcomeScreenImage,
                  title: "Login", // Display user type in title
                  subTitle: SLoginSubTitle,
                ),
                // Login Form
                const LoginForm(),
                // Footer
                LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
