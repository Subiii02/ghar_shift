import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController{
  static SplashScreenController get find => Get.find();
  RxBool animate = false.obs;

  Future startAnimation() async{
    await Future.delayed(const Duration(milliseconds: 50));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 50));
    // Get.to(welcomeScreen());
    //navigator.pushReplacement( Context, MaterialPageRoute(builder: (context) => Welcome
  }
}