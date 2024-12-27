import 'package:flutter/material.dart';
import '../../../../../common_widgets/fade_in_animation/form/form_header_widget.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/size.dart';
import '../../../../../constants/text_strings.dart';
import 'labor_login_footer_widget.dart';
import 'labor_login_form_widget.dart';

class LaborLoginScreen extends StatelessWidget {
  static const String routeName = '/labor_login';
  const LaborLoginScreen({super.key});

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
                  title: "Login",
                  subTitle: SLoginSubTitle,
                ),
                // Login Form
                LaborLoginForm(),
                // Footer
                const LaborLoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
