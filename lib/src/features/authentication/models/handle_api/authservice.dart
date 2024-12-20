import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import '../../../../constants/text_strings.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Login function
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      // Sign in with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // If successful, return success and user data
      return {
        'success': true,
        'data': {
          'uid': userCredential.user!.uid,
          'email': userCredential.user!.email,
        },
      };
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific errors
      if (e.code == 'user-not-found') {
        return {'success': false, 'message': 'No user found for that email.'};
      } else if (e.code == 'wrong-password') {
        return {'success': false, 'message': 'Wrong password provided for that user.'};
      } else {
        return {'success': false, 'message': e.message ?? 'An unknown error occurred.'};
      }
    } catch (e) {
      // Handle any other errors
      return {'success': false, 'message': 'An error occurred. Please try again.'};
    }
  }
}


  // Signup Function
  Future<Map<String, dynamic>> signup(String name, String email, String password) async {
    final url = Uri.parse("$ipAddress/api/auth/signup");
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({"name": name, "email": email, "password": password}),
      );

      if (response.statusCode == 201) {
        return {"success": true, "data": json.decode(response.body)};
      } else {
        final error = json.decode(response.body);
        return {"success": false, "message": error['message'] ?? "Unknown error"};
      }
    } catch (e) {
      return {"success": false, "message": "Failed to connect to the server"};
    }
  }

