import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ghar_shift/src/features/authentication/models/handle_api/authservice.dart';

import '../../../../../constants/size.dart';
import '../../../../../constants/text_strings.dart';

class LaborLoginForm extends StatefulWidget {
  LaborLoginForm({super.key});

  @override
  _LaborLoginFormState createState() => _LaborLoginFormState();
}

class _LaborLoginFormState extends State<LaborLoginForm> {
  // Controllers for capturing user input
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  bool _obscurePassword = true;


  Future<void> resetPassword( String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // Display success snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password reset email sent to $email'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        ),
      );
    } catch (e) {
      // Handle errors and show error snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send password reset email. ${e.toString()}'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
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
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline),
                labelText: SPassword,
                hintText: SPassword,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: SFormHeight - 20),

            // Forget Password Button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () async {
                  final email = emailController.text.trim();
                  await resetPassword(email);
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

                  try {
                    // Login Attempt
                    final response = await authService.login(email, password);

                    if (response['success']) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Login Successful! Welcome ${response['data']['email']}")),
                      );
                      Navigator.pushNamed(context, '/user_dashboard');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(response['message'] ?? "Login failed. Please try again.")),
                      );
                    }
                  } catch (e) {
                    // Handle unexpected errors gracefully
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("An error occurred: $e")),
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
