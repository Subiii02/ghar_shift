import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_shift/src/features/authentication/controllers/on_boarding_controller.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obcontroller = Get.put(OnBoardingController()); // Use Get.put to make it reactive

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obcontroller.pages,
            liquidController: obcontroller.controller,
            onPageChangeCallback: obcontroller.onPageChangeCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: obcontroller.animateToNextSlide,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.black26),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                backgroundColor: const Color(0xff272727),
              ),
              child: const Icon(Icons.arrow_forward_ios, color: Colors.white),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: obcontroller.skip,
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Obx(
                () => Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                count: obcontroller.pages.length,
                activeIndex: obcontroller.currentPage.value,
                effect: const WormEffect(
                  activeDotColor: Color(0xff272727),
                  dotHeight: 5.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
