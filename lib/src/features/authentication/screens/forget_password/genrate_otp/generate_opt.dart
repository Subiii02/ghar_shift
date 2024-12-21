import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPasswordMailScreen extends StatefulWidget {
  @override
  _ForgetPasswordMailScreenState createState() => _ForgetPasswordMailScreenState();
}

class _ForgetPasswordMailScreenState extends State<ForgetPasswordMailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to generate OTP
  String generateOtp() {
    Random random = Random();
    String otp = '';
    for (int i = 0; i < 6; i++) {
      otp += random.nextInt(10).toString();
    }
    return otp;
  }

  Future<void> sendOtpEmail(String email, String otp) async {
    try {
      // Create a temporary Firebase user
      await _auth.createUserWithEmailAndPassword(
          email: email, password: "TemporaryPassword123!");

      // Send an email to the user
      User? user = _auth.currentUser;
      if (user != null) {
        await user.sendEmailVerification();
        print("OTP sent: $otp");
      }

      // Notify the user to check their email
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP sent to your email.')),
      );
    } catch (e) {
      print("Error sending OTP: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to send OTP.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forget Password - OTP")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Enter your email"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String email = _emailController.text.trim();
                String otp = generateOtp();
                sendOtpEmail(email, otp);
              },
              child: const Text("Send OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
