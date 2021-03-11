import 'package:flutter/material.dart';
import 'package:my_weather_app/presentation/constants/const_names.dart';
import 'package:splashscreen/splashscreen.dart';

import 'main_screen/main_screen.dart';

class LoadingScreen extends StatefulWidget {
  static const String id = kLoadingScreenId;

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: MainScreen(),
      title: Text('My Weather App'),
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
    );
  }
}
