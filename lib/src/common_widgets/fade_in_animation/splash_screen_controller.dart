import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../features/authentication/screens/welcome/welcome_screen.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find();
  RxBool animate = false.obs;

  Future startAnimation() async {
    // Start the animation after a short delay
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;

    // Wait for the animation duration, then navigate
    await Future.delayed(const Duration(milliseconds: 5000));
    Get.offNamed(WelcomeScreen.routeName); // Ensure `WelcomeScreen` has a route name
  }
}
