import 'package:flutter/material.dart';
import 'package:my_weather_app/domain/constants/constants.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherWeekly {
  List<int> temperatureDay = List.filled(kAmoutWeeklyComponents, 0);
  List<int> temperatureNight = List.filled(kAmoutWeeklyComponents, 0);
  List<IconData> weatherIcon =
      List.filled(kAmoutWeeklyComponents, WeatherIcons.alien);

  // List<double> get temperatureDay => _temperatureDay;
  // List<double> get temperatureNight => _temperatureNight;
  // List<String> get weatherIcon => _weatherIcon;
}
