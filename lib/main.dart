import 'package:flutter/material.dart';
import 'package:moodanalytics/constants/colors.dart';

import 'package:moodanalytics/view/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
          primaryColor: backGroundColor,
          scaffoldBackgroundColor: backGroundColor),
    );
  }
}
