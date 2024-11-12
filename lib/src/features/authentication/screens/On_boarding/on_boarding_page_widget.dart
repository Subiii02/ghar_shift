import 'package:flutter/material.dart';
import 'package:ghar_shift/src/constants/size.dart';
import 'package:ghar_shift/src/features/authentication/models/model_on_boarding.dart';

class OnBoardingPageWidget extends StatelessWidget {
  final OnBoardingModel model;

  const OnBoardingPageWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(SDefaultSize),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: size.height * 0.45,
          ),
          Column(
            children: [
              Text(
                model.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                model.subtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          Text(model.counterText, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 80.0),
        ],
      ),
    );
  }
}
