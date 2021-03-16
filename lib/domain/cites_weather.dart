import 'package:flutter/foundation.dart';
import 'package:my_weather_app/data/weather/data_decoder.dart';
import 'package:my_weather_app/data/weather/weather_data.dart';
import 'package:my_weather_app/domain/weather/weather.dart';

class CitiesWeather extends ChangeNotifier {
  var citiesWeather = Map();
  List<DataDecoder> dataDecoderList;

  CitiesWeather() {
    citiesWeather[''] = Weather();
  }

  void setCityWeather(List<String> cityNames) async {
    citiesWeather.clear();
    int index = 0;
    List<Weather> weatherList = await _getDecodedWeatherData(cityNames);

    for (String cityName in cityNames) {
      citiesWeather['$cityName'] = weatherList[index];
      index++;
    }

    notifyListeners();
  }

  Future<List<Weather>> _getDecodedWeatherData(List<String> cityNames) async {
    List<Weather> weatherDataList = [];
    for (String cityName in cityNames) {
      var weatherData = await WeatherData().weatherDataFromNet(cityName);

      DataDecoder dataDecoder = DataDecoder(weatherData: weatherData);
      Weather weather = dataDecoder.decodeData();
      weatherDataList.add(weather);
    }

    return weatherDataList;
  }
}
