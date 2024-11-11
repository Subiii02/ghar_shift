
import 'package:flutter/material.dart';
import 'package:ghar_shift/src/constants/image_strings.dart';

import '';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
        children: [
          Positioned(
            top: 0,
              left: 0,
              child: Image(
                  image: AssetImage(SSplashTopIcon)),
          ),
          Positioned(
            child: Image(
                image: AssetImage(SSplashImage)),
          ),
        ],
      ),),
    );
  }
}
