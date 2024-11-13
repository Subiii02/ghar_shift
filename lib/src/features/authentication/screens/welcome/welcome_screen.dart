import 'package:flutter/material.dart';
import 'package:ghar_shift/src/constants/colors.dart';
import 'package:ghar_shift/src/constants/image_strings.dart';
import 'package:ghar_shift/src/constants/size.dart';
import 'package:ghar_shift/src/constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var height = mediaQuery.size.height;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? SDarkColor: SlightGray,
      body: Container(
        padding: EdgeInsets.all(SDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: AssetImage(SWelcomeScreenImage), height: height * 0.6,),
            Column(
              children: [
                Text(SWelcomeTitle,
                  style:  Theme.of(context).textTheme.headlineMedium,),
                Text(SWelcomeSubTitle,
                  style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,
                ),
              ],
            ),

            Row(
              children: [
                Expanded(child: OutlinedButton(
                    onPressed: (){},
                  child: Text(SLogin.toUpperCase())
                ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: (){},

                        child: Text(SSignup))),
              ],
            )

          ],
        ),

        ),
    );
  }
}



