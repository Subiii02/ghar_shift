import 'package:flutter/material.dart';
import 'package:ghar_shift/src/constants/size.dart';
import 'package:ghar_shift/src/constants/text_strings.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../constants/colors.dart';
import '../../constants/image_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
              pages: [
                OnBoardingPage(size: size)
              ]
          )
        ],
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SDefaultSize),
        color: SOnBoardingPage1Color,
     child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         Image(image: AssetImage(SOnBoardingImage1, height: size.height * 0.5,)),

         Column(
           children: [
             Text(SOnBoardingTitle1, style: Theme.of(context).textTheme.headlineSmall),
             Text(SOnBoardingSubTitle1, textAlign: TextAlign.center,),
           ],
         ),
         Text(SOnBoardingcounter1, style: Theme.of(context).textTheme.headlineMedium,),
         SizedBox(height: 50.0,)
       ],
     )
    Container(color: SOnBoardingPage2Color),
    Container(color: SOnBoardingPage3Color),
    );
  }
}
