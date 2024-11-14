import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_shift/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:ghar_shift/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:ghar_shift/src/constants/colors.dart';
import 'package:ghar_shift/src/constants/image_strings.dart';
import 'package:ghar_shift/src/constants/size.dart';
import 'package:ghar_shift/src/constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final controller = Get.put(FadeInAnimationController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.startAnimation(); // Ensure animation starts
    });

    // MediaQuery for responsiveness
    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkMode ? SlightGray : SDarkColor,
        body: Stack(
          children: [
            SFadeInAnimation(
              isTwoWayAnimation: false,
              durationInMs: 1200,
              animate: SAnimatePosition(
                bottomAfter: 0,
                bottomBefore: -100,
                leftBefore: 0,
                leftAfter: 0,
                topAfter: 0,
                topBefore: 0,
                rightAfter: 0,
                rightBefore: 0,
              ),
              child: Container(
                padding: const EdgeInsets.all(SDefaultSize),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Welcome Image
                    Hero(
                      tag: 'welcome-image-tag',
                      child: Image(
                        image: const AssetImage(SWelcomeScreenImage),
                        width: width * 0.7,
                        height: height * 0.6,
                      ),
                    ),

                    // Welcome Title and Subtitle
                    Column(
                      children: [
                        Text(
                          SWelcomeTitle,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          SWelcomeSubTitle,
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),

                    //Login and Signup Buttons
                    Row(
                      children: [
                      Expanded(
                      child: OutlinedButton(
                           onPressed: () => Get.to(() => const LoginScreen()),
                          child: Text(SLogin.toUpperCase()),
                         ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Get.to(() => const SignupScreen()),
                            child: Text(SSignup.toUpperCase()),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
