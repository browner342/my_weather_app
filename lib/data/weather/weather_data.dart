import 'package:geocoder/geocoder.dart';
import 'package:my_weather_app/data/constants/constants.dart';
import 'package:my_weather_app/data/networking/networking.dart';

class WeatherData {
  var _weatherData;

  dynamic get getWeatherData => _weatherData;

  Future<dynamic> weatherDataFromNet(String cityName) async {
    try {
      var address = await Geocoder.local.findAddressesFromQuery(cityName);
      var coords = address.first.coordinates;

      Networking networking = Networking(
          'https://api.openweathermap.org/data/2.5/onecall?lat=${coords.latitude}&lon=${coords.longitude}&appid=$kApiKey&units=metric');

      _weatherData = await networking.getData();

      return _weatherData;
    } catch (e) {
      //  TODO: think and cache exeptions
      print(e);
      return null;
    }
  }
}
