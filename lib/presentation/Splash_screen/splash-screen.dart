import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:deltana_task/presentation/OnBoardingScreen/onboarding_screen.dart';
import 'package:deltana_task/utils/my_theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      splashScreenBody:  Center(child: Image.asset("assets/images/logosp.png")),


    backgroundColor: MyTheme.myYellow,
      nextScreen: OnBoardingScreen(),
      useImmersiveMode: true,
      duration: Duration(seconds: 3),
    );
  }
}
