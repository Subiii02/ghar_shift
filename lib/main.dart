import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_shift/src/features/authentication/screens/On_boarding/on_boarding_screen.dart';
import 'package:ghar_shift/src/features/authentication/screens/forget_password/forgot_password_screen.dart';
import 'package:ghar_shift/src/features/authentication/screens/login/login_screen.dart';
import 'package:ghar_shift/src/features/authentication/screens/signup/widgets/signup_screen.dart';
import 'package:ghar_shift/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:ghar_shift/src/features/authentication/screens/user_type_selection_screen/user_type_selection_screen.dart';
import 'package:ghar_shift/src/features/authentication/screens/welcome/welcome_screen.dart';

import 'src/features/authentication/screens/user_dashboard_screen/user_dashboard_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ghar Shift',
      initialRoute: '/user_dashboard',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/onboarding', page: () => const OnBoardingScreen()),
        GetPage(name: '/welcome', page: () => const WelcomeScreen()),
        GetPage(name: '/user-type', page: () => const UserTypeSelectionScreen()),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/signup', page: () => const SignupScreen()),
        GetPage(name: '/forgot-password', page: () => const ForgotPasswordScreen()),
        GetPage(name: '/user_dashboard', page: () => UserDashboard()),
      ],

      unknownRoute: GetPage(
        name: '/not-found',
        page: () => const Scaffold(
          body: Center(
            child: Text('Page Not Found'),
          ),
        ),
      ),
    );
  }
}
