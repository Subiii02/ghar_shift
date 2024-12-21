import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/size.dart';
import '../../../../../constants/text_strings.dart';
import '../forget_password_mail/forget_password_mail.dart';
import 'foget_password_button_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(SDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(SForgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
            Text(SForgetPasswordSubTitle, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 30.0),
            ForgetPasswordButtonWidget(
              buttonIcon: Icons.mail_outline_rounded,
              title: SEmail,
              subTitle: SResetViaEmail,
              onTap: () {
                Navigator.pop(context); // Close modal
                Get.to(() => const ForgetPasswordMail()); // Navigate to email reset screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
