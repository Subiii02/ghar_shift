import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/size.dart';
import '../../../../constants/text_strings.dart';
import '../signup/widgets/signup_screen.dart';


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
        const SizedBox(height: SFormHeight - 10),
        SizedBox(
          width: 320,
          height: 50,
          child: OutlinedButton.icon(
            iconAlignment: IconAlignment.start,
            icon: const Image(
              image: AssetImage(SGoogleLogoImage),
              width: 40,
              height: 40, // Adjusted width to prevent overflow
            ),
            onPressed: () {},
            label: Text(
              SSignInWithGoogle,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 1,
              textAlign: TextAlign.start,
            ),
          ),
        ),
        const SizedBox(height: SFormHeight - 1),
        TextButton(
          onPressed: () {
            // Navigate to the Signup Screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignupScreen(),
              ),
            );
          },
          child: Text.rich(
            TextSpan(
              text: SDontHaveAnAccount,
              style: Theme.of(context).textTheme.bodySmall,
              children: [
                TextSpan(
                  text: SSignup,
                  style: const TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
