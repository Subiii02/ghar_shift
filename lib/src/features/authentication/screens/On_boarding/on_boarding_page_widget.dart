import 'package:flutter/material.dart';
import 'package:ghar_shift/src/constants/size.dart';
import 'package:ghar_shift/src/features/authentication/models/model_on_boarding.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../../../constants/image_strings.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({super.key, required OnBoardingModel model});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Define the pages for LiquidSwipe
    final pages = [
      OnBoardingPage(model: OnBoardingModel(
        image: SOnBoardingImage1, // Example image path
        title: 'Welcome',
        subtitle: 'Explore our app',
        counterText: '1/3',
        bgColor: Colors.blue,
        height: size.height,
      )),
      OnBoardingPage(model: OnBoardingModel(
        image: SOnBoardingImage2,
        title: 'Discover',
        subtitle: 'Find what you need',
        counterText: '2/3',
        bgColor: Colors.green,
        height: size.height,
      )),
      OnBoardingPage(model: OnBoardingModel(
        image: SOnBoardingImage3,
        title: 'Get Started',
        subtitle: 'Begin your journey',
        counterText: '3/3',
        bgColor: Colors.orange,
        height:size.height,
      )),
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
          ),
        ],
      ),
    );
  }
}

// Rename the second widget to avoid naming conflicts
class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SDefaultSize), // Replace SDefaultSize with 16.0 or your preferred value
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: model.height * 0.4, // Adjust the image height based on screen size
          ),
          Column(
            children: [
              Text(
                  model.title,
                  style: Theme.of(context).textTheme.headlineSmall),
              Text(
                  model.subtitle,
                  textAlign: TextAlign.center),
            ],
          ),
          Text(model.counterText, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(
              height: 80.0,
          ),
        ],
      ),
    );
  }
}
