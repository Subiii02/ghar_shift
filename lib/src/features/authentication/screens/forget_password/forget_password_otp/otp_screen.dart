import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../constants/size.dart';
import '../../../../../constants/text_strings.dart';

class OPTScreen extends StatelessWidget {
  const OPTScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(SDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(SOtpTitle,style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 80.0,
            ),),
            Text(SOtpSubTitle.toUpperCase(),
              style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: 40.0),
            const Text(
                "$SOtpMessage forexample@gmail.com",
                textAlign: TextAlign.center
            ),
            const SizedBox(height: 20.0,),
            OtpTextField(
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              onSubmit: (code){ print("OTP is => $code");},

            ),
            const SizedBox(height: 20.0),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){}, child:const Text(SNext))),
          ],
        ),
      ),
    );
  }
}
