import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../constants/text_strings.dart';


class AuthService {
  // Login Function
  static Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse("$ipAddress/api/auth/login");
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        return {"success": true, "data": json.decode(response.body)};
      } else {
        final error = json.decode(response.body);
        return {"success": false, "message": error['message'] ?? "Unknown error"};
      }
    } catch (e) {
      return {"success": false, "message": "Failed to connect to the server"};
    }
  }

  // Signup Function
  static Future<Map<String, dynamic>> signup(String name, String email, String password) async {
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
}
