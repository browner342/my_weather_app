import 'package:flutter/foundation.dart';
import 'package:my_weather_app/data/weather/data_decoder.dart';
import 'package:my_weather_app/data/weather/weather_data.dart';
import 'package:my_weather_app/domain/weather/weather.dart';

class CitiesWeather extends ChangeNotifier {
  var citiesWeather = Map<String, Weather>();
  List<DataDecoder> dataDecoderList;

  // CitiesWeather() {
  //   citiesWeather[''] = Weather();
  // }

  Future<void> setCityWeather(List<String> cityNames) async {
    citiesWeather.clear();

    //crating weather list with weather items
    List<Weather> weatherList = await _getDecodedWeatherData(cityNames);

    for (int index = 0; index < cityNames.length; index++) {
      citiesWeather['${cityNames[index]}'] = weatherList[index];
    }

    notifyListeners();
  }

  Future<List<Weather>> _getDecodedWeatherData(List<String> cityNames) async {
    List<Weather> weatherDataList = [];
    for (int i = 0; i < cityNames.length; i++) {
      //download data from API
      var weatherData = await WeatherData().weatherDataFromNet(cityNames[i]);

      // decode data to weather class
      DataDecoder dataDecoder = DataDecoder(weatherData: weatherData);
      Weather weather = dataDecoder.decodeData();

      weatherDataList.add(weather);
    }

    return weatherDataList;
  }
}
