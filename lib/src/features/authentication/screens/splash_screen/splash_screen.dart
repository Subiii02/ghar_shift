import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../common_widgets/fade_in_animation/fade_in-animation_controller.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/size.dart';
import '../../../../constants/text_strings.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';
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
