import 'package:ghar_shift/src/constants/text_strings.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GoogleAuthService {

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
    clientId: '656905819433-us2s2iua14rkpdufhr8cikqjau54fj8n.apps.googleusercontent.com', // Replace with your Web Client ID from Google Cloud Console
  );

  Future<void> signInWithGoogle() async {
    print("Starting Google Sign-In process...");

    try {
      // Prompt user to sign in
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      print("Google sign-in completed.");

      // Check if the user cancelled the process
      if (googleUser == null) {
        print("User cancelled the sign-in");
        return;
      }

      // Log Google user details
      print("Google user details: ${googleUser.displayName}, ${googleUser.email}");

      // Authenticate with Google
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      // Log authentication success
      print("Authentication successful. ID Token: ${googleAuth.idToken}");

      // Extract user details
      final String name = googleUser.displayName ?? "Unknown";
      final String email = googleUser.email;
      final String photoUrl = googleUser.photoUrl ?? "";

      print("Extracted user data: Name: $name, Email: $email, Photo URL: $photoUrl");

      // Send user data to your backend
      await _sendDataToBackend(name, email, photoUrl, googleAuth.idToken);
    } catch (error) {
      print("Error during Google Sign-In: $error");
    }
  }

  Future<void> _sendDataToBackend(
      String name, String email, String photoUrl, String? idToken) async {
    print("Preparing to send user data to backend...");

    final url = Uri.parse('http://<your-backend-url>/auth/google'); // Replace with your backend URL
    print("Backend URL: $url");

    try {
      // Make a POST request to the backend
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
      } else {
        print("Failed to send user data: ${response.body}");
      }
    } catch (e) {
      print("Error sending data to backend: $e");
    }
  }
}
