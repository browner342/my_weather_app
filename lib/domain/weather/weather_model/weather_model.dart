import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherModel {
  String icon;
  List<Color> colors;
  String descp;

  void getWeatherValues(int condition) {
    //ThunderStorm
    if (condition < 300) {
      icon = '🌩';
      descp = 'Stormy';
      colors = [Color(0xFFD1D1C9), Color(0xFF696965)];
    } else if (condition < 400) {
      //Drizzle
      icon = '🌧';
      descp = 'Drizzly';
      colors = [Color(0xFFDFDFDF), Color(0xFF707070)];
    } else if (condition < 600) {
      //Rain
      icon = '☔️';
      descp = 'Rainy';
      colors = [
        Color(0xFF1A6DCC),
        Color(0xFF4E8DD5),
        Color(0xFF3568A0),
        Color(0xFF0D3766)
      ];
    } else if (condition < 700) {
      //Snow
      icon = '☃️';
      descp = 'Snowy';
      colors = [
        Color(0xFFB4D1F8),
        Color(0xFFE4F1F5),
        Color(0xFFE4F1F5),
      ];
    } else if (condition < 800) {
      //Atmosphere
      icon = '🌫';
      descp = 'Clear sky';
      colors = [Color(0xFF2BAAF8), Color(0xFF73DDFC)];
    } else if (condition == 800) {
      //Sun
      icon = '☀️';
      descp = 'Sunny';
      colors = [Colors.white, Colors.blue];
    } else if (condition <= 804) {
      //Clouds
      icon = '☁️';
      descp = 'Cloudy';
      colors = [Color(0xFF156ABF), Color(0xFFAFD4F8)];
    } else {
      //other
      icon = '🤷‍';
      descp = 'Other';
      colors = [Color(0xFF381EE6), Color(0xFF381EE6)];
    }
  }
}
