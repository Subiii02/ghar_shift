import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/image_strings.dart';
import '../../../../../constants/text_strings.dart';

class DriverLoginHeaderWidget extends StatelessWidget {
  const DriverLoginHeaderWidget({
    super.key,
    required this.size,
    required String image,
    required String subtitle,
    required String title,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(SWelcomeScreenImage),
          height: size.height *0.2,
        ),
        Text(SLoginTitle,style: Theme.of(context).textTheme.bodyLarge, ),
        Text(SLoginSubTitle, style: Theme.of(context).textTheme.bodyMedium,),
      ],
    );
  }
}