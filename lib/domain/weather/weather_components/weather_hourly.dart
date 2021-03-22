import 'package:flutter/material.dart';
import 'package:my_weather_app/domain/constants/constants.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherHourly {
  List<int> temperature = List.filled(kAmoutHourlyComponents, 0);
  List<IconData> weatherIcon =
      List.filled(kAmoutHourlyComponents, WeatherIcons.alien);

  // List<double> get temperature => _temperature;
  // List<String> get weatherIcon => _weatherIcon;
}
