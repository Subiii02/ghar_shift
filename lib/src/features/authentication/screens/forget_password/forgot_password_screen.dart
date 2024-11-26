import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../constants/text_strings.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = '/forgot_password';
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(SForgetPassword)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(SForgetPasswordTitle, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 10),
            Text(SForgetPasswordSubTitle, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Get.toNamed('/reset-email'),
              child: const Text(SResetViaEmail),
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed('/reset-phone'),
              child: const Text(SResetViaPhone),
            ),
          ],
        ),
      ),
    );
  }
}
