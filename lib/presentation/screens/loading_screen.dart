import 'package:flutter/material.dart';
import 'package:my_weather_app/domain/cites_weather.dart';
import 'package:my_weather_app/presentation/constants/const_names.dart';
import 'package:my_weather_app/presentation/constants/const_styles.dart';
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
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SplashScreen(
            navigateAfterFuture: fetchData(),
            title: Text(
              'My Weather App',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey.shade800,
              ),
            ),
            image: Image(
              image: AssetImage(
                'images/MyWeatherAppLogo.png',
              ),
            ),
            photoSize: 50.0,
            backgroundColor: kBackgroundColor,
            loaderColor: Colors.blueGrey.shade800,
          ),
        ),
      ),
    );
  }
}
