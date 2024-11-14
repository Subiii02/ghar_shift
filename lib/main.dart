import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_shift/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:ghar_shift/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:ghar_shift/src/utils/Theme/Theme.dart/Theme.dart';

void main() {
  runApp(MyApp());
  Get.put(FadeInAnimationController()); // Register the controller
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'gharshift',
      theme: SAppTheme.lightTheme,
      darkTheme: SAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold (
    appBar: AppBar(title : const Text("Gharshift")),
    body: const Center(child: Text("Home page"), ),
    
  );
  }
}
