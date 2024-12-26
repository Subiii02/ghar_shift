import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../../constants/size.dart';
import '../../../../../constants/text_strings.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;



class SignUpFormWidget extends StatelessWidget {
  SignUpFormWidget({super.key});

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // MongoDB connection URI
  final String mongoUri = "mongodb+srv://subiii:Subhan523@cluster.o7jea.mongodb.net/ghar_shift?retryWrites=true&w=majority";
  final String mongoCollection = "users";

  /// Register User and Save to Firestore and MongoDB
  Future<void> _registerUser(
      BuildContext context, String fullName, String email, String phone, String password) async {
    try {
      // Step 1: Check if Email Already Exists in MongoDB
      final isEmailExists = await _checkEmailInMongoDB(email);
      if (isEmailExists) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Email already exists. Please use a different email.")),
        );
        return;
      }

      // Step 2: Register User with Firebase Authentication
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Step 3: Store User Data in Firestore
      await firestore.collection('users').doc(userCredential.user!.uid).set({
        'fullName': fullName,
        'email': email,
        'phone': phone,
        'createdAt': DateTime.now(),
      });

      // Step 4: Store User Data in MongoDB
      await _storeUserDataInMongoDB(userCredential.user!.uid, fullName, email, phone);

      // Step 5: Show Success Message and Navigate to Login Page
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration successful! Now you can login to the application.")),
      );

      Navigator.pushNamed(context, '/login'); // Replace with your login route
    } catch (e) {
      // Show Error Message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }

  /// Check if Email Exists in MongoDB
  Future<bool> _checkEmailInMongoDB(String email) async {
    mongo.Db db = mongo.Db(mongoUri);
    try {
      await db.open();
      final collection = db.collection(mongoCollection);
      final user = await collection.findOne({"email": email});
      return user != null;
    } catch (e) {
      throw Exception('Error checking email in MongoDB: ${e.toString()}');
    } finally {
      await db.close();
    }
  }

  /// Store User Data in MongoDB
  Future<void> _storeUserDataInMongoDB(String uid, String fullName, String email, String phone) async {
    mongo.Db db = mongo.Db(mongoUri);
    try {
      await db.open();
      final collection = db.collection(mongoCollection);
      await collection.insertOne({
        "uid": uid,
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "createdAt": DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('Error storing user data in MongoDB: ${e.toString()}');
    } finally {
      await db.close();
    }
  }
  @override
  Widget build(BuildContext context) {
    // Text Controllers
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController(text: '+92');
    final TextEditingController passwordController = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: SFormHeight - 10),
      child: Form(
        key: _formKey,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Full Name is required';
                }
                return null;
              },
            ),
            SizedBox(height: SFormHeight - 20),

            // Email Field
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                label: Text(SEmail),
                hintText: 'example@gmail.com',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required';
                } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                    .hasMatch(value)) {
                  return 'Enter a valid email address';
                }
                return null;
              },
            ),
            SizedBox(height: SFormHeight - 20),

            // Phone Number Field
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              maxLength: 13,
              decoration: const InputDecoration(
                label: Text(SPhoneNo),
                prefixIcon: Icon(Icons.phone),
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 3) {
                  return 'Enter a valid phone number (e.g., +92 3457893023)';
                } else if (!RegExp(r'^\+92\d{10}$').hasMatch(value)) {
                  return 'Phone number must be 10 digits after +92';
                }
                return null;
              },
            ),
            SizedBox(height: SFormHeight - 20),

            // Password Field
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                label: Text(SPassword),
                prefixIcon: Icon(Icons.lock_outline),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
            ),
            const SizedBox(height: SFormHeight - 10),

            // Signup Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final String fullName = fullNameController.text.trim();
                    final String email = emailController.text.trim();
                    final String phone = phoneController.text.trim();
                    final String password = passwordController.text.trim();

                    _registerUser(context, fullName, email, phone, password);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please fix the errors in the form.")),
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
