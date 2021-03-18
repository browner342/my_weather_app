import 'package:flutter/material.dart';
import 'package:my_weather_app/domain/cites_weather.dart';
import 'package:my_weather_app/presentation/constants/const_styles.dart';
import 'package:provider/provider.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class FrontCardContent extends StatelessWidget {
  FrontCardContent({this.cityName, this.positionedNumber});
  final String cityName;
  final int positionedNumber;

  @override
  Widget build(BuildContext context) {
    final actual =
        Provider.of<CitiesWeather>(context).citiesWeather[cityName].weatherNow;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              cityName,
              style: kTitleStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(actual.weatherIcon),
          ),
          Text(
            actual.condition.capitalize(),
          ),
          Text(actual.temperatureDay.toString()),
        ],
      ),
    );
  }
}
