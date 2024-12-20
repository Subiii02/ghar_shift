import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../../constants/size.dart';
import '../../../../../constants/text_strings.dart';

class SignUpFormWidget extends StatelessWidget {
  SignUpFormWidget({super.key});

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance; // Firestore instance

  /// Register User and Save to Firestore and MongoDB
  Future<void> _registerUser(
      BuildContext context, String fullName, String email, String phone, String password) async {
    try {
      // 1. Register User with Firebase Authentication
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // 2. Store User Data in Firestore
      await firestore.collection('users').doc(userCredential.user!.uid).set({
        'fullName': fullName,
        'email': email,
        'phone': phone,
        'createdAt': DateTime.now(),
      });

      // 3. Store User Data in MongoDB
      await _storeUserDataInMongoDB(userCredential.user!.uid, fullName, email, phone);

      // 4. Show Success Message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration successful! Data saved to Firestore and MongoDB.")),
      );
    } catch (e) {
      // Show Error Message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }

  Future<void> _storeUserDataInMongoDB(String uid, String fullName, String email, String phone) async {
    final url = 'http://localhost:5000/api/users'; // Change to your backend URL
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'uid': uid,
        'fullName': fullName,
        'email': email,
        'phone': phone,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to store user data in MongoDB');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Text Controllers
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
            // Full Name Field
            TextFormField(
              controller: fullNameController,
              decoration: const InputDecoration(
                label: Text(SFullName),
                prefixIcon: Icon(Icons.person_outline_outlined),
              ),
            ),
            SizedBox(height: SFormHeight - 20),

            // Email Field
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                label: Text(SEmail),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            SizedBox(height: SFormHeight - 20),

            // Phone Number Field
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                label: Text(SPhoneNo),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            SizedBox(height: SFormHeight - 20),

            // Password Field
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                label: Text(SPassword),
                prefixIcon: Icon(Icons.fingerprint_outlined),
              ),
            ),
            const SizedBox(height: SFormHeight - 10),

            // Signup Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final String fullName = fullNameController.text.trim();
                  final String email = emailController.text.trim();
                  final String phone = phoneController.text.trim();
                  final String password = passwordController.text.trim();

                  if (fullName.isNotEmpty &&
                      email.isNotEmpty &&
                      phone.isNotEmpty &&
                      password.isNotEmpty) {
                    _registerUser(context, fullName, email, phone, password);
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