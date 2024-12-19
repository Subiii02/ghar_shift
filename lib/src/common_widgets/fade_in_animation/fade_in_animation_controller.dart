
import 'package:get/get.dart';
import 'package:ghar_shift/src/features/authentication/screens/welcome/welcome_screen.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find();

  // Reactive animation state
  RxBool animate = false.obs;

  // Starts the splash screen animation sequence
  Future<void> startSplashAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true; // Start the animation
    await Future.delayed(const Duration(milliseconds: 3000));
    animate.value = false; // Reset the animation
    await Future.delayed(const Duration(milliseconds: 2000));
    Get.offAll(() => const WelcomeScreen()); // Navigate to WelcomeScreen
  }

  // Starts a generic animation
  Future<void> startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
  }
}
