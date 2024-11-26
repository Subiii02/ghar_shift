import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';
import '../login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = '/welcome';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkMode ? SlightGray : SSecondaryColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Title
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  SWelcomeTitle,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Subtitle
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  SWelcomeSubTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const Spacer(),

              // Image in the center
              Center(
                child: Image.asset(
                  SWelcomeScreenImage,
                  height: 200, // Adjust size as needed
                  width: 200,
                ),
              ),

              const SizedBox(height: 30),

              // Role Selection Buttons
              Column(
                children: [
                  _buildRoleButton(
                    context,
                    "User",
                    Icons.person,
                        () {
                      Get.to(() => LoginScreen());
                      Get.snackbar(
                        "Login",
                        "You are logging in as a User",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  _buildRoleButton(
                    context,
                    "Driver",
                    Icons.drive_eta,
                        () {
                      Get.to(() => LoginScreen());
                      Get.snackbar(
                        "Login",
                        "You are logging in as a Driver",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  _buildRoleButton(
                    context,
                    "Labor",
                    Icons.construction,
                        () {
                      Get.to(() => LoginScreen());
                      Get.snackbar(
                        "Login",
                        "You are logging in as a Labor",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget to Create Role Buttons
  Widget _buildRoleButton(
      BuildContext context,
      String title,
      IconData icon,
      VoidCallback onTap,
      ) {
    return ElevatedButton.icon(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: SprimaryBlue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      icon: Icon(icon, size: 24),
      label: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

