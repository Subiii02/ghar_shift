
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghar_shift/src/features/authentication/screens/labor/labor_signup/labor_widgets/labor_signup_screen.dart';

import '../../../../../constants/text_strings.dart';

class LaborLoginFooterWidget extends StatelessWidget {
  const LaborLoginFooterWidget({
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
                builder: (context) => const LaborSignupScreen(),
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
