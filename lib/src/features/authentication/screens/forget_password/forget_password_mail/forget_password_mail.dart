import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/size.dart';
import '../../../../../constants/text_strings.dart';
import '../forget_password_otp/otp_screen.dart';

class ForgetPasswordMail extends StatelessWidget {
  const ForgetPasswordMail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(SDefaultSize),
            child: Column(
              children: [
                const SizedBox(height: SDefaultSize * 4),
                const FormHeaderWidget(
                  image: SForgetPasswordImage,
                  title: SForgetPassword,
                  subTitle: SForgetPasswordSubTitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 30.0,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: SFormHeight),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text(SEmail),
                          hintText: SEmail,
                          prefixIcon: Icon(Icons.mail_outline_rounded),
                        ) ,
                      ),
                      const SizedBox(height: 20.0,),
                      SizedBox(width: double.infinity ,
                          child: ElevatedButton(
                              onPressed: (){
                                Get.to(() =>const OPTScreen());
                              },
                              child: const Text(SNext))),

                    ],) ,)


              ],
            ),

          ),
        ),
      ),
    );
  }
}
