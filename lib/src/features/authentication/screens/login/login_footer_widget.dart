import 'package:flutter/material.dart';
import 'package:ghar_shift/src/constants/image_strings.dart';
import 'package:ghar_shift/src/constants/size.dart';
import 'package:ghar_shift/src/constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(height: SFormHeight -20,),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              icon: const Image(image: AssetImage(SGoogleLogoImage), width: 20.0,),
              onPressed: () {},
              label: Text(SSignInWithGoogle)),
        ),
        const SizedBox(
          height: SFormHeight -20,),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
              text: SDontHaveAnAccount,
              style: Theme.of(context).textTheme.bodySmall,
              children: [
                TextSpan(
                  text: SSignup,
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ), ),
        )
      ],
    );
  }
}
