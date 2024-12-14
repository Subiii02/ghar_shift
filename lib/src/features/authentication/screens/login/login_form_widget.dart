import 'package:flutter/material.dart';
import 'package:ghar_shift/src/features/authentication/models/handle_api/authservice.dart';
import '../../../../constants/size.dart';
import '../../../../constants/text_strings.dart';
import '../forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  // Controllers for capturing user input
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: SFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email Field
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: SEmail,
                hintText: SEmail,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: SFormHeight - 20),

            // Password Field
            TextFormField(
              controller: passwordController,
              obscureText: true, // Obscures text for password
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint_outlined),
                labelText: SPassword,
                hintText: SPassword,
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.remove_red_eye_sharp), // Add toggle functionality if needed
              ),
            ),
            const SizedBox(height: SFormHeight - 20),

            // Forget Password Button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgetPasswordScreen.buildShowModalBottomSheet(context);
                },
                child: Text(SForgetPassword),
              ),
            ),

            // Login Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();

                  // Validation
                  if (email.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Email and Password cannot be empty!")),
                    );
                    return;
                  }

                  // Login Attempt
                  final response = await AuthService.login(email, password);

                  if (response['success']) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Login Successful! Welcome ${response['data']['name']}")),
                    );
                    Navigator.pushNamed(context, '/user_dashboard'); // Replace with your home route
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(response['message'])),
                    );
                  }
                },
                child: Text(SLogin.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
