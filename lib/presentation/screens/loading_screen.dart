import 'package:flutter/material.dart';
import 'package:my_weather_app/domain/cites_weather.dart';
import 'package:my_weather_app/presentation/constants/const_names.dart';
import 'package:my_weather_app/presentation/data/city_data.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

import 'main_screen/main_screen.dart';

class LoadingScreen extends StatefulWidget {
  static const String id = kLoadingScreenId;

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<String> fetchData() async {
    await Provider.of<CityData>(context, listen: false).getDataFromMemory();
    await Provider.of<CityData>(context, listen: false).firstElemMyLocation();

    List<String> cityNames =
        Provider.of<CityData>(context, listen: false).showCities;

    await Provider.of<CitiesWeather>(context, listen: false)
        .setCityWeather(cityNames);

    return MainScreen.id;
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      navigateAfterFuture: fetchData(),
      title: Text('My Weather App'),
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
    );
  }
}
