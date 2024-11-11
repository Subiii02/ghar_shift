import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_shift/src/constants/image_strings.dart';
import 'package:ghar_shift/src/constants/size.dart';
import 'package:ghar_shift/src/constants/text_strings.dart';
import 'package:ghar_shift/src/features/authentication/controllers/splash_screen_controller.dart';

import '../../../../constants/colors.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashcontroller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashcontroller.startAnimation();
    return Scaffold(
      body: Stack(
        children: [
          Obx( () => AnimatedPositioned(
              top: splashcontroller.animate.value ? 0 : -30,
              left: splashcontroller.animate.value ? 0 : 30,
              duration: const Duration(milliseconds: 1600),
              child: const Image(image: AssetImage(SSplashTopIcon)),
            ),
          ),
          Obx( () =>AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: 80,
              left: splashcontroller.animate.value ? SDefaultSize : -80,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: splashcontroller.animate.value ? 1 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(SAppName, style: Theme.of(context).textTheme.headlineMedium),
                    Text(SAppTagLine, style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
            ),
          ),
          Obx( () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: 100,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2400),
                opacity: splashcontroller.animate.value ? 1 : 0,
                child: const Image(image: AssetImage(SSplashImage)),
              ),
            ),
          ),
          Obx( () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: splashcontroller.animate.value ? 60 : 0,
              right: SDefaultSize,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: splashcontroller.animate.value ? 1 : 0,
                child: Container(
                  width: SSplashContainerSize,
                  height: SSplashContainerSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: SPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
