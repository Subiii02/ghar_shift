import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_shift/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:ghar_shift/src/constants/colors.dart';
import 'package:ghar_shift/src/constants/image_strings.dart';
import 'package:ghar_shift/src/constants/size.dart';
import 'package:ghar_shift/src/constants/text_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller outside the build method
    final controller = Get.put(FadeInAnimationController());

    // Trigger animation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.startSplashAnimation();
    });

    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          // Observe animation state dynamically
          final animate = controller.animate.value;

          return Stack(
            children: [
              // Top Icon Animation
              AnimatedPositioned(
                duration: const Duration(milliseconds: 1200),
                top: animate ? 0 : -30,
                left: animate ? 0 : -30,
                child: const Image(image: AssetImage(SSplashTopIcon)),
              ),
              // App Name and Tagline Animation
              AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                top: 100,
                left: animate ? SDefaultSize : -100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      SAppName,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      SAppTagLine,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              // Splash Image Animation
              AnimatedPositioned(
                duration: const Duration(milliseconds: 2000),
                bottom: animate ? 100 : 0,
                child: const Image(image: AssetImage(SSplashImage)),
              ),
              // Circular Container Animation
              AnimatedPositioned(
                duration: const Duration(milliseconds: 2000),
                bottom: animate ? 60 : 0,
                right: SDefaultSize,
                child: Container(
                  width: SSplashContainerSize,
                  height: SSplashContainerSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: SPrimaryColor,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
