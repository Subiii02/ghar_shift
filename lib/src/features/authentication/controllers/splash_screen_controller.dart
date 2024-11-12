import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_shift/src/features/authentication/screens/On_boarding/on_boarding_screen.dart';

class SplashScreenController extends GetxController{
  static SplashScreenController get find => Get.find();
  RxBool animate = false.obs;

  Future startAnimation() async{
    await Future.delayed(const Duration(milliseconds: 50));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 50));
     Get.to(const OnBoardingScreen());
    //navigator.pushReplacement( Context, MaterialPageRoute(builder: (context) => Welcome
  }
}