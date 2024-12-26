
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              children: const [
                TextSpan(
                  text: SSignup,
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
