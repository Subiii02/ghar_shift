import 'package:flutter/material.dart';
import 'package:ghar_shift/src/constants/size.dart';
import 'package:ghar_shift/src/constants/text_strings.dart';
import 'package:ghar_shift/src/features/authentication/screens/forget_password/forget_password_options/forget_password_button_widget.dart';

class ForgetPasswordScreen{
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: EdgeInsets.all(SDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(SForgetPasswordTitle, style : Theme.of(context).textTheme.headlineMedium),
            Text(SForgetPasswordSubTitle, style: Theme.of(context).textTheme.headlineSmall ,),
            const SizedBox(height: 30.0,),
            ForgetPasswordButtonWidget(
              buttonIcon: Icons.mail_outline_rounded,
              title: SEmail,
              subTitle: SResetViaEmail,
              onTap: (){},
            ),
            const SizedBox(height: 20.0),
            ForgetPasswordButtonWidget(
              buttonIcon: Icons.mobile_friendly_rounded,
              title: SPhoneNo,
              subTitle: SResetViaPhone,
              onTap: (){},
            ),
          ],
        ),
      ),);
  }
}
