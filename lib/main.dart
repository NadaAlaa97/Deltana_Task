import 'package:deltana_task/presentation/Splash_screen/splash-screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      locale: Locale('ar', ''),
      theme: ThemeData(
        useMaterial3: true,

      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,

    );
  }
}

