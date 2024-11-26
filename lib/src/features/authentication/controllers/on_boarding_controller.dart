import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import '../models/model_on_boarding.dart';
import '../screens/On_boarding/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: SOnBoardingImage1,
        title: SOnBoardingTitle1,
        subtitle: SOnBoardingSubTitle1,
        counterText: SOnBoardingcounter1,
        bgColor: SOnBoardingPage1Color,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: SOnBoardingImage2,
        title: SOnBoardingTitle2,
        subtitle: SOnBoardingSubTitle2,
        counterText: SOnBoardingcounter2,
        bgColor: SOnBoardingPage2Color,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: SOnBoardingImage3,
        title: SOnBoardingTitle3,
        subtitle: SOnBoardingSubTitle3,
        counterText: SOnBoardingcounter3,
        bgColor: SOnBoardingPage3Color,
      ),
    ),
  ];

  // Navigate to Welcome screen function
  void navigateToWelcomeScreen() {
    Get.offAllNamed('/welcome'); // Replace '/welcome' with the actual route name for the welcome screen
  }

  // Update the method to check if it’s the last page before navigating
  void animateToNextSlide() {
    int nextPage = (controller.currentPage + 1) % pages.length;
    if (nextPage == 0) {
      navigateToWelcomeScreen();
    } else {
      controller.animateToPage(page: nextPage);
    }
  }

  // Skip to the last page or navigate to welcome screen if already on the last page
  void skip() {
    if (controller.currentPage == pages.length - 1) {
      navigateToWelcomeScreen();
    } else {
      controller.jumpToPage(page: pages.length - 1);
    }
  }

  void onPageChangeCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }
}
