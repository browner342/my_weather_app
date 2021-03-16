import 'package:my_weather_app/domain/constants/constants.dart';
import 'package:my_weather_app/domain/weather/weather.dart';
import 'package:my_weather_app/domain/weather/weather_components/sun_set_rise.dart';
import 'package:my_weather_app/domain/weather/weather_components/weather_hourly.dart';
import 'package:my_weather_app/domain/weather/weather_components/weather_now.dart';
import 'package:my_weather_app/domain/weather/weather_components/weather_weekly.dart';
import 'package:my_weather_app/domain/weather/weather_components/wind.dart';
import 'package:my_weather_app/domain/weather/weather_model/weather_model.dart';

class DataDecoder {
  DataDecoder({this.weatherData});
  final weatherData;

  Weather weather = Weather();

  WeatherModel weatherModel = WeatherModel();
  int conditions;

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

    var temp = weatherData['current']['temp'];
    if (temp.runtimeType == double) {
      actual.temperatureDay = temp.toInt();
    } else {
      actual.temperatureDay = temp;
    }

    actual.condition = weatherData['current']['weather'][0]['description'];

    conditions = weatherData['current']['weather'][0]['id'];
    weatherModel.getWeatherValues(conditions);
    actual.weatherIcon = weatherModel.icon;
    actual.color = weatherModel.color;

    return actual;
  }

  WeatherHourly _decodeWeatherHourly() {
    var actual = weather.weatherHourly;

    for (int i = 0; i < kAmoutHourlyComponents; i++) {
      var temp = weatherData['hourly'][i]['temp'];
      if (temp.runtimeType == double) {
        actual.temperature[i] = temp.toInt();
      } else {
        actual.temperature[i] = temp;
      }

      conditions = weatherData['hourly'][i]['weather'][0]['id'];
      weatherModel.getWeatherValues(conditions);
      actual.weatherIcon[i] = weatherModel.icon;
    }

    return actual;
  }

  WeatherWeekly _decodeWeatherWeekly() {
    var actual = weather.weatherWeekly;
    for (int i = 0; i < kAmoutWeeklyComponents; i++) {
      var tempDay = weatherData['daily'][i]['temp']['max'];
      var tempNight = weatherData['daily'][i]['temp']['min'];
      if (tempDay.runtimeType == double) {
        actual.temperatureDay[i] = tempDay.toInt();
      } else {
        actual.temperatureDay[i] = tempDay;
      }
      if (tempNight.runtimeType == double) {
        actual.temperatureNight[i] = tempNight.toInt();
      } else {
        actual.temperatureNight[i] = tempNight;
      }

      conditions = weatherData['daily'][i]['weather'][0]['id'];
      weatherModel.getWeatherValues(conditions);
      actual.weatherIcon[i] = weatherModel.icon;

    }

    return actual;
  }

  Wind _decodeWind() {
    var actual = weather.wind;
    double tmp;
    actual.direction = weatherData['current']['wind_deg'].toString();
    tmp = weatherData['current']['wind_speed'] * 3.6;
    actual.speed = tmp.toInt();

    return actual;
  }

  SunSetRise _decodeSunSetRise() {
    var actual = weather.sunSetRise;
    int tmp = weatherData['current']['sunrise'];
    actual.sunRiseTime = DateTime.fromMillisecondsSinceEpoch(tmp * 1000);

    tmp = weatherData['current']['sunset'];
    actual.sunSetTime = DateTime.fromMillisecondsSinceEpoch(tmp * 1000);

    return actual;
  }
}
