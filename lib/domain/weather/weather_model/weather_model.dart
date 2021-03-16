import 'dart:ui';

class WeatherModel {
  String icon;
  Color color;
  String descp;

  void getWeatherValues(int condition) {
    //ThunderStorm
    if (condition < 300) {
      icon = '🌩';
      descp = 'Stormy';
      color = Color(0xFF381EE6);
    } else if (condition < 400) {
      //Drizzle
      icon = '🌧';
      descp = 'Drizzly';
      color = Color(0xFF168EEF);
    } else if (condition < 600) {
      //Rain
      icon = '☔️';
      descp = 'Rainy';
      color = Color(0xff064fa3);
    } else if (condition < 700) {
      //Snow
      icon = '☃️';
      descp = 'Snowy';
      color = Color(0xFFD8E1F2);
    } else if (condition < 800) {
      //Atmosphere
      icon = '🌫';
      descp = 'Clear sky';
      color = Color(0xff59d6fa);
    } else if (condition == 800) {
      //Sun
      icon = '☀️';
      descp = 'Sunny';
      // color = Color(0xFFFFD969);
      color = Color(0xfff6eb96);
    } else if (condition <= 804) {
      //Clouds
      icon = '☁️';
      descp = 'Cloudy';
      color = Color(0xFF5C70C2);
    } else {
      //other
      icon = '🤷‍';
      descp = 'Other';
      color = Color(0xFFDFE6EA);
    }
  }
}
