import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/size.dart';
import '../../../../constants/text_strings.dart';
import '../google_signin/google_signin.dart';
import '../signup/widgets/signup_screen.dart';
import 'package:http/http.dart' as http;



class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  Future<void> _handleGoogleSignIn(BuildContext context) async {
    try {
      const idToken = "mock-google-id-token";
      const email = "user@example.com";
      const name = "John Doe";
      const photoUrl = "https://example.com/photo.jpg";


      const backendUrl = 'http://your-backend-url/auth/google';

      final response = await http.post(
        Uri.parse(backendUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "idToken": idToken,
          "email": email,
          "name": name,
          "photoUrl": photoUrl,
        }),
      );

      // Check response status
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Handle successful login
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Welcome, ${data['user']['name']}!")),
        );
      } else {
        // Handle error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Google Sign-In failed: ${response.body}")),
        );
      }
    } catch (error) {
      // Handle exceptions
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred: $error")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(GoogleAuthService());
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
            onPressed: () {
              controller.signInWithGoogle();
            },
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
