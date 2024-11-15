import 'package:flutter/material.dart';
import 'package:ghar_shift/src/constants/image_strings.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
final String image,title,subTitle;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: AssetImage(SWelcomeScreenImage), height: size.height *0.2,),
        Text(title,style: Theme.of(context).textTheme.bodyLarge, ),
        Text(subTitle, style: Theme.of(context).textTheme.bodyMedium,),
      ],
    );
  }
}