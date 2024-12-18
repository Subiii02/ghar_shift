import 'package:flutter/material.dart';
import '../../../../../constants/size.dart';
import '../../../../../constants/text_strings.dart';


class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({super.key});

  Future<void> _registerUser(BuildContext context, String email, String password) async {
    const String realmAppId = "ghar_shift-sblsiof";

    try {
      // Initialize Realm App
      final appConfig = AppConfiguration(realmAppId);
      final app = App(appConfig);

      // Register the user
      await app.emailPasswordAuth.registerUser(email, password);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration successful! Please log in.")),
      );
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: SFormHeight - 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: fullNameController,
              decoration: const InputDecoration(
                label: Text(SFullName),
                prefixIcon: Icon(Icons.person_outline_outlined),
              ),
            ),
            SizedBox(height: SFormHeight - 20),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                label: Text(SEmail),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            SizedBox(height: SFormHeight - 20),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                label: Text(SPhoneNo),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            SizedBox(height: SFormHeight - 20),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                label: Text(SPassword),
                prefixIcon: Icon(Icons.fingerprint_outlined),
              ),
            ),
            const SizedBox(height: SFormHeight - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final String email = emailController.text.trim();
                  final String password = passwordController.text.trim();
                  if (email.isNotEmpty && password.isNotEmpty) {
                    _registerUser(context, email, password);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please fill all fields.")),
                    );
                  }
                },
                child: Text(SSignup.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
