import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherNow {
  int temperatureDay = 0;
  IconData weatherIcon = WeatherIcons.alien;
  String condition = 'Error';
  List<Color> colors = [Colors.white, Colors.blue];
}
