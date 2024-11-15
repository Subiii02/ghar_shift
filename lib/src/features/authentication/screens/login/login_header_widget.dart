import 'package:flutter/material.dart';
import 'package:ghar_shift/src/constants/image_strings.dart';
import 'package:ghar_shift/src/constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
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
