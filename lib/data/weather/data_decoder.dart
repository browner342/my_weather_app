import 'package:my_weather_app/domain/constants/constants.dart';
import 'package:my_weather_app/domain/weather/weather.dart';
import 'package:my_weather_app/domain/weather/weather_components/sun_set_rise.dart';
import 'package:my_weather_app/domain/weather/weather_components/weather_hourly.dart';
import 'package:my_weather_app/domain/weather/weather_components/weather_now.dart';
import 'package:my_weather_app/domain/weather/weather_components/weather_weekly.dart';
import 'package:my_weather_app/domain/weather/weather_components/wind.dart';

class DataDecoder {
  DataDecoder({this.weatherData});
  final weatherData;

  Weather weather = Weather();

  Weather decodeData() {
    if (weatherData != null) {
      weather.weatherNow = _decodeWeatherNow();
      weather.weatherHourly = _decodeWeatherHourly();
      weather.weatherWeekly = _decodeWeatherWeekly();
      weather.wind = _decodeWind();
      weather.sunSetRise = _decodeSunSetRise();
    } else {
      weather = Weather();
    }

    return weather;
  }

  WeatherNow _decodeWeatherNow() {
    var actual = weather.weatherNow;
    actual.temperatureDay = weatherData['current']['temp'];
    actual.condition = weatherData['current']['weather'][0]['description'];
    actual.weatherIcon = weatherData['current']['weather'][0]['id'].toString();

    return actual;
  }

  WeatherHourly _decodeWeatherHourly() {
    var actual = weather.weatherHourly;
    for (int i = 0; i < kAmoutHourlyComponents; i++) {
      actual.temperature[i] = weatherData['hourly'][i]['temp'];
      actual.weatherIcon[i] =
          weatherData['hourly'][i]['weather'][0]['id'].toString();
    }

    return actual;
  }

  WeatherWeekly _decodeWeatherWeekly() {
    var actual = weather.weatherWeekly;
    for (int i = 0; i < kAmoutWeeklyComponents; i++) {
      actual.temperatureDay[i] = weatherData['daily'][i]['temp']['max'];
      actual.temperatureNight[i] = weatherData['daily'][i]['temp']['min'];
      actual.weatherIcon[i] =
          weatherData['daily'][i]['weather'][0]['id'].toString();
    }

    return actual;
  }

  Wind _decodeWind() {
    var actual = weather.wind;
    actual.direction = weatherData['current']['wind_deg'].toString();
    actual.speed = weatherData['current']['wind_speed'];

    return actual;
  }

  SunSetRise _decodeSunSetRise() {
    var actual = weather.sunSetRise;
    actual.sunRiseTime = weatherData['current']['sunrise'];
    actual.sunSetTime = weatherData['current']['sunset'];

    return actual;
  }
}
