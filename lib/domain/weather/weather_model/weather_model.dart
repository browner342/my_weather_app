import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherModel {
  IconData icon;
  List<Color> colors;
  String descp;

  void getWeatherValues(int condition) {
    //ThunderStorm
    if (condition < 300) {
      icon = WeatherIcons.thunderstorm;
      descp = 'Stormy';
      colors = [Color(0xFFD1D1C9), Color(0xFF696965)];
    } else if (condition < 400) {
      //Drizzle
      icon = WeatherIcons.showers;
      descp = 'Drizzly';
      colors = [Color(0xFFDFDFDF), Color(0xFF707070)];
    } else if (condition < 600) {
      //Rain
      icon = WeatherIcons.rain;
      descp = 'Rainy';
      colors = [
        Color(0xFF1A6DCC),
        Color(0xFF4E8DD5),
        Color(0xFF3568A0),
        Color(0xFF0D3766)
      ];
    } else if (condition < 700) {
      //Snow
      icon = WeatherIcons.snow;
      descp = 'Snowy';
      colors = [
        Color(0xFFB4D1F8),
        Color(0xFFE4F1F5),
        Color(0xFFE4F1F5),
      ];
    } else if (condition < 800) {
      //Atmosphere
      icon = WeatherIcons.day_sunny;
      descp = 'Clear sky';
      colors = [Color(0xFF2BAAF8), Color(0xFF73DDFC)];
    } else if (condition == 800) {
      //Sun
      icon = WeatherIcons.day_sunny;
      descp = 'Sunny';
      colors = [Colors.white, Colors.blue];
    } else if (condition <= 804) {
      //Clouds
      icon = WeatherIcons.cloudy;
      descp = 'Cloudy';
      colors = [Color(0xFF156ABF), Color(0xFFAFD4F8)];
    } else {
      //other
      icon = WeatherIcons.alien;
      descp = 'Other';
      colors = [Color(0xFF381EE6), Color(0xFF381EE6)];
    }
  }
}
