import 'package:flutter/material.dart';

import 'package:moodanalytics/model/moodModel.dart';
import 'package:moodanalytics/services/services.dart';
import 'package:moodanalytics/view/homeScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    goToHomeScreen(context);
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future goToHomeScreen(BuildContext context) async {
    final List<MoodModel> moodList = await Services.getMoodResponse();
    await Future.delayed(const Duration(seconds: 5));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => HomeScreen(moodList: moodList),
    ));
  }
}
