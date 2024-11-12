import 'package:flutter/material.dart';
import 'package:ghar_shift/src/constants/text_strings.dart';
import 'package:ghar_shift/src/features/authentication/models/model_on_boarding.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import 'on_boarding_page_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final pages = [
      OnBoardingPageWidget(
        model: OnBoardingModel(
          image: SOnBoardingImage1,
          title: SOnBoardingTitle1,
          subtitle: SOnBoardingSubTitle1,
          counterText: SOnBoardingcounter1,
          bgColor: SOnBoardingPage1Color,
          height: size.height,
        ),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
          image: SOnBoardingImage2,
          title: SOnBoardingTitle2,
          subtitle: SOnBoardingSubTitle2,
          counterText: SOnBoardingcounter2,
          bgColor: SOnBoardingPage2Color,
          height: size.height,
        ),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
          image: SOnBoardingImage3,
          title: SOnBoardingTitle3,
          subtitle: SOnBoardingSubTitle3,
          counterText: SOnBoardingcounter3,
          bgColor: SOnBoardingPage3Color,
          height: size.height,
        ),
      ),
    ];

    final controller = LiquidController();
    return Scaffold(
      body: Stack(
      
        children: [
          LiquidSwipe(
            pages: pages,
            liquidController: controller,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
            bottom: 60.0,
            left: MediaQuery.of(context).size.width * 0.5 - 30,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.black26),
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
                backgroundColor: Color(0xff272727),
              ),
              child: Icon(Icons.arrow_forward_ios, color: Colors.white),
            ),
          ),
          Positioned(
              top: 50,
              right: 20,
              child: TextButton(onPressed: (){},
                  child: Text("Skip", style: TextStyle(color: Colors.grey),)
              )
          ),
          Positioned(
               bottom: 10,
              child: AnimatedSmoothIndicator(
                count: 3,
            activeIndex: controller.currentPage,
                effect: const WormEffect(
                  activeDotColor: Color(0xff272727),
                  dotHeight : 5.0,

                )

          ))
        ],
      ),
    );
  }
}
