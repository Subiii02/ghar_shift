import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_shift/src/features/authentication/screens/driver/driver_login/driver_login_screen.dart';
import 'package:ghar_shift/src/features/authentication/screens/labor/labor_login/labor_login_screen.dart';
import 'package:ghar_shift/src/features/authentication/screens/login/login_screen.dart';

import '../customer/customer_login/customer_login_screen.dart';

class UserTypeSelectionScreen extends StatelessWidget {
  static const String routeName = '/user_type_selection';
  const UserTypeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Who are you?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // User Button
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const CustomerLoginScreen(), arguments: "User");
                },
                child: const Text("User"),
              ),
              const SizedBox(height: 10),
              // Driver Button
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const DriverLoginScreen(), arguments: "Driver");
                },
                child: const Text("Driver"),
              ),
              const SizedBox(height: 10),
              // Labor Button
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const LaborLoginScreen(), arguments: "Labor");
                },
                child: const Text("Labor"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
