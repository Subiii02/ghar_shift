
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
    clientId: '656905819433-us2s2iua14rkpdufhr8cikqjau54fj8n.apps.googleusercontent.com',
  );

  Future<void> signInWithGoogle() async {
    print("Starting Google Sign-In process...");

    try {
      // Prompt the user to sign in
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        print("User canceled the sign-in process");
        return; // Exit the method if the user canceled the sign-in
      }

      // Log user details
      print("Google user details: ${googleUser.displayName}, ${googleUser.email}");

      // Authenticate with Google
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.idToken == null) {
        print("ID Token is null. Cannot proceed.");
        return; // Exit if the ID token is null
      }

      // Extract user details
      final String name = googleUser.displayName ?? "Unknown";
      final String email = googleUser.email;
      final String photoUrl = googleUser.photoUrl ?? "";

      print("Extracted user data: Name: $name, Email: $email, Photo URL: $photoUrl");

      // Send user data to your backend
      await _sendDataToBackend(name, email, photoUrl, googleAuth.idToken!);
    } catch (error) {
      print("Error during Google Sign-In: $error");
    }
  }

  Future<void> _sendDataToBackend(
      String name, String email, String photoUrl, String idToken) async {
    print("Preparing to send user data to backend...");

    // Replace <your-backend-url> with your backend's Google authentication endpoint
    final url = Uri.parse('http://<your-backend-url>/auth/google');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'photoUrl': photoUrl,
          'idToken': idToken,
        }),
      );

      // Log the response from the backend
      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        print("User data sent to backend successfully");
        // Handle successful response if needed
      } else {
        print("Failed to send user data to backend: ${response.body}");
      }
    } catch (e) {
      print("Error sending data to backend: $e");
    }
  }
}
