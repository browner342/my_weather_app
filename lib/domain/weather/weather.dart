import 'package:my_weather_app/domain/weather/weather_components/sun_set_rise.dart';
import 'package:my_weather_app/domain/weather/weather_components/weather_hourly.dart';
import 'package:my_weather_app/domain/weather/weather_components/weather_now.dart';
import 'package:my_weather_app/domain/weather/weather_components/weather_weekly.dart';
import 'package:my_weather_app/domain/weather/weather_components/wind.dart';

class Weather {
  Weather({this.cityName});
  final String cityName;

  WeatherNow weatherNow = WeatherNow();
  WeatherHourly weatherHourly = WeatherHourly();
  WeatherWeekly weatherWeekly = WeatherWeekly();
  Wind wind = Wind();
  SunSetRise sunSetRise = SunSetRise();
}
