import 'package:flutter/material.dart';
import 'package:ghar_shift/src/constants/size.dart';
import 'package:ghar_shift/src/features/authentication/screens/login/login_footer_widget.dart';
import 'package:ghar_shift/src/features/authentication/screens/login/login_form_widget.dart';
import 'package:ghar_shift/src/features/authentication/screens/login/login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.all(SDefaultSize),
                  child: Container(
                    padding: const EdgeInsets.all(SDefaultSize),
                    child: Column(
                      children: [
                        LoginHeaderWidget(size: size),
                        LoginForm(),
                        LoginFooterWidget(),
                  ],
              ),
                  ),
      ),
    ),
      ),
    );
  }
}



